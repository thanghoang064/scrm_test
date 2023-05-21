<?php

require_once 'include/upload_file.php';
require_once 'include/utils/sugar_file_utils.php';

/**
 *
 * Wrap profile restricted functions for SugarCRM CE/PRO/ENT/ULT
 *
 */
if (!class_exists('FunctionWrapper')) {

    class FunctionWrapper {
        /**
         * Sets the value of a configuration option
         * string ini_set ( string $varname , string $newvalue )
         */
        static function _ini_set($varname, $newvalue) {
            return ini_set($varname, $newvalue);
        }

        /**
         * Call a callback with an array of parameters
         * mixed call_user_func_array ( callable $callback , array $param_arr )
         */
        static function _call_user_func_array($function, array $params) {
            // array_intersect implementation
            if($function == "array_intersect") {
                $filterArray = $params;
                $result = array_shift($filterArray);
                foreach($filterArray as $filter){
                    $result = array_intersect($result, $filter);
                }

                return $result;
            }
        }

        /**
         * Deletes a file
         * bool unlink ( string $filename [, resource $context ] )
         */
        static function _unlink($filename) {
            return unlink($filename);
        }

        /**
         * Reads entire file into an array
         * array file ( string $filename [, int $flags = 0 [, resource $context ]] )
         */
        static function _file($filename) {
            // Support for SugarCRM CE 6.2
            global $sugar_version;
            if(version_compare($sugar_version, '6.3.0', '<')) {
                $fileString = self::_file_get_contents($filename);
                return explode("\n", $fileString);
            }

            $uploadFile = new UploadFile('');
            // Remove upload:// from file path string
            $uploadFile->temp_file_location = str_replace('upload://', '', UploadFile::get_upload_path($filename));
            if(method_exists($uploadFile, 'get_file_contents')){
                $fileString = $uploadFile->get_file_contents();
                return explode("\n", $fileString);
            }
            $fileString = FunctionWrapper::_file_get_contents(str_replace('cache/upload/', '', $uploadFile->temp_file_location));
            return explode("\n", $fileString);
        }

        /**
         * Checks whether a file or directory exists
         * bool file_exists ( string $filename )
         */
        static function _file_exists($filename) {
            return file_exists($filename);
        }

        /*
         * Reads entire file into a string
         * string file_get_contents ( string $filename [, bool $use_include_path = false [, resource $context [, int $offset = 0 [, int $maxlen ]]]] )
         */
        static function _file_get_contents($filename){
            return file_get_contents($filename);
        }

        /*
         * Write a string to a file
         * int file_put_contents ( string $filename , mixed $data [, int $flags = 0 [, resource $context ]] )
         */
        static function _file_put_contents($filename, $data){
            return file_put_contents($filename, $data);
        }

        /*
         * Moves an uploaded file to a new location
         * bool move_uploaded_file ( string $filename , string $destination )
         */
        static function _move_uploaded_file($filename, $destination){
            return move_uploaded_file($filename, $destination);
        }

        /*
         * Tells whether the filename is a regular file
         * bool is_file ( string $filename )
         */
        static function _is_file($filename) {
            return is_file($filename);
        }

        /*
         * Limits the maximum execution time
         * bool set_time_limit ( int $seconds )
         */
        static function _set_time_limit($value) {
            return set_time_limit($value);
        }

        /*
         * Changes file mode
         * bool chmod ( string $filename , int $mode )
         */
        static function _chmod($fileName, $mode) {
            return chmod($fileName, $mode);
        }

        /*
        * Calls function from bean dynamically
        * mixed _call_bean_function ( Object $bean , string $function )
        */
        static function _call_bean_function($bean, $function) {
            return $bean->$function();
        }


        /**
         * Creates a file with a unique filename, with access permission set to 0600, in the specified directory.
         *
         * @param $dir
         * @param $prefix
         *
         * @return string
         */
        static function _tempnam($dir, $prefix) {
            return tempnam($dir, $prefix);
        }

        /**
         * @param string $moduleName
         * @return object
         *
         * Get module instance (bean)
         */
        static function _getBean($moduleName) {
            if (class_exists('BeanFactory')) {
                return BeanFactory::getBean($moduleName);
            }

            // Support for SugarCRM CE 6.2
            // Not allowed in on demand
            $beanName = $GLOBALS['beanList'][$moduleName];
            return new $beanName();
        }

        /**
         * @param string $moduleName
         * @return object
         *
         * Get module instance (bean)
         */
        static function _newBean($moduleName) {
            if (class_exists('BeanFactory')) {
                return BeanFactory::newBean($moduleName);
            }

            // Support for SugarCRM CE 6.2
            // Not allowed in on demand
            $beanName = $GLOBALS['beanList'][$moduleName];
            return new $beanName();
        }

        static function _simplexml_load_string($xml) {
            return @simplexml_load_string($xml);
        }
    }

}