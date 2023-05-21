<h1 style="text-align:center">SCRM SYSTEM</h1>
<form method="post" action="index.php?module=Leads&action=findexactlead">
    <div class="form-group">
        <label for="phone">Find Exact Lead (Số điện thoại): </label>
        <p style="color:red; font-size: 12px; margin-bottom: 5px;">* Lưu ý: Phần này tìm Lead chính xác theo số điện thoại.</p>
        <input class="form-control" type="phone" id="phone" name="phone" required="" autofocus>
        <button class="button" type="submit" name="find" value="find" style="visibility:visible; margin-top: 7px;">Tìm
            kiếm</button>
    </div>
</form>

<div class="form-group">
    <label for="phone">Nhập trường dữ liệu cần tìm (Số điện thoại): </label>
    <input class="form-control" type="phone" id="phone_search" name="phone" required value="{$phone}" autofocus>
    <button id="search" class="button" style="visibility:visible; margin-top: 7px;">Tìm kiếm</button>
</div>
<div class="form-group">
    <label for="phone">Nhập trường dữ liệu cần tìm (Họ & Tên Lead): </label>
    <input class="form-control" type="text" id="text_search" name="text" required value="{$phone}" autofocus>
    <button id="search_text" class="button" style="visibility:visible; margin-top: 7px;">Tìm kiếm</button>
</div>


<style>
    {
        literal
    }

    #data_result td {
        padding: 10px 10px;
    }

    .btn {
        display: inline-block;
        margin-bottom: 0;
        font-weight: normal;
        text-align: center;
        vertical-align: middle;
        touch-action: manipulation;
        cursor: pointer;
        background-image: none;
        border: 1px solid transparent;
        white-space: nowrap;
        padding: 6px 12px;
        font-size: 14px;
        line-height: 1.428571429;
        border-radius: 4px;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    th {
        min-width: 4%;
    }

    #message {
        font-size: 20px;
    }

    .message_error {
        color: red;
    }

    .message_success {
        color: green;
    }


        {
        /literal
    }
</style>
<h2 id="message"></h2>
<table cellpadding="0" width="100%" cellspacing="0" border="0" class="list view table-responsive">
    <thead>
        <tr height="20">
            <th scope="col">Cơ sở</th>
            <th scope="col">Leads</th>
            <th scope="col">Accounts</th>
            <th scope="col">Mobile</th>
            <th scope="col">Đợt nhập học</th>
            <th scope="col">Nguồn</th>
            <th scope="col">Trường THPT</th>
            <th scope="col">Converted</th>
            <th scope="col">Rating</th>
            <th scope="col">Topic</th>
            <th scope="col">Telesale</th>
            <th scope="col">Ngày cập nhập</th>
            <th scope="col">Promoter</th>
            <th scope="col">Ngày tạo</th>
            <th scope="col">Lịch sử chăm sóc</th>
            <th scope="col">Nhập trùng</th>
            <th scope="col">NE</th>
        </tr>

    </thead>
    <tbody id="data_result">
        <tr height="20">
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
            <td scope="row" align="left" valign="top"></td>
        </tr>
    </tbody>
</table>


<script type="text/javascript">
    { literal }
    //var crm_domain = 'http://localhost:81/crm/public_html';
    //var scrm_domain = 'http://localhost:81/public_html/public_html';
    var account = '';
    // var scrm_domain = 'http://scrm.poly.edu.vn';
    let scrm_domain = `https://${window.location.host}`;

    // event enter input phone search
    $('#phone_search').keyup(function (e) {
        if (e.keyCode == 13) {
            callApiSearch('#search', 'returnsearch', e.target.value);
        }
    });

    // event enter input name search
    $('#text_search').keyup(function (e) {
        if (e.keyCode == 13) {
            callApiSearch('#search_text', 'returnsearchtext', e.target.value);
        }
    });

    // event click button phone search
    $('#search').click(function () {
        callApiSearch('#search', 'returnsearch', $('#phone_search').val());
    });

    // event click button name search
    $('#search_text').click(function () {
        callApiSearch('#search_text', 'returnsearchtext', $('#text_search').val());
    });


    // function ajax api search
    // param: id button, action controller, text input search
    const callApiSearch = (element, action, text_search) => {
        $('#message').text('');
        $('#message').removeAttr('class');
        $('#data_result').text('');

        $(element).attr('disabled', 'disabled');
        if (action == 'returnsearch') {
            text_search = text_search.replace(" ", "");
        }

        $.ajax({
            type: 'GET',
            url: `${scrm_domain}/index.php?module=Leads&action=${action}&text_search=${text_search}`,
            dataType: "json",
            success: function (data, status) {
                if (data.message == 'success') {
                    $('#message').addClass('message_success');
                    $('#message').text(`Tìm thấy ${data.count} kết quả phù hợp`);

                    $.each(data.data, function (index, value) {
                        if (value.account_id != null) {
                            if (value.account_id.length > 0) {
                                account = `<td scope="row" align="left" valign="top"><a href="${scrm_domain}/index.php?module=Accounts&action=DetailView&record=${value.account_id}">${value.account_name}</a></td>`;
                            } else {
                                account = `<td scope="row" align="left" valign="top">Không có</td>`;
                            }
                        } else {
                            account = `<td scope="row" align="left" valign="top">Không có</td>`;
                        }

                        $('#data_result').append(
                            ` <tr height="20">
                                <td scope="row" align="left" valign="top">${value.area_c}</td>
                                <td scope="row" align="left" valign="top"><a href="${scrm_domain}/index.php?module=Leads&action=DetailView&record=${value.id}">${value.last_name}</a></td>
                                    ${account}
                                <td scope="row" align="left" valign="top">${value.phone_mobile}</td>
                                <td scope="row" align="left" valign="top">${value.dot_nhap_hoc_c_name} </td>
                                <td scope="row" align="left" valign="top">${value.source_c_name}</td>
                                <td scope="row" align="left" valign="top">${value.school_c}</td>
                                <td scope="row" align="left" valign="top">${value.converted == 1 ? 'Đã convert' : 'Chưa convert'}</td>
                                <td scope="row" align="left" valign="top">${value.rating_c_name}</td>
                                <td scope="row" align="left" valign="top">${value.topic_c}</td>
                                <td scope="row" align="left" valign="top"><a href="${scrm_domain}/index.php?module=Users&action=DetailView&record=${value.assigned_user_id}">${value.assigned_user_name}</a></td>
                                <td scope="row" align="left" valign="top">${value.date_modified}</td>
                                <td scope="row" align="left" valign="top"><a href="${scrm_domain}/index.php?module=Users&action=DetailView&record=${value.created_by}">${value.created_by_name}</a></td>
                                <td scope="row" align="left" valign="top">${value.date_entered}</td>
                                <td scope="row" align="left" valign="top">${value.call_log_c}</td>
                                <td scope="row" align="left" valign="top">${value.dup_c}</td>
                                <td scope="row" align="left" valign="top">${value.ne_c == 1 ? 'NE' : '0'}</td>
                            </tr>`
                        )
                    });
                }
                if (data.message == 'empty') {
                    $('#message').addClass('message_error');
                    $('#message').text(`Không tìm thấy kết quả phù hợp`);
                }
                $(element).removeAttr("disabled");
            },
            error: function (errorThrown) {
                console.log(errorThrown);
                $(element).removeAttr("disabled");
            }
        });
    }


    { /literal}	
</script>