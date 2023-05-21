<?php

if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

class ExtUser extends User {

    public static function findUserWithoutPassword($name, $where = '') {
        global $db;
        $name = $db->quote($name);
        $query = "SELECT * from users where user_name='$name' AND deleted = 0";
        if (!empty($where)) {
            $query .= " AND $where";
        }
        $result = $db->limitQuery($query, 0, 1, false);
        if (!empty($result)) {
            $row = $db->fetchByAssoc($result);
            return $row;
        }
        return false;
    }

    public static function findUserWithEmail($email, $where = '') {
        global $db;
        $name = $db->quote($name);
        $query = "select * from users where id in ( SELECT  er.bean_id AS id FROM email_addr_bean_rel er,
			email_addresses ea WHERE ea.id = er.email_address_id
		    AND ea.deleted = 0 AND er.deleted = 0 AND er.bean_module = 'Users' AND email_address_caps IN ('{$email}') )";
        if (!empty($where)) {
            $query .= " AND $where";
        }
        $result = $db->limitQuery($query, 0, 1, false);
        if (!empty($result)) {
            $row = $db->fetchByAssoc($result);
            return $row;
        }
        return false;
    }

}
