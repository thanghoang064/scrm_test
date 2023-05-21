<?php

//require_once('include/MVC/View/views/view.list.php');
require_once('include/MVC/View/SugarView.php');
require_once('include/Sugar_Smarty.php');
include_once 'custom/modules/Leads/common.php';
class CustomLeadsViewLeadfortelesale extends SugarView
{
    public function display() {
		global $db, $current_user;
        $ss = new Sugar_Smarty();
        $common = new CommonNE();
        // var_dump($limit);
        $src= $common->getListLeadForTelesale();
     
        $ss->assign('record',$src->result);
        $ss->assign('page_now',$src->page_now);
        $ss->assign('limit',$src->limit);
        $ss->assign('page',$src->page);
        $ss->assign('totals',$src->total);
        $ss->assign('count',$src->count);
        $ss->assign('page_start',$src->page_start);
        
        $last       = ceil( $src->total / $src->limit );
        $start = 0;
        $link = 10;

        // $start      = ( ( $src->page - $links ) > 0 ) ? $src->page - $links : 1;
        // $end        = ( ( $src->page + $links ) < $last ) ? $src->page + $links : $last;
        $list_class = 'Hello';
        // $class = 'Hello';
       



        $paginate ="<style>
        .pagination {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            padding-left: 0;
            list-style: none;
            border-radius: .25rem;
        }
        .page-item:first-child .page-link {
            margin-left: 0;
            border-top-left-radius: .25rem;
            border-bottom-left-radius: .25rem;
        }
        .page-link:not(:disabled):not(.disabled) {
            cursor: pointer;
        }
        .page-link {
            position: relative;
            display: block;
            padding: .5rem .75rem;
            margin-left: -1px;
            line-height: 1.25;
            color: #007bff;
            background-color: #fff;
            border: 1px solid #dee2e6;
        }   
        </style>";
        $paginate       .= '<nav aria-label="Page navigation example">';
        $paginate       .= '<ul class="pagination">';
        $left_dotted=false;
        $right_dotted=false;
        for ( $i = $start ; $i < $last; $i++ ) {
            if($page==$i && $page == 0){
                $paginate   .= '<li class="page-item"><a class="page-link" href="index.php?module=Leads&action=leadfortelesale&limit=' . $src->limit . '&page=' . $i . '">&laquo;</a></li>';
 
            }
            if($i < $src->page - $link && $left_dotted == false){
                $left_dotted = true;
                $paginate   .= '<li class="page-item"><a class="page-link" style="color:black;cursor:not-allowed">...</a></li>';
            }
            if( $i <= $src->page && $i >= $src->page - $link){
                if($i == $src->page){
                    $paginate   .= '<li class="page-item"><a class="page-link" style="color:black;background:#ced8e1;cursor:not-allowed;" href="index.php?module=Leads&action=leadfortelesale&limit=' . $src->limit . '&page=' . $i . '">' . $i . '</a></li>';

                }else{
                    $paginate   .= '<li class="page-item"><a class="page-link" href="index.php?module=Leads&action=leadfortelesale&limit=' . $src->limit . '&page=' . $i . '">' . $i . '</a></li>';

                }
            }
            if( $i > $src->page && $i <= $src->page + $link){
                if($i == $src->page){
                    $paginate   .= '<li class="page-item"><a class="page-link" style="color:black;background:#ced8e1;cursor:not-allowed;" href="index.php?module=Leads&action=leadfortelesale&limit=' . $src->limit . '&page=' . $i . '">' . $i . '</a></li>';

                }else{
                    $paginate   .= '<li class="page-item"><a class="page-link" href="index.php?module=Leads&action=leadfortelesale&limit=' . $src->limit . '&page=' . $i . '">' . $i . '</a></li>';

                }

            }
            if($i > $src->page + $link && $right_dotted == false){
                $right_dotted = true;
                $paginate   .= '<li class="page-item"><a class="page-link" style="color:black;cursor:not-allowed">...</a></li>';
            }
            if($last - 1 == $i){
                $paginate   .= '<li class="page-item"><a class="page-link" href="index.php?module=Leads&action=leadfortelesale&limit=' . $src->limit . '&page=' . $i . '">&raquo;</a></li>';
 
            }
            
        }
     
        // $class      = ( $src->page == 1 ) ? "disabled" : "";
        // $paginate       .= '<li class="' . $class . '"><a href="?limit=' . $src->limit . '&page=' . ( $src->page - 1 ) . '">&laquo;</a></li>';
     
        // if ( $start >= 1 ) {
        //     $paginate   .= '<li><a href="?limit=' . $src->limit . '&page=1">1</a></li>';
        //     $paginate   .= '<li class="disabled"><span>...</span></li>';
        // }
     
    
        // if ( $end < $last ) {
        //     $paginate   .= '<li class="disabled"><span>...</span></li>';
        //     $paginate   .= '<li><a href="?limit=' . $src->limit . '&page=' . $last . '">' . $last . '</a></li>';
        // }
     
        // $class      = ( $src->page == $last ) ? "disabled" : "";
        // $paginate       .= '<li class="' . $class . '"><a href="?limit=' . $src->limit . '&page=' . ( $src->page + 1 ) . '">&raquo;</a></li>';
        $paginate       .= '</ul>';     
        $paginate       .= '</nav>';
        $ss->assign('paginate',$paginate);

		$html = $ss->fetch('custom/modules/Leads/tpls/List_Lead.tpl');
        echo $html;
        // echo ' View Lead';

	}
	

}
