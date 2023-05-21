-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 21, 2023 at 11:02 AM
-- Server version: 5.7.33
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `namep`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `account_type`, `industry`, `annual_revenue`, `phone_fax`, `billing_address_street`, `billing_address_city`, `billing_address_state`, `billing_address_postalcode`, `billing_address_country`, `rating`, `phone_office`, `phone_alternate`, `website`, `ownership`, `employees`, `ticker_symbol`, `shipping_address_street`, `shipping_address_city`, `shipping_address_state`, `shipping_address_postalcode`, `shipping_address_country`, `parent_id`, `sic_code`, `campaign_id`) VALUES
('2782b39b-1cf9-b918-cf5a-64674680abf0', '\"default Name For Fpoly_leadimports', '2023-05-19 09:49:51', '2023-05-19 09:49:50', '1', '1', '', 0, '1', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
('7bb3db6f-ec1c-2ee1-a967-6464eafcb4ba', 'Nguyễn Duy Quang Vinh', '2023-05-17 14:55:49', '2023-05-17 14:55:49', '501ca596-4cc7-9be3-cd73-6464e9a61d59', '501ca596-4cc7-9be3-cd73-6464e9a61d59', '', 0, '501ca596-4cc7-9be3-cd73-6464e9a61d59', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_audit`
--

CREATE TABLE `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_bugs`
--

CREATE TABLE `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cases`
--

CREATE TABLE `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cases_1_c`
--

CREATE TABLE `accounts_cases_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `accounts_cases_1accounts_ida` varchar(36) DEFAULT NULL,
  `accounts_cases_1cases_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_contacts`
--

CREATE TABLE `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cstm`
--

CREATE TABLE `accounts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts_cstm`
--

INSERT INTO `accounts_cstm` (`id_c`, `jjwg_maps_lng_c`, `jjwg_maps_lat_c`, `jjwg_maps_geocode_status_c`, `jjwg_maps_address_c`) VALUES
('2782b39b-1cf9-b918-cf5a-64674680abf0', 0.00000000, 0.00000000, '', ''),
('7bb3db6f-ec1c-2ee1-a967-6464eafcb4ba', 0.00000000, 0.00000000, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_leads_1_c`
--

CREATE TABLE `accounts_leads_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `accounts_leads_1accounts_ida` varchar(36) DEFAULT NULL,
  `accounts_leads_1leads_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_opportunities`
--

CREATE TABLE `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_actions`
--

CREATE TABLE `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_actions`
--

INSERT INTO `acl_actions` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `category`, `acltype`, `aclaccess`, `deleted`) VALUES
('103360ae-63fa-b7e8-9cfd-6464cd9ec916', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOD_Index', 'module', 90, 0),
('10b6f582-0783-41d1-9373-6464cd1f4bb6', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Tasks', 'module', 90, 0),
('10e00658-d85e-0e04-1a69-6464cd86486b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'fpoly_LeadImports', 'module', 90, 0),
('117d409c-ef55-5c1a-4903-6464cdc66898', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOS_Products', 'module', 90, 0),
('11c80516-ddc0-8466-4552-6464cd7b4053', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Accounts', 'module', 90, 0),
('12b99a83-be73-ee87-ed42-6464cd385c0c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOD_Index', 'module', 90, 0),
('12dce2cc-b8c8-a6ac-604e-6464cd673df5', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Tasks', 'module', 90, 0),
('1342d9b6-3478-63d7-2fb4-6464cdd4c7a3', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'fpoly_LeadImports', 'module', 90, 0),
('148043bf-ecdc-72d5-f6f1-6464cd55d218', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOS_Products', 'module', 90, 0),
('14ce69ce-4adc-7559-b312-6464cde451bf', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOD_Index', 'module', 90, 0),
('158f4525-6508-577c-6271-6464cd406846', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'fpoly_LeadImports', 'module', 90, 0),
('1764513f-885e-6105-6079-6464cdf49309', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOS_Products', 'module', 90, 0),
('17ac91eb-2a15-7c59-a556-6464cd372abd', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Calls_Reschedule', 'module', 89, 0),
('17fbd7b9-5da6-8ad0-dbff-6464cd3bbf15', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'fpoly_LeadImports', 'module', 90, 0),
('18d90151-0312-fdf8-45ff-6464cd03acfa', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Users', 'module', 90, 0),
('19d7a75e-5303-a0f4-993a-6464cd12d3cf', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOS_Products', 'module', 90, 0),
('19e6fbac-9c12-c5ca-6454-6464cd1d0fc1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Calls_Reschedule', 'module', 90, 0),
('1a100c6f-dc9a-852a-e192-6464cdaaf956', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'fpoly_LeadImports', 'module', 90, 0),
('1a8f09c7-bd0e-fe68-60a4-6464cd9b65c3', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'FP_events', 'module', 90, 0),
('1bab1272-1e33-df17-d6d8-6464cd4cf0ef', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOW_WorkFlow', 'module', 89, 0),
('1c7aaba0-8caa-3180-6a40-6464cde92da9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'fpoly_LeadImports', 'module', 90, 0),
('1cc78cdf-f471-7881-8b85-6464cd64e6ed', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Calls_Reschedule', 'module', 90, 0),
('1d1115ad-97b1-4611-27f2-6464cd9d367a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOS_Products', 'module', 90, 0),
('1db690e4-5fa9-042b-8bb8-6464cd05bcf4', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AnalyticReporting', 'module', 89, 0),
('1e89b843-41a5-c0a6-45dd-6464cdf56d5a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOW_WorkFlow', 'module', 90, 0),
('1f370349-9b32-4f61-efcb-6464cdc041c8', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Calls_Reschedule', 'module', 90, 0),
('2014fd4b-74ab-c513-b950-6464cd88e074', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOS_Products', 'module', 90, 0),
('20d408b5-3cac-62e9-1457-6464cd003ca4', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOW_WorkFlow', 'module', 90, 0),
('210c7009-fa17-40b9-6d5a-6464cdf6b876', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOK_Knowledge_Base_Categories', 'module', 89, 0),
('2152049b-d9dd-e40f-abbb-6464cd0ed70a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Tasks', 'module', 89, 0),
('21ab28cf-618d-edae-73ba-6464cdcc026a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Calls_Reschedule', 'module', 90, 0),
('22594605-244f-d73c-47ac-6464cdec9472', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AnalyticReporting', 'module', 90, 0),
('225f564e-d420-1138-729c-6464cd1b598f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOS_Products', 'module', 90, 0),
('22fc1c4f-530a-5596-ee0a-6464cd297f5f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'ProspectLists', 'module', 89, 0),
('231dc750-d655-eb13-66f1-6464cdcafd77', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOW_WorkFlow', 'module', 90, 0),
('23f5dbbb-76cf-230a-4f1a-6464cd0b50d6', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Calls_Reschedule', 'module', 90, 0),
('24174a90-57ae-3180-dfd0-6464cdc1012f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('25824db3-06d4-682a-0eee-6464cd80430d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'ProspectLists', 'module', 90, 0),
('259bab99-3c02-fcb8-4298-6464cdc8a28f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AnalyticReporting', 'module', 90, 0),
('25b17489-d54b-0329-a828-6464cd6a9356', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOW_WorkFlow', 'module', 90, 0),
('260fb45e-b2d5-761d-7acf-6464cdb3acc1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Calls_Reschedule', 'module', 90, 0),
('263bf85e-7b1c-21c5-50b6-6464cd3e5730', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('264a5b70-30af-e1cd-a4fb-6464cd3909fe', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'SurveyQuestionResponses', 'module', 89, 0),
('27c9923f-b987-c06f-d863-6464cda969df', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'ProspectLists', 'module', 90, 0),
('27e233e4-f5a1-2b8b-49b6-6464cd571c98', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOW_WorkFlow', 'module', 90, 0),
('28153e38-4cfe-4f76-35c0-6464cd8ed5d0', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Calls_Reschedule', 'module', 90, 0),
('288a0f07-0aef-b30b-07d1-6464cd3e42fd', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('2924ebc5-2e2c-4da2-b8b3-6464cdf7f7cf', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AnalyticReporting', 'module', 90, 0),
('29cb5f4f-26a4-8a80-54fa-6464cdfc54fb', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'ProspectLists', 'module', 90, 0),
('2a0f8e31-c29f-07a6-4055-6464cdfb1075', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'SurveyQuestionResponses', 'module', 90, 0),
('2a46ae4d-29a6-4f6e-8724-6464cd82bf46', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOW_WorkFlow', 'module', 90, 0),
('2ad8cd3e-f77a-ebc8-6e94-6464cdcbded7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('2c350afc-c72c-fcd0-b1d5-6464cd9a874f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'ProspectLists', 'module', 90, 0),
('2c4963f4-f202-5564-a5ad-6464cd778484', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AnalyticReporting', 'module', 90, 0),
('2cbccd6b-bcf4-36a9-bef3-6464cd0052d1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'jjwg_Markers', 'module', 89, 0),
('2cce3ad7-432c-ef91-0945-6464cdae862c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOW_WorkFlow', 'module', 90, 0),
('2d03357d-bb51-7242-3591-6464cd391d8d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'SurveyQuestionResponses', 'module', 90, 0),
('2d08f801-1abf-6ff2-04be-6464cdb19841', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Calls', 'module', 89, 0),
('2d1938a2-bb0c-23ea-7b20-6464cd1cc791', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('2dc4d3b2-8edc-5ad3-3bba-6464cde2d573', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOS_Invoices', 'module', 89, 0),
('2e345488-1320-5a7c-97b6-6464cd853054', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'ProspectLists', 'module', 90, 0),
('2ea30ab5-7c14-a5ea-b235-6464cd2b7308', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'EAPM', 'module', 90, 0),
('2f582200-d035-4598-3edd-6464cd3a2791', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('2fb95362-bf82-b2aa-e21b-6464cda2d5a7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AnalyticReporting', 'module', 90, 0),
('2fbe424b-3166-106d-1681-6464cdaf025b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Calls', 'module', 90, 0),
('3035f118-81f4-2afe-9a6e-6464cd9384ee', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'jjwg_Markers', 'module', 90, 0),
('30414e97-6d82-2b23-4c01-6464cd0b17d0', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'ProspectLists', 'module', 90, 0),
('30481155-843b-d8cb-3137-6464cd557520', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'SurveyQuestionResponses', 'module', 90, 0),
('306a9bef-bd89-747b-ac68-6464cdf72fd2', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOS_Invoices', 'module', 90, 0),
('31952f1d-46e9-e927-b7ab-6464cd9d0de0', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('31d2779f-0af4-2deb-d033-6464cdfe47ab', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Calls', 'module', 90, 0),
('32481bbb-5974-b986-c5b1-6464cd8076f4', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'ProspectLists', 'module', 90, 0),
('32b26f3a-59f0-60dc-3153-6464cdd1a5ff', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AnalyticReporting', 'module', 90, 0),
('330b03aa-fac9-096c-65a2-6464cd309267', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOS_Invoices', 'module', 90, 0),
('33903026-91fc-394b-430b-6464cd7f3360', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'jjwg_Markers', 'module', 90, 0),
('33ab923c-c7eb-a7ff-b41d-6464cd62e386', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'SurveyQuestionResponses', 'module', 90, 0),
('33d87461-c889-eda5-2718-6464cd54a21b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Calls', 'module', 90, 0),
('341adba2-a8ee-74b6-f110-6464cdbfbd7f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'FP_Event_Locations', 'module', 89, 0),
('3542156f-1f04-831a-3810-6464cddf3235', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOS_Invoices', 'module', 90, 0),
('35bfcb79-2d02-464a-6f52-6464cd8e24d1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AnalyticReporting', 'module', 90, 0),
('366ed1bc-eba1-2182-293c-6464cdd4dfd9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Calls', 'module', 90, 0),
('36d12ec5-cedd-8bf5-27c0-6464cd556687', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'jjwg_Markers', 'module', 90, 0),
('3707e672-ef8d-7417-3c29-6464cd8c93b5', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'FP_Event_Locations', 'module', 90, 0),
('370f16df-94aa-48c6-1ebf-6464cd419b6f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'SurveyQuestionResponses', 'module', 90, 0),
('3798c4f3-82c9-786d-ee67-6464cdc438ee', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOS_Invoices', 'module', 90, 0),
('388840fb-e12b-8009-eeff-6464cd226ed4', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Calls', 'module', 90, 0),
('399a0a02-242b-6657-2d46-6464cd257f51', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Users', 'module', 90, 0),
('39d396e6-b622-bed2-f10c-6464cdfd7836', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'jjwg_Markers', 'module', 90, 0),
('39f0afa3-3090-ffbb-9e2b-6464cdda0683', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'FP_Event_Locations', 'module', 90, 0),
('3a35b91d-c5a4-62d7-6650-6464cdc3314a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Documents', 'module', 89, 0),
('3acbf141-a794-e0b6-7b86-6464cd162cd7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Calls', 'module', 90, 0),
('3acfb2be-cadf-f28b-bc50-6464cd47721c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOS_Invoices', 'module', 90, 0),
('3b17e61d-0090-d5fd-77bc-6464cd88726f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'SurveyQuestionResponses', 'module', 90, 0),
('3c17c841-d94b-1506-60ce-6464cd0ba6fc', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'FP_Event_Locations', 'module', 90, 0),
('3c7bce0a-2e61-b071-cc4e-6464cd0e853f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Documents', 'module', 90, 0),
('3cca4522-1292-5716-9979-6464cd9235d9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOS_Invoices', 'module', 90, 0),
('3d849ad6-94f2-5c98-6d7c-6464cd33cd41', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Calls', 'module', 90, 0),
('3d885557-a7e1-9bf7-121e-6464cdf036b2', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'jjwg_Markers', 'module', 90, 0),
('3e184d07-ff73-0504-a6ff-6464cd578446', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Opportunities', 'module', 89, 0),
('3e41813d-f977-76c7-b5ae-6464cdf1be58', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'FP_Event_Locations', 'module', 90, 0),
('3e53b64a-32af-00c3-fefe-6464cdebe000', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'SurveyQuestionResponses', 'module', 90, 0),
('3e89351f-401f-39cb-9c08-6464cdeb3e56', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Documents', 'module', 90, 0),
('3f198f24-fe75-f630-69f4-6464cd508008', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOS_Invoices', 'module', 90, 0),
('4041145d-ccbc-aa95-cda1-6464cd6884ec', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Opportunities', 'module', 90, 0),
('406540a4-c41b-af47-050d-6464cd068530', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'jjwg_Markers', 'module', 90, 0),
('409bd866-1bb0-0090-1a1d-6464cd2bde76', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'FP_Event_Locations', 'module', 90, 0),
('40f4b2dc-5fa3-c860-16a8-6464cd37512c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Documents', 'module', 90, 0),
('426f05fe-a581-5cba-701e-6464cdba3da3', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'TemplateSectionLine', 'module', 90, 0),
('42c03080-647f-d970-782e-6464cd53244e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Opportunities', 'module', 90, 0),
('42ddbc75-7e1f-e257-7421-6464cd32dd97', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'FP_Event_Locations', 'module', 90, 0),
('4343260a-788f-e98d-8c32-6464cd00d840', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Documents', 'module', 90, 0),
('43c1bfb2-75fd-4deb-1334-6464cd3dc5e7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'jjwg_Markers', 'module', 90, 0),
('4502ebbc-b13b-7028-7952-6464cdbc56e3', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Opportunities', 'module', 90, 0),
('45059efc-fef4-cbd8-0b7a-6464cd0d092f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'FP_Event_Locations', 'module', 90, 0),
('454374e5-b321-beb6-02b6-6464cdbb160c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOP_Case_Events', 'module', 89, 0),
('45616a97-6ddb-d06f-bd6b-6464cded0e10', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Documents', 'module', 90, 0),
('46e3e293-42c9-87fe-3426-6464cdcfc7c8', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Opportunities', 'module', 90, 0),
('47ca3892-08c2-174f-18d6-6464cd76f4be', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Documents', 'module', 90, 0),
('48237b75-4da7-b495-0a7e-6464cdeeee30', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOP_Case_Events', 'module', 90, 0),
('48f9ed9f-dded-fe56-35da-6464cd67873f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Opportunities', 'module', 90, 0),
('4965291d-f7ea-b2c7-a09a-6464cd34b957', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Project', 'module', 89, 0),
('49f27a18-b882-6535-0acb-6464cddf9edc', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Documents', 'module', 90, 0),
('4a3be3bc-b819-f09d-1767-6464cd03f644', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOP_Case_Events', 'module', 90, 0),
('4b440b4d-7fb7-72c8-7f29-6464cd282055', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'FP_events', 'module', 90, 0),
('4b493fa8-414f-4122-a116-6464cdfc2524', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Cases', 'module', 89, 0),
('4b530c9a-9645-a5a2-c4f2-6464cd9be96d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOD_Index', 'module', 89, 0),
('4be3734b-defd-131f-b27d-6464cdba1a90', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Project', 'module', 90, 0),
('4bffc267-0d19-2521-dec3-6464cdfd9790', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Opportunities', 'module', 90, 0),
('4ce1c16c-954a-ed16-2047-6464cd8e3d94', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOP_Case_Events', 'module', 90, 0),
('4de6defe-2c92-c05b-43fb-6464cd132f34', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Cases', 'module', 90, 0),
('4df78ad7-b2a5-0e87-8c16-6464cde6c0ed', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Project', 'module', 90, 0),
('4e7a4784-9f2b-8294-d966-6464cdd70fde', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Opportunities', 'module', 90, 0),
('4f2ca9f1-a2d5-10e5-e532-6464cdec1b4b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOP_Case_Events', 'module', 90, 0),
('4fe509f7-0fd7-4b74-d420-6464cdc25086', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Tasks', 'module', 90, 0),
('4fee9c58-727b-686f-54c4-6464cd1f87f7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Project', 'module', 90, 0),
('503481ad-b8cb-db88-cb4d-6464cddc2c13', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Cases', 'module', 90, 0),
('51749aae-e449-80b4-91ba-6464cd4e80a1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOP_Case_Events', 'module', 90, 0),
('52aacc65-951f-993a-d0f8-6464cd842492', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Cases', 'module', 90, 0),
('52c43a35-1c49-254e-0aea-6464cdaa5285', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Project', 'module', 90, 0),
('542c9e85-9534-c224-c546-6464cd01ad52', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOP_Case_Events', 'module', 90, 0),
('550cc492-0c61-3847-c770-6464cd843582', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Cases', 'module', 90, 0),
('55c5f27a-7ae0-1c7b-8041-6464cd8e1476', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Project', 'module', 90, 0),
('569cbb01-accc-e262-e806-6464cd47ff48', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOP_Case_Events', 'module', 90, 0),
('57ca2ae5-3701-0694-6a02-6464cd43ae8f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Cases', 'module', 90, 0),
('57da4013-80b4-a4e0-81f6-6464cdad7e7b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Project', 'module', 90, 0),
('59fc6dad-6349-f870-4158-6464cdb58fd6', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Project', 'module', 90, 0),
('59ff978e-fa42-7923-d83b-6464cdeb313d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Cases', 'module', 90, 0),
('5b7f2d75-4989-7fcb-434d-6464cdb4bb8a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Spots', 'module', 89, 0),
('5c2d00aa-b718-5f37-094b-6464cd45a311', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOW_Processed', 'module', 89, 0),
('5c746325-ee3d-3be2-af5a-6464cd232476', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Cases', 'module', 90, 0),
('5dcb43ab-f982-24c1-d5b8-6464cd99c74d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Spots', 'module', 90, 0),
('5ebeef24-fabc-65fa-6f44-6464cdc4029e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOW_Processed', 'module', 90, 0),
('5f31ea6a-3f1b-b2e8-ade2-6464cdd6415c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOK_KnowledgeBase', 'module', 89, 0),
('5ffc5364-01f5-cb3d-458c-6464cd57333f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Spots', 'module', 90, 0),
('609e3892-decb-d00a-6ae2-6464cd6569af', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'SecurityGroups', 'module', 89, 0),
('60f0bdb8-d3f6-01c0-36e6-6464cda5ea1f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOW_Processed', 'module', 90, 0),
('61dd5fa5-420c-420b-570d-6464cda3481a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Prospects', 'module', 89, 0),
('61e409a7-8042-9f67-81cb-6464cd47439a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOK_KnowledgeBase', 'module', 90, 0),
('625067e6-84cc-06a0-c14b-6464cd2bbc92', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Spots', 'module', 90, 0),
('633d3fe7-b3ac-0f99-5ee1-6464cd5c722d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AM_ProjectTemplates', 'module', 89, 0),
('63773d03-2454-c331-74a0-6464cd9e6e25', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOW_Processed', 'module', 90, 0),
('63ef3b6f-416a-ea27-0b98-6464cda18df1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'SecurityGroups', 'module', 90, 0),
('63fd7e19-47d3-0f93-65f4-6464cdb88c87', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOK_KnowledgeBase', 'module', 90, 0),
('64399b5c-96f9-a0a4-e111-6464cdd8bb16', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Prospects', 'module', 90, 0),
('64936f88-e774-082e-a531-6464cd407995', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Spots', 'module', 90, 0),
('64d452c6-e4d5-1d14-f261-6464cd222529', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AsteriskIntegration', 'module', 89, 0),
('6597a5a4-6516-1c4d-80b5-6464cdfb4032', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AM_ProjectTemplates', 'module', 90, 0),
('65aef897-422d-139a-bb7b-6464cd346393', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOW_Processed', 'module', 90, 0),
('661d8fd9-07ef-b9e1-0fd3-6464cd195d4f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOK_KnowledgeBase', 'module', 90, 0),
('6630b1d5-6ee1-e587-edf2-6464cd411a22', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'SecurityGroups', 'module', 90, 0),
('66f410b8-a189-05fd-afb7-6464cd274cc9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Prospects', 'module', 90, 0),
('671a489f-a81c-0daa-35dd-6464cdf2725e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Spots', 'module', 90, 0),
('67b2d69d-b6d6-1674-dc32-6464cde2fd51', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AsteriskIntegration', 'module', 90, 0),
('67cd8c3f-455e-37e7-1d96-6464cd972e1f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOW_Processed', 'module', 90, 0),
('67d3ac5a-880d-9adf-b2e0-6464cd208572', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AM_ProjectTemplates', 'module', 90, 0),
('67f99f43-19ef-2bc4-06be-6464cd2721ee', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOK_KnowledgeBase', 'module', 90, 0),
('68d407da-d2a8-0fc1-ff6d-6464cd9b1f06', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'SecurityGroups', 'module', 90, 0),
('693336e0-fa05-59e1-a1b1-6464cd82a8b7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Spots', 'module', 90, 0),
('693e8405-9681-c388-6fc6-6464cd8d0886', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Prospects', 'module', 90, 0),
('6a67439a-dab4-0a34-49f1-6464cd53ffd4', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Emails', 'module', 89, 0),
('6ad2faf7-ba50-fdaf-e75d-6464cd04d2bc', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOK_KnowledgeBase', 'module', 90, 0),
('6ae3b83c-f4c7-b3c9-f51f-6464cdbcb8e1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AsteriskIntegration', 'module', 90, 0),
('6afbe9bb-0fdb-1cdf-70e7-6464cdb654cf', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AM_ProjectTemplates', 'module', 90, 0),
('6b2cc045-4d17-7656-33eb-6464cdb3f5d0', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'SecurityGroups', 'module', 90, 0),
('6b45317c-2fb6-e3e1-4037-6464cd40b89b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Spots', 'module', 90, 0),
('6b46510b-db0a-f05c-963c-6464cd91c3bb', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOW_Processed', 'module', 90, 0),
('6b715e2e-7b6d-aefd-173b-6464cd5a3360', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Prospects', 'module', 90, 0),
('6ce70fb7-1201-92c9-eda7-6464cd89d25e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Emails', 'module', 90, 0),
('6cf2f5fd-1f4d-a7f5-778d-6464cd7aa38d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOK_KnowledgeBase', 'module', 90, 0),
('6d06279d-87e3-0fcb-23d0-6464cd3ec878', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AsteriskIntegration', 'module', 90, 0),
('6d6f8ede-67d5-bc83-31db-6464cd765bab', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'SecurityGroups', 'module', 90, 0),
('6dcb5b42-5731-e6d5-94f2-6464cd20d9ca', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Prospects', 'module', 90, 0),
('6de4047d-234e-6880-a02e-6464cd84c1c3', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AM_ProjectTemplates', 'module', 90, 0),
('6ed66916-9391-81ca-aeac-6464cde1f8cb', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOW_Processed', 'module', 90, 0),
('6edce488-b409-bad3-0a30-6464cd4771ba', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOS_PDF_Templates', 'module', 89, 0),
('6f0ac6cd-585c-baaa-5161-6464cdbaded4', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Emails', 'module', 90, 0),
('6f34fea2-84a3-9bd8-6dbe-6464cdc8437f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOK_KnowledgeBase', 'module', 90, 0),
('6f659e05-32af-a0c5-0b3e-6464cda120a0', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AsteriskIntegration', 'module', 90, 0),
('6f8fecd9-652a-4fc6-db8e-6464cd8258ac', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'SurveyQuestions', 'module', 89, 0),
('6fb1ac6a-03ee-a60f-efe2-6464cdae2293', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'SecurityGroups', 'module', 90, 0),
('6fdb0a14-34a5-aa23-fae5-6464cd205ad4', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Prospects', 'module', 90, 0),
('7036a0ec-c4b0-2281-9ec3-6464cddc2841', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AM_ProjectTemplates', 'module', 90, 0),
('70580566-1728-6aa2-2878-6464cd34d725', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOD_Index', 'module', 90, 0),
('71931678-7611-3e9e-3f6d-6464cd393433', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Emails', 'module', 90, 0),
('7194a84f-11b6-bfb3-f5fa-6464cd908b39', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOS_PDF_Templates', 'module', 90, 0),
('71c602a0-9b00-4c05-f2af-6464cd732dc3', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AsteriskIntegration', 'module', 90, 0),
('7208ffe4-2b56-c92d-baf9-6464cd9e71b1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'SurveyQuestions', 'module', 90, 0),
('72122250-5203-1979-8412-6464cd6857dc', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'SecurityGroups', 'module', 90, 0),
('7261cef0-4ddc-6f9e-c95f-6464cdc861d9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AM_ProjectTemplates', 'module', 90, 0),
('72c40a02-32d2-2d78-9a16-6464cd1483ef', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Prospects', 'module', 90, 0),
('73baac02-1f83-3c9b-d16b-6464cdc9f784', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Emails', 'module', 90, 0),
('73e417c2-1c02-7e5d-e243-6464cdbeaca2', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOS_PDF_Templates', 'module', 90, 0),
('7400c6ef-9277-1133-11ef-6464cd42733f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AsteriskIntegration', 'module', 90, 0),
('7405087b-9e6a-1109-cfe0-6464cdabb805', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'jjwg_Areas', 'module', 89, 0),
('74203a48-78f5-eef1-9617-6464cd3a6c6a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'SurveyQuestions', 'module', 90, 0),
('74ba21b9-01a2-0d3e-7bd8-6464cd533f7d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AM_ProjectTemplates', 'module', 90, 0),
('74f60102-3342-9057-d45d-6464cdc5211a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOD_IndexEvent', 'module', 89, 0),
('75ad4508-6b0b-fea9-c13d-6464cd16072d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Emails', 'module', 90, 0),
('766cac98-f36f-3018-15da-6464cd921e85', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AsteriskIntegration', 'module', 90, 0),
('76790b9a-b172-052a-4b7c-6464cd03870b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOS_PDF_Templates', 'module', 90, 0),
('76809dc0-a2b9-cfda-34a4-6464cd826e7a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'SurveyQuestions', 'module', 90, 0),
('76cbd6cd-b888-cc31-7e5d-6464cda3f21c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'jjwg_Areas', 'module', 90, 0),
('7743053e-1bc6-0f53-513c-6464cd12105c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOD_IndexEvent', 'module', 90, 0),
('775637a8-9b2e-0ef2-2721-6464cd4063d4', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Contacts', 'module', 89, 0),
('78426022-bb90-d3ca-a6e3-6464cd84f846', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Emails', 'module', 90, 0),
('787df813-421c-01e7-7ff9-6464cddb14fb', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOS_PDF_Templates', 'module', 90, 0),
('78bc28ec-280b-21cf-d8b0-6464cda31a98', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'SurveyQuestions', 'module', 90, 0),
('78de4f27-0de6-089e-9221-6464cd8a86d7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'jjwg_Areas', 'module', 90, 0),
('795fd921-9570-f5a4-998b-6464cd13d081', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOD_IndexEvent', 'module', 90, 0),
('7a827c04-4db8-4135-3f68-6464cda74e22', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Emails', 'module', 90, 0),
('7aa26c06-e985-e5b2-5ecb-6464cdb04159', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOS_PDF_Templates', 'module', 90, 0),
('7aca7487-adf3-120c-9756-6464cdba136c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'SurveyQuestions', 'module', 90, 0),
('7ae54923-fff8-c5a7-6ec2-6464cd2906b9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Contacts', 'module', 90, 0),
('7b0675f4-51fa-d788-3ab8-6464cd8d62bb', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'jjwg_Areas', 'module', 90, 0),
('7b28d592-8986-ef08-847e-6464cdc152f4', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'SurveyResponses', 'module', 89, 0),
('7b5f036d-c62a-c68a-9e11-6464cdc89b4b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Tasks', 'module', 90, 0),
('7bfc53ff-5f77-573f-16ef-6464cdd6b42b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOD_IndexEvent', 'module', 90, 0),
('7d311cfa-47d2-e031-9436-6464cd6c321a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOS_PDF_Templates', 'module', 90, 0),
('7d47ea52-0929-099b-8c54-6464cd222690', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'SurveyQuestions', 'module', 90, 0),
('7d4bd39a-1142-1c1e-fe31-6464cd3bfaf6', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Contacts', 'module', 90, 0),
('7d56f1a1-87ee-d58c-e8ae-6464cdaf0491', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'jjwg_Areas', 'module', 90, 0),
('7e00d882-59a6-b88a-e6e5-6464cd685583', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'SurveyResponses', 'module', 90, 0),
('7e0bb3e3-039c-8d7b-8ea0-6464cdfaeb71', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOD_IndexEvent', 'module', 90, 0),
('7f8c9f9e-6571-e2e1-6c7e-6464cdd880e7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOS_PDF_Templates', 'module', 90, 0),
('7f9a5cce-7262-5171-f906-6464cd5bd0ae', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'SurveyQuestions', 'module', 90, 0),
('7feec047-bda7-f946-e936-6464cd911d10', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'jjwg_Areas', 'module', 90, 0),
('802f086f-98cd-1c59-e8d9-6464cdea0f6b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOD_IndexEvent', 'module', 90, 0),
('8044152c-f9a0-caf0-5f30-6464cd992542', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Contacts', 'module', 90, 0),
('804ce3c1-db82-4744-22ed-6464cd62ad40', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'SurveyResponses', 'module', 90, 0),
('82a45b52-b81a-102d-79ad-6464cde9496e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOD_IndexEvent', 'module', 90, 0),
('82b97a5a-74c2-ef0f-4984-6464cd7ed964', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'jjwg_Areas', 'module', 90, 0),
('831aa2db-85e2-84ff-5185-6464cdf89112', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'SurveyResponses', 'module', 90, 0),
('83e3aaa2-2113-b14d-b7a4-6464cd6fe354', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Contacts', 'module', 90, 0),
('8502edb5-2078-e573-aa91-6464cdbc66a0', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'jjwg_Areas', 'module', 90, 0),
('851ccde3-a2f0-5293-c3d2-6464cdccdde8', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOD_IndexEvent', 'module', 90, 0),
('854048a3-ace8-0a58-d320-6464cdb80937', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'SurveyResponses', 'module', 90, 0),
('869ab948-e518-02d0-e9e4-6464cd7ed8f0', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOP_Case_Updates', 'module', 89, 0),
('8759e5bc-c124-3068-0fa8-6464cd102da2', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'SurveyResponses', 'module', 90, 0),
('875cba51-8bb6-d181-66bf-6464cda71291', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Contacts', 'module', 90, 0),
('88b7ea76-d7e4-3b00-4619-6464cda1d513', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOP_Case_Updates', 'module', 90, 0),
('88f66a3f-6312-12ac-d473-6464cd6972e2', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'ProjectTask', 'module', 89, 0),
('8a040292-64a8-21eb-1c7a-6464cda2e040', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'SurveyResponses', 'module', 90, 0),
('8b375840-9f2c-7a53-02fa-6464cdabc8fc', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Contacts', 'module', 90, 0),
('8bbb8f9b-2f7c-91da-7c61-6464cd04341e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOP_Case_Updates', 'module', 90, 0),
('8c41c4ce-bc90-c6ed-e320-6464cdc5985c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'SurveyResponses', 'module', 90, 0),
('8d4276ec-1036-4e5a-8e57-6464cd17f6c1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'ProjectTask', 'module', 90, 0),
('8dee327c-00f7-9d2d-9e23-6464cdff28fc', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOP_Case_Updates', 'module', 90, 0),
('8e4a5359-12c5-4b0f-2daa-6464cd547793', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Contacts', 'module', 90, 0),
('8f81d012-5996-4f4a-22e2-6464cd6e6d32', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'EmailTemplates', 'module', 89, 0),
('9000a46e-9975-0d1f-b147-6464cd966abc', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'ProjectTask', 'module', 90, 0),
('9098572b-b231-e9de-3b0c-6464cde75225', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOP_Case_Updates', 'module', 90, 0),
('918809fc-3c36-cf01-931f-6464cd2e5d61', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOD_Index', 'module', 90, 0),
('931ff86b-3012-0181-662a-6464cda169b8', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'EmailTemplates', 'module', 90, 0),
('9333f069-7b35-b2c9-8bef-6464cd543dc0', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOR_Scheduled_Reports', 'module', 89, 0),
('933ef580-f191-7202-043f-6464cdb238c6', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'ProjectTask', 'module', 90, 0),
('93c0ec3c-61cb-a652-4063-6464cdd197a5', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOP_Case_Updates', 'module', 90, 0),
('95ad757b-357b-e3af-5891-6464cdb2e15b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'OutboundEmailAccounts', 'module', 89, 0),
('967f0bea-bc55-2796-096f-6464cdab23d4', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'EmailTemplates', 'module', 90, 0),
('96af3073-0300-49f8-08d3-6464cd03eb27', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'ProjectTask', 'module', 90, 0),
('96bd8d3f-798d-aef5-1210-6464cd7b3be8', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOR_Scheduled_Reports', 'module', 90, 0),
('9702d5d7-9880-faaa-d463-6464cdff7403', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOP_Case_Updates', 'module', 90, 0),
('982f11b7-9be4-8767-f621-6464cdd36472', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'OutboundEmailAccounts', 'module', 90, 0),
('99d11fda-74d3-bc19-4ddf-6464cd4fe327', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'EmailTemplates', 'module', 90, 0),
('99e76527-5c00-fd4a-0db7-6464cd3b9a61', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOP_Case_Updates', 'module', 90, 0),
('99f7e683-ee80-88f3-4d71-6464cde27541', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'ProjectTask', 'module', 90, 0),
('9a67bf7a-2bcd-e8bc-cebb-6464cd6639d9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'OutboundEmailAccounts', 'module', 90, 0),
('9ad0d1f0-3895-9ccc-688f-6464cdadce4d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOR_Scheduled_Reports', 'module', 90, 0),
('9c0e661f-098b-fcd7-e11d-6464cdfc009b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'fpoly_Schools', 'module', 89, 0),
('9c1ccdbe-6635-84e1-e11d-6464cdc5131f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Bugs', 'module', 89, 0),
('9cfd8d6c-cc5f-391c-7d16-6464cdf6f04b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'OutboundEmailAccounts', 'module', 90, 0),
('9d7f38e4-671f-3e47-f243-6464cd582779', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'ProjectTask', 'module', 90, 0),
('9d85fa2e-3e43-4323-1556-6464cdb494a6', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'EmailTemplates', 'module', 90, 0),
('9db9054d-4e13-ef9b-6f9a-6464cd2fa9f7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Tasks', 'module', 90, 0),
('9edd7c22-adf7-a08a-8c8e-6464cdcfe995', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOR_Scheduled_Reports', 'module', 90, 0),
('9efcb52b-5ae1-7e26-b286-6464cd84dbfa', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'fpoly_Schools', 'module', 90, 0),
('9f528f0d-9394-7562-639a-6464cda04356', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'OutboundEmailAccounts', 'module', 90, 0),
('a00305e8-bcd4-868f-fb54-6464cda62c15', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'ProjectTask', 'module', 90, 0),
('a020732b-a0f8-b139-24e6-6464cdcdd811', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Bugs', 'module', 90, 0),
('a1364a98-dd81-bbbb-c040-6464cdc813ed', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'fpoly_Schools', 'module', 90, 0),
('a1505c45-fc60-00af-85d8-6464cd672985', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'EmailTemplates', 'module', 90, 0),
('a22054af-7483-82b8-10a1-6464cd039185', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOR_Scheduled_Reports', 'module', 90, 0),
('a2298d0a-a1b6-199a-6193-6464cd6081ea', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'OutboundEmailAccounts', 'module', 90, 0),
('a3344d68-a105-06c6-7e83-6464cd98e1b9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Bugs', 'module', 90, 0),
('a3e36096-74a7-6dfb-53d7-6464cd76cae2', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'fpoly_Schools', 'module', 90, 0),
('a44bf833-9540-b50a-237e-6464cd7c8b19', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'EmailTemplates', 'module', 90, 0),
('a49b6e19-19e1-8d12-f9ab-6464cd37b3f2', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOR_Scheduled_Reports', 'module', 90, 0),
('a4a798f9-8d7b-b033-690f-6464cd6dbb94', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'OutboundEmailAccounts', 'module', 90, 0),
('a5a9a637-a9a5-93df-7277-6464cd5ea980', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Bugs', 'module', 90, 0),
('a62f8ada-50e2-ebfd-7f3c-6464cd238052', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'fpoly_Schools', 'module', 90, 0),
('a7833b59-6efe-5d29-2ca6-6464cd86fe70', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'EmailTemplates', 'module', 90, 0),
('a7ab5a73-7b46-27a4-548a-6464cdcf2d0a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Bugs', 'module', 90, 0),
('a7cf2f01-7b47-4254-5fde-6464cd2cef89', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'OutboundEmailAccounts', 'module', 90, 0),
('a7df8370-0cff-d8cb-f472-6464cd2ae723', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOR_Scheduled_Reports', 'module', 90, 0),
('a8ebc483-c180-6fdb-faec-6464cd9ec269', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'fpoly_Schools', 'module', 90, 0),
('a9b14daa-b2b6-f90c-08f3-6464cdc06e23', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Bugs', 'module', 90, 0),
('aa8fd0db-eb22-6d32-1dd8-6464cd87e2a8', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'EmailMarketing', 'module', 89, 0),
('ab151e51-1b6b-53ee-93af-6464cd800c8b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'fpoly_Schools', 'module', 90, 0),
('abbfe29a-7070-f020-22c9-6464cdbe3357', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOR_Scheduled_Reports', 'module', 90, 0),
('ac1f737c-6ed6-0c40-6620-6464cd624d8f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Bugs', 'module', 90, 0),
('acb00030-dfb1-46bc-dc2c-6464cd64ced9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'TemplateSectionLine', 'module', 90, 0),
('acf5ee0a-b492-1e0a-5762-6464cdb60601', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'EmailMarketing', 'module', 90, 0),
('ad2bf78b-225e-c871-ea51-6464cddefb87', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'fpoly_Schools', 'module', 90, 0),
('ae1dde44-6496-c8d5-4d25-6464cdbe9f74', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Bugs', 'module', 90, 0),
('af178ff7-518c-ce9e-5e3f-6464cd24ad9a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'EmailMarketing', 'module', 90, 0),
('af884485-6519-d643-283f-6464cd86ef54', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AM_TaskTemplates', 'module', 89, 0),
('b00c7526-8f5b-5284-b5e8-6464cd847de6', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'access', 'Employees', 'module', 89, 0),
('b19f8929-c714-fcbf-093b-6464cde6e923', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'EmailMarketing', 'module', 90, 0),
('b2338850-0c80-7ae8-5055-6464cd5090e4', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Leads', 'module', 89, 0),
('b2ee43a6-0eea-c88c-6075-6464cd24f24f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'view', 'Employees', 'module', 90, 0),
('b36e802a-62bc-67d8-8101-6464cd03d72a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AM_TaskTemplates', 'module', 90, 0),
('b3f06324-0392-2cd8-3380-6464cd260960', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'EmailMarketing', 'module', 90, 0),
('b56c6007-607e-284a-2d5f-6464cd6d7e78', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'list', 'Employees', 'module', 90, 0),
('b5f4ddc8-3356-237d-7db0-6464cdc71331', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'EmailMarketing', 'module', 90, 0),
('b5f71f24-b25d-3fa2-3a39-6464cdc1793c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOS_Quotes', 'module', 89, 0),
('b68bdfc3-137e-f15e-3f8d-6464cd03e76a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOS_Product_Categories', 'module', 89, 0),
('b6a7c681-63e3-1a0b-ae16-6464cd48a020', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AM_TaskTemplates', 'module', 90, 0),
('b79417e4-57b2-a78c-ce57-6464cd971f82', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'edit', 'Employees', 'module', 90, 0),
('b7dd2c34-b2bd-7d34-a10b-6464cdcf70c1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'EmailMarketing', 'module', 90, 0),
('b95475ba-84d0-5146-fb3e-6464cd377691', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AM_TaskTemplates', 'module', 90, 0),
('b9bd17c4-8d0f-da38-8554-6464cd1c8438', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOS_Product_Categories', 'module', 90, 0),
('ba0b9aa2-b121-03aa-98a8-6464cd96d84c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'delete', 'Employees', 'module', 90, 0),
('ba649f13-14c6-e95c-9359-6464cd45a8e8', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'EmailMarketing', 'module', 90, 0),
('ba808f56-c75a-8444-4418-6464cd3aa890', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOS_Quotes', 'module', 90, 0),
('bc3e0bda-3508-d5aa-ec64-6464cdfec4ff', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOD_Index', 'module', 90, 0),
('bc4b425b-9b9d-caa8-5c72-6464cd18f8e9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'import', 'Employees', 'module', 90, 0),
('bc5d9c07-8fcf-53e1-e1f7-6464cd06e731', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AM_TaskTemplates', 'module', 90, 0),
('bcaabfdd-abbe-ae1a-ac4e-6464cd97e4dc', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'jjwg_Address_Cache', 'module', 89, 0),
('bcdf6eea-470c-6fb1-6f92-6464cdc88161', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Meetings', 'module', 89, 0),
('bdc513d2-9e79-b750-5a99-6464cd47cf4f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOS_Product_Categories', 'module', 90, 0),
('be19986c-9032-1b68-2653-6464cd8a6de1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOS_Quotes', 'module', 90, 0),
('be92249d-511f-8942-5c01-6464cd9cc667', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'SurveyQuestionOptions', 'module', 89, 0),
('be9d0687-5344-8800-f529-6464cd025aa9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'export', 'Employees', 'module', 90, 0),
('bf7c083b-c37a-38c1-e587-6464cdf289db', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'fpoly_LeadImports', 'module', 89, 0),
('bf8a18e9-04ee-da3f-1cf7-6464cd2925f9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Meetings', 'module', 90, 0),
('bf90ce75-2130-2f19-0666-6464cda3fd27', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AM_TaskTemplates', 'module', 90, 0),
('c1183fa5-8ebf-903a-8952-6464cde659b2', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOS_Quotes', 'module', 90, 0),
('c1230f7a-f51f-3e80-f886-6464cddcfeab', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Tasks', 'module', 90, 0),
('c13e0b5a-82d6-b620-1fb8-6464cd86874c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOS_Product_Categories', 'module', 90, 0);
INSERT INTO `acl_actions` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `category`, `acltype`, `aclaccess`, `deleted`) VALUES
('c1483d37-293e-08ec-00f7-6464cd9ce106', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'massupdate', 'Employees', 'module', 90, 0),
('c19894c3-f910-4cc5-7934-6464cdbbf6ad', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Meetings', 'module', 90, 0),
('c1cb063d-96b5-c086-97f1-6464cd7dd8ee', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'jjwg_Address_Cache', 'module', 90, 0),
('c1ea3e08-51ff-9f59-c4ac-6464cda38990', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AM_TaskTemplates', 'module', 90, 0),
('c32b603d-cee3-cf48-328d-6464cd2629bf', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'SurveyQuestionOptions', 'module', 90, 0),
('c3d8667e-9fcb-520d-8f60-6464cd44eee1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Surveys', 'module', 89, 0),
('c3ef0c57-07fb-3728-1d97-6464cd61f02d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOS_Quotes', 'module', 90, 0),
('c40158ea-3ec2-de10-24a8-6464cd1b9497', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AM_TaskTemplates', 'module', 90, 0),
('c4038d00-eca4-f1f9-7a09-6464cda5381a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Meetings', 'module', 90, 0),
('c424d8c7-63d5-77bd-fcd0-6464cddd72f9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOS_Product_Categories', 'module', 90, 0),
('c6573e24-6f80-1e7b-c508-6464cd9899b6', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'jjwg_Address_Cache', 'module', 90, 0),
('c6758e99-c38a-6e3e-7826-6464cd810466', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Meetings', 'module', 90, 0),
('c6a7c85b-d096-e797-6f78-6464cdae91c7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'SurveyQuestionOptions', 'module', 90, 0),
('c71a32a1-4ade-96a7-4ab3-6464cd0e3eeb', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOS_Product_Categories', 'module', 90, 0),
('c74281f3-1263-4a3c-5a41-6464cdb45892', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOS_Quotes', 'module', 90, 0),
('c8253ad1-9d17-2dff-9635-6464cd3690e2', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Surveys', 'module', 90, 0),
('c897a8bc-7355-2d21-5fea-6464cd4d45f1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Meetings', 'module', 90, 0),
('c9f6278c-12b2-bbbc-a344-6464cd447533', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'SurveyQuestionOptions', 'module', 90, 0),
('ca485cc8-00ec-57e5-9cd4-6464cd3bee47', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOS_Product_Categories', 'module', 90, 0),
('caad82b7-32b1-0f0e-aae8-6464cd9eb78c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOS_Quotes', 'module', 90, 0),
('cab36012-2116-dea1-261f-6464cd728cf7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'jjwg_Address_Cache', 'module', 90, 0),
('cb39f43f-16ae-ce22-7f92-6464cdb3d22e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Meetings', 'module', 90, 0),
('cc8aca5f-dd9a-5539-ce9f-6464cd928040', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Surveys', 'module', 90, 0),
('ce22503e-6be1-1e0a-ea45-6464cd0a6437', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'jjwg_Address_Cache', 'module', 90, 0),
('ce2c2a90-0f1d-2b5f-e725-6464cd693cce', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Meetings', 'module', 90, 0),
('ce400a91-dd5d-830b-5118-6464cd383f89', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'EAPM', 'module', 90, 0),
('ce5a4e72-d523-68e5-927d-6464cd7feed8', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOS_Product_Categories', 'module', 90, 0),
('ce6b4472-2249-79ec-1aec-6464cdbcff77', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'SurveyQuestionOptions', 'module', 90, 0),
('cf295845-4ded-c71c-3f10-6464cd9aef10', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOS_Quotes', 'module', 90, 0),
('d249df43-bc15-a9aa-2799-6464cdf4058a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'SurveyQuestionOptions', 'module', 90, 0),
('d29ebfc7-e3f3-e706-e3e6-6464cd5b22bd', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Surveys', 'module', 90, 0),
('d32ba449-5001-ffae-7688-6464cde9e67d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'jjwg_Address_Cache', 'module', 90, 0),
('d5cc3aba-38bc-0c6f-3c31-6464cd0e7f15', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'SurveyQuestionOptions', 'module', 90, 0),
('d61a3bff-463a-2d77-0125-6464cd9c65f5', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Campaigns', 'module', 89, 0),
('d6774707-1576-ad24-cca6-6464cd6ddef2', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Surveys', 'module', 90, 0),
('d6c5b5a0-0135-dac2-3d7b-6464cd4073a8', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'jjwg_Address_Cache', 'module', 90, 0),
('d87d4d5d-f7c7-c4e1-9e03-6464cdc7ce1e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Campaigns', 'module', 90, 0),
('d8deaaee-e456-b532-6210-6464cd9f05a9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Notes', 'module', 89, 0),
('d950a141-1e2c-956a-998b-6464cdf85b86', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'SurveyQuestionOptions', 'module', 90, 0),
('d9d62269-b7df-d70d-5a04-6464cd6a194b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'jjwg_Address_Cache', 'module', 90, 0),
('da4e037d-7516-f3b2-cada-6464cdd6ce40', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Alerts', 'module', 89, 0),
('dab1c2cd-d927-5ebe-d240-6464cdb60f3e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Campaigns', 'module', 90, 0),
('dafe2970-a2ec-e930-4b91-6464cde4dd86', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOR_Reports', 'module', 89, 0),
('db13f663-1ebe-47f7-b904-6464cd4dc318', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Surveys', 'module', 90, 0),
('dbadf96c-0584-3b0c-b0d5-6464cd31921e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Notes', 'module', 90, 0),
('dcfbde47-1de1-2460-533f-6464cd55cf6a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Campaigns', 'module', 90, 0),
('dcfc1bc6-f17d-50a7-3e67-6464cdc4d39c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOS_Contracts', 'module', 89, 0),
('dd017bea-6585-302a-05a0-6464cd30c1d3', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Alerts', 'module', 90, 0),
('dd0dcf65-d813-bdda-15da-6464cdb15971', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'jjwg_Maps', 'module', 89, 0),
('dd7331f1-e671-86db-123a-6464cd4a5127', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOR_Reports', 'module', 90, 0),
('de930cf5-d4c2-77b8-5e21-6464cd375287', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOD_Index', 'module', 90, 0),
('dec072ee-eced-ff77-c71f-6464cd2e6e9d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Notes', 'module', 90, 0),
('def630ed-5fdd-650b-c66b-6464cd3f1c07', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Leads', 'module', 90, 0),
('df116c17-f4c9-7051-ad2d-6464cd70b3a3', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Campaigns', 'module', 90, 0),
('df3d822a-be09-a82c-a30f-6464cd2700c2', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'AOS_Contracts', 'module', 90, 0),
('df58ee53-8361-f160-b519-6464cd971d11', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Alerts', 'module', 90, 0),
('df6fdccc-95f0-29bf-6730-6464cd36aa88', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Surveys', 'module', 90, 0),
('dfcea30c-aeae-3d0c-5da9-6464cde19f5b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOR_Reports', 'module', 90, 0),
('e1150f90-19d7-51d8-cd28-6464cd51cf1b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Campaigns', 'module', 90, 0),
('e1214017-42a2-a37d-969f-6464cde4f1af', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Notes', 'module', 90, 0),
('e15cfe47-e9d7-583e-3c36-6464cd1d6073', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'AOS_Contracts', 'module', 90, 0),
('e18157ed-476d-8e32-5cab-6464cd73f60d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Leads', 'module', 90, 0),
('e1858f89-2c62-8c3f-a4d0-6464cdbe78f1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Alerts', 'module', 90, 0),
('e1ed8c58-9f21-69f3-783c-6464cd801728', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'jjwg_Maps', 'module', 90, 0),
('e1fc96eb-821f-f432-9496-6464cda38879', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOR_Reports', 'module', 90, 0),
('e3255fc0-03a4-034f-5026-6464cdc988fc', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Campaigns', 'module', 90, 0),
('e3db10fe-9c8f-6484-9471-6464cde55aa7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Alerts', 'module', 90, 0),
('e4100bd5-f26b-e041-71b5-6464cd4ae8c1', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Leads', 'module', 90, 0),
('e4129691-0248-eb70-85b5-6464cd1f07ca', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'AOS_Contracts', 'module', 90, 0),
('e425ad44-461a-6eaa-4030-6464cdd16143', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOR_Reports', 'module', 90, 0),
('e429b1c5-257d-a085-17de-6464cd55ae22', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Notes', 'module', 90, 0),
('e44864c1-7ebc-2753-937f-6464cd0fd3f0', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'jjwg_Maps', 'module', 90, 0),
('e4990691-b6cc-6c5b-3930-6464cd0954f9', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Surveys', 'module', 90, 0),
('e4b6efe1-712b-d54a-1cbc-6464cd3a2c43', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Accounts', 'module', 89, 0),
('e506f4a8-59bc-8ec5-165d-6464cdfd0392', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'TemplateSectionLine', 'module', 89, 0),
('e585e518-f6aa-793c-05a2-6464cd28e601', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Campaigns', 'module', 90, 0),
('e60b18d8-285b-8721-0ece-6464cdead7f5', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Alerts', 'module', 90, 0),
('e61e92e0-081b-c455-b057-6464cdff114b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Leads', 'module', 90, 0),
('e62a10f9-966a-5429-2c95-6464cd495259', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'AOS_Contracts', 'module', 90, 0),
('e66f30ca-4e6a-1eae-cfe7-6464cd0ee9f7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOR_Reports', 'module', 90, 0),
('e6efc405-191c-0107-e30f-6464cdbaea60', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'jjwg_Maps', 'module', 90, 0),
('e7664c97-3e7e-9054-94a3-6464cd0c322a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Notes', 'module', 90, 0),
('e7693675-6261-7284-5c4a-6464cd10689c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'EAPM', 'module', 89, 0),
('e76d4bfc-4aa8-73b8-e499-6464cd7070bf', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'Users', 'module', 89, 0),
('e79b2364-2cc5-79cd-50f4-6464cd504e44', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Accounts', 'module', 90, 0),
('e7eb4eb4-21df-238f-c9ec-6464cd96e33e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'TemplateSectionLine', 'module', 90, 0),
('e849eaa3-83f2-dbdd-ad7f-6464cd8999ec', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Alerts', 'module', 90, 0),
('e84b0d88-870c-fbfc-0a90-6464cddea7a0', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'fpoly_LeadImports', 'module', 90, 0),
('e86b5233-8f27-d592-a48a-6464cd01c7f7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'AOS_Contracts', 'module', 90, 0),
('e8c3e6e7-020e-aa2e-2516-6464cddf7e5e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'FP_events', 'module', 89, 0),
('e8edfa1c-ecd9-9543-680f-6464cd304b7c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOR_Reports', 'module', 90, 0),
('e90a9fbd-090c-b39a-f66a-6464cd01003d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Leads', 'module', 90, 0),
('e9519d43-d24e-349a-02de-6464cd348738', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'jjwg_Maps', 'module', 90, 0),
('e993e9d4-9b25-fd6f-498f-6464cd83ac74', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'EAPM', 'module', 90, 0),
('e9a3a2d9-f59f-11bf-7e23-6464cdb64ec7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'Users', 'module', 90, 0),
('e9a4719f-01c1-d505-d78f-6464cd268b2e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Accounts', 'module', 90, 0),
('e9c8b75e-6ec9-7793-45a8-6464cd91dfbc', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Notes', 'module', 90, 0),
('e9ce0776-2393-0c86-cfee-6464cd6a8b25', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Tasks', 'module', 90, 0),
('ea2bd4cd-a46b-8753-9209-6464cda89cdc', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'TemplateSectionLine', 'module', 90, 0),
('eae17c3c-b0d7-0030-9509-6464cdc3b6fc', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Alerts', 'module', 90, 0),
('eb01235c-d24c-1b63-a45f-6464cdc5bbf3', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'AOS_Contracts', 'module', 90, 0),
('eb0c2a15-a840-cf63-7969-6464cde7beba', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOR_Reports', 'module', 90, 0),
('eb26c023-1c56-8f25-9007-6464cdb9cce3', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'view', 'FP_events', 'module', 90, 0),
('eb4505c2-4ded-a7c7-a442-6464cdd3898c', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Leads', 'module', 90, 0),
('eb80a558-c4cf-3fb4-f885-6464cdacbb12', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'jjwg_Maps', 'module', 90, 0),
('ebbb46cc-8e3a-9063-9e0d-6464cd6e1c7b', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'Users', 'module', 90, 0),
('ebbd2ec7-e461-6ca4-c00d-6464cdd38b41', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'EAPM', 'module', 90, 0),
('ebfc208b-6a1f-3bd9-9543-6464cd8db921', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Accounts', 'module', 90, 0),
('ec6aa1f7-5439-2cea-14b8-6464cdc736c8', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'TemplateSectionLine', 'module', 90, 0),
('eca4805d-064d-c95d-dae5-6464cdbfb326', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Notes', 'module', 90, 0),
('ed00286a-ded4-543d-cfa4-6464cd6e2edf', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'AOS_Contracts', 'module', 90, 0),
('ed12a5d8-0fa6-e6ab-b4ff-6464cd045bb4', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'list', 'FP_events', 'module', 90, 0),
('ed544874-0815-3156-3c96-6464cd73650d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'Leads', 'module', 90, 0),
('ed740238-261a-ae10-1115-6464cd706033', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'access', 'AOS_Products', 'module', 89, 0),
('eddeeaaf-3540-b21b-b753-6464cdba7437', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'jjwg_Maps', 'module', 90, 0),
('ee53172d-6f6a-c9e2-dfaa-6464cdbbd669', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'EAPM', 'module', 90, 0),
('ee5d5417-6b65-0889-8c24-6464cd3ab3da', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Accounts', 'module', 90, 0),
('eec25eb8-8edf-8807-c2f6-6464cdfc53e7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'TemplateSectionLine', 'module', 90, 0),
('eec2cacb-3806-80f1-0c53-6464cd0e417a', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'Users', 'module', 90, 0),
('efb16b82-b44e-3684-633b-6464cd8deea8', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'edit', 'FP_events', 'module', 90, 0),
('f0193ca8-4c51-4f7f-75a2-6464cd8b072e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'massupdate', 'jjwg_Maps', 'module', 90, 0),
('f0729cc6-7caa-d991-5b02-6464cd759aeb', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'EAPM', 'module', 90, 0),
('f07f10ee-ad17-afae-5f92-6464cdb4887f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Accounts', 'module', 90, 0),
('f123ea20-6f05-daf3-9095-6464cdbe22d8', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'Users', 'module', 90, 0),
('f1abcdeb-8173-0637-bb8c-6464cd8040b7', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'TemplateSectionLine', 'module', 90, 0),
('f1c94594-dfe6-47a1-24ca-6464cd52aa94', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'delete', 'FP_events', 'module', 90, 0),
('f2677a5b-22c2-60b3-3fcc-6464cd420ab3', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'EAPM', 'module', 90, 0),
('f280c56b-b42d-a104-9120-6464cddaa72d', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'export', 'Accounts', 'module', 90, 0),
('f340de52-52df-0e71-2b77-6464cd1264a0', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'Users', 'module', 90, 0),
('f3cadf9d-cfb8-5a3d-c7e7-6464cd322c1f', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'import', 'FP_events', 'module', 90, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles`
--

CREATE TABLE `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles_actions`
--

CREATE TABLE `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles_users`
--

CREATE TABLE `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

CREATE TABLE `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `target_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url_redirect` varchar(255) DEFAULT NULL,
  `reminder_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates`
--

CREATE TABLE `am_projecttemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `priority` varchar(100) DEFAULT 'High',
  `override_business_hours` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_audit`
--

CREATE TABLE `am_projecttemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_contacts_1_c`
--

CREATE TABLE `am_projecttemplates_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_project_1_c`
--

CREATE TABLE `am_projecttemplates_project_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_project_1am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_projecttemplates_project_1project_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_users_1_c`
--

CREATE TABLE `am_projecttemplates_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `users_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_tasktemplates`
--

CREATE TABLE `am_tasktemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `priority` varchar(100) DEFAULT 'High',
  `percent_complete` int(255) DEFAULT '0',
  `predecessors` int(255) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT '0',
  `relationship_type` varchar(100) DEFAULT 'FS',
  `task_number` int(255) DEFAULT NULL,
  `order_number` int(255) DEFAULT NULL,
  `estimated_effort` int(255) DEFAULT NULL,
  `utilization` varchar(100) DEFAULT '0',
  `duration` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_tasktemplates_am_projecttemplates_c`
--

CREATE TABLE `am_tasktemplates_am_projecttemplates_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_tasktemplates_am_projecttemplatesam_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_tasktemplates_am_projecttemplatesam_tasktemplates_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_tasktemplates_audit`
--

CREATE TABLE `am_tasktemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `analytic_reporting`
--

CREATE TABLE `analytic_reporting` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aobh_businesshours`
--

CREATE TABLE `aobh_businesshours` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `opening_hours` varchar(100) DEFAULT '1',
  `closing_hours` varchar(100) DEFAULT '1',
  `open_status` tinyint(1) DEFAULT NULL,
  `day` varchar(100) DEFAULT 'monday'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aod_index`
--

CREATE TABLE `aod_index` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `last_optimised` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aod_index`
--

INSERT INTO `aod_index` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `last_optimised`, `location`) VALUES
('1', 'Index', '2023-05-17 12:52:33', '2023-05-17 12:52:33', '1', '1', NULL, 0, NULL, NULL, 'modules/AOD_Index/Index/Index');

-- --------------------------------------------------------

--
-- Table structure for table `aod_indexevent`
--

CREATE TABLE `aod_indexevent` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `success` tinyint(1) DEFAULT '0',
  `record_id` char(36) DEFAULT NULL,
  `record_module` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aod_indexevent_audit`
--

CREATE TABLE `aod_indexevent_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aod_index_audit`
--

CREATE TABLE `aod_index_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledgebase`
--

CREATE TABLE `aok_knowledgebase` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `revision` varchar(255) DEFAULT NULL,
  `additional_info` text,
  `user_id_c` char(36) DEFAULT NULL,
  `user_id1_c` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledgebase_audit`
--

CREATE TABLE `aok_knowledgebase_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledgebase_categories`
--

CREATE TABLE `aok_knowledgebase_categories` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aok_knowledgebase_id` varchar(36) DEFAULT NULL,
  `aok_knowledge_base_categories_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledge_base_categories`
--

CREATE TABLE `aok_knowledge_base_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledge_base_categories_audit`
--

CREATE TABLE `aok_knowledge_base_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_events`
--

CREATE TABLE `aop_case_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_events_audit`
--

CREATE TABLE `aop_case_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_updates`
--

CREATE TABLE `aop_case_updates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `internal` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_updates_audit`
--

CREATE TABLE `aop_case_updates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_charts`
--

CREATE TABLE `aor_charts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `x_field` int(11) DEFAULT NULL,
  `y_field` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_conditions`
--

CREATE TABLE `aor_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `logic_op` varchar(255) DEFAULT NULL,
  `parenthesis` varchar(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(100) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `parameter` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_fields`
--

CREATE TABLE `aor_fields` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `field_order` int(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `display` tinyint(1) DEFAULT NULL,
  `link` tinyint(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `field_function` varchar(100) DEFAULT NULL,
  `sort_by` varchar(100) DEFAULT NULL,
  `format` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `sort_order` varchar(100) DEFAULT NULL,
  `group_by` tinyint(1) DEFAULT NULL,
  `group_order` varchar(100) DEFAULT NULL,
  `group_display` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_reports`
--

CREATE TABLE `aor_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `report_module` varchar(100) DEFAULT NULL,
  `graphs_per_row` int(11) DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_reports_audit`
--

CREATE TABLE `aor_reports_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_scheduled_reports`
--

CREATE TABLE `aor_scheduled_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `schedule` varchar(100) DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `email_recipients` longtext,
  `aor_report_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_contracts`
--

CREATE TABLE `aos_contracts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_contract_value` decimal(26,6) DEFAULT NULL,
  `total_contract_value_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `customer_signed_date` date DEFAULT NULL,
  `company_signed_date` date DEFAULT NULL,
  `renewal_reminder_date` datetime DEFAULT NULL,
  `contract_type` varchar(100) DEFAULT 'Type',
  `contract_account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_contracts_audit`
--

CREATE TABLE `aos_contracts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_contracts_documents`
--

CREATE TABLE `aos_contracts_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_contracts_id` varchar(36) DEFAULT NULL,
  `documents_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_invoices`
--

CREATE TABLE `aos_invoices` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `quote_number` int(11) DEFAULT NULL,
  `quote_date` date DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `template_ddown_c` text,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_invoices_audit`
--

CREATE TABLE `aos_invoices_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_line_item_groups`
--

CREATE TABLE `aos_line_item_groups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_line_item_groups_audit`
--

CREATE TABLE `aos_line_item_groups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_pdf_templates`
--

CREATE TABLE `aos_pdf_templates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `type` varchar(100) DEFAULT NULL,
  `pdfheader` text,
  `pdffooter` text,
  `margin_left` int(255) DEFAULT '15',
  `margin_right` int(255) DEFAULT '15',
  `margin_top` int(255) DEFAULT '16',
  `margin_bottom` int(255) DEFAULT '16',
  `margin_header` int(255) DEFAULT '9',
  `margin_footer` int(255) DEFAULT '9',
  `page_size` varchar(100) DEFAULT NULL,
  `orientation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_pdf_templates_audit`
--

CREATE TABLE `aos_pdf_templates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products`
--

CREATE TABLE `aos_products` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `maincode` varchar(100) DEFAULT 'XXXX',
  `part_number` varchar(25) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT 'Good',
  `cost` decimal(26,6) DEFAULT NULL,
  `cost_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `price` decimal(26,6) DEFAULT NULL,
  `price_usdollar` decimal(26,6) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `aos_product_category_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_audit`
--

CREATE TABLE `aos_products_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_quotes`
--

CREATE TABLE `aos_products_quotes` (
  `id` char(36) NOT NULL,
  `name` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `item_description` text,
  `number` int(11) DEFAULT NULL,
  `product_qty` decimal(18,4) DEFAULT NULL,
  `product_cost_price` decimal(26,6) DEFAULT NULL,
  `product_cost_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_list_price` decimal(26,6) DEFAULT NULL,
  `product_list_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount` decimal(26,6) DEFAULT NULL,
  `product_discount_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount_amount` decimal(26,6) DEFAULT NULL,
  `product_discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount` varchar(255) DEFAULT 'Percentage',
  `product_unit_price` decimal(26,6) DEFAULT NULL,
  `product_unit_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat_amt` decimal(26,6) DEFAULT NULL,
  `vat_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `product_total_price` decimal(26,6) DEFAULT NULL,
  `product_total_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat` varchar(100) DEFAULT '5.0',
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `group_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_quotes_audit`
--

CREATE TABLE `aos_products_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_product_categories`
--

CREATE TABLE `aos_product_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT '0',
  `parent_category_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_product_categories_audit`
--

CREATE TABLE `aos_product_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes`
--

CREATE TABLE `aos_quotes` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `approval_issue` text,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `template_ddown_c` text,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `stage` varchar(100) DEFAULT 'Draft',
  `term` varchar(100) DEFAULT NULL,
  `terms_c` text,
  `approval_status` varchar(100) DEFAULT NULL,
  `invoice_status` varchar(100) DEFAULT 'Not Invoiced',
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_aos_invoices_c`
--

CREATE TABLE `aos_quotes_aos_invoices_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes77d9_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes6b83nvoices_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_audit`
--

CREATE TABLE `aos_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_os_contracts_c`
--

CREATE TABLE `aos_quotes_os_contracts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotese81e_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes4dc0ntracts_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_project_c`
--

CREATE TABLE `aos_quotes_project_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes1112_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes7207project_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_actions`
--

CREATE TABLE `aow_actions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `action_order` int(255) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `parameters` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_conditions`
--

CREATE TABLE `aow_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_processed`
--

CREATE TABLE `aow_processed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_processed_aow_actions`
--

CREATE TABLE `aow_processed_aow_actions` (
  `id` varchar(36) NOT NULL,
  `aow_processed_id` varchar(36) DEFAULT NULL,
  `aow_action_id` varchar(36) DEFAULT NULL,
  `status` varchar(36) DEFAULT 'Pending',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_workflow`
--

CREATE TABLE `aow_workflow` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `flow_module` varchar(100) DEFAULT NULL,
  `flow_run_on` varchar(100) DEFAULT '0',
  `status` varchar(100) DEFAULT 'Active',
  `run_when` varchar(100) DEFAULT 'Always',
  `multiple_runs` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_workflow_audit`
--

CREATE TABLE `aow_workflow_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `asteriskintegration`
--

CREATE TABLE `asteriskintegration` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `direction` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `call_date` date DEFAULT NULL,
  `call_time` varchar(255) DEFAULT NULL,
  `asterisk_server` varchar(100) DEFAULT NULL,
  `disposition` varchar(100) DEFAULT NULL,
  `extension` varchar(20) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `duration_hours` varchar(100) DEFAULT NULL,
  `duration_minutes` varchar(100) DEFAULT NULL,
  `duration_seconds` varchar(100) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `recording_link` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `unique_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `asteriskintegration_accounts`
--

CREATE TABLE `asteriskintegration_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `asteriskintegration_accountsaccounts_ida` varchar(36) DEFAULT NULL,
  `asteriskintegration_accountsasteriskintegration_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `asteriskintegration_contacts`
--

CREATE TABLE `asteriskintegration_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `asteriskintegration_contactscontacts_ida` varchar(36) DEFAULT NULL,
  `asteriskintegration_contactsasteriskintegration_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `asteriskintegration_leads`
--

CREATE TABLE `asteriskintegration_leads` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `asteriskintegration_leadsleads_ida` varchar(36) DEFAULT NULL,
  `asteriskintegration_leadsasteriskintegration_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `asteriskintegration_servers`
--

CREATE TABLE `asteriskintegration_servers` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `server_ip` int(11) NOT NULL,
  `socket_port` int(11) NOT NULL,
  `ami_port` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

CREATE TABLE `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugs_audit`
--

CREATE TABLE `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

CREATE TABLE `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT '0',
  `duration_minutes` int(2) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Held',
  `direction` varchar(100) DEFAULT 'Outbound',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calls`
--

INSERT INTO `calls` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `duration_hours`, `duration_minutes`, `date_start`, `date_end`, `parent_type`, `status`, `direction`, `parent_id`, `reminder_time`, `email_reminder_time`, `email_reminder_sent`, `outlook_id`, `repeat_type`, `repeat_interval`, `repeat_dow`, `repeat_until`, `repeat_count`, `repeat_parent_id`, `recurring_source`) VALUES
('17b5d0c6-b099-8612-727c-6469a2a6f932', NULL, '2023-05-21 04:47:53', '2023-05-21 04:47:53', '1', '1', 'hkghka', 0, '1', 0, 0, '2023-05-20 05:00:00', '2023-05-20 05:00:00', 'Leads', 'Held', 'Outbound', '3cae6e4f-bc4d-81df-c343-6464cfdf40e5', -1, -1, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
('3c2d7684-62c8-9bd7-aada-6469a2d34493', NULL, '2023-05-21 04:48:32', '2023-05-21 04:48:32', '1', '1', 'hkaghkagkdf', 0, '1', 0, 0, '2023-05-21 05:00:00', '2023-05-21 05:00:00', 'Leads', 'Held', 'Outbound', '3cae6e4f-bc4d-81df-c343-6464cfdf40e5', -1, -1, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
('3e6179ca-9a0c-8009-68e0-6468f89a8ebb', NULL, '2023-05-20 16:41:19', '2023-05-20 16:41:19', '1', '1', 'ádfbvjmdfsabghvfjadsgfdsa', 0, '1', 0, 0, '2023-05-20 16:45:00', '2023-05-20 16:45:00', 'Leads', 'Held', 'Outbound', '4979b343-0026-d607-b17e-6464cf849a51', -1, -1, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
('5d19994b-35ce-98cd-921f-6468f0a4de99', NULL, '2023-05-20 16:10:39', '2023-05-20 16:10:39', '1', '1', 'Thử thôi', 0, '1', 0, 0, '2023-05-20 16:15:00', '2023-05-20 16:15:00', 'Leads', 'Held', 'Outbound', '3b640e05-181b-6b95-4d10-6464cf0e6382', -1, -1, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
('5f02a914-4e38-1057-0030-6468eea4052f', NULL, '2023-05-20 16:00:42', '2023-05-20 16:00:42', '1', '1', 'Gâu gâu', 0, '1', 0, 0, '2023-05-20 16:00:00', '2023-05-20 16:00:00', 'Leads', 'Held', 'Outbound', '3cae6e4f-bc4d-81df-c343-6464cfdf40e5', -1, -1, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
('745c1495-2c39-801b-7765-6468f6266280', NULL, '2023-05-20 16:32:16', '2023-05-20 16:32:16', '1', '1', 'Ngày hôm trước', 0, '1', 0, 0, '2023-05-19 16:45:00', '2023-05-19 16:45:00', 'Leads', 'Held', 'Outbound', '4979b343-0026-d607-b17e-6464cf849a51', -1, -1, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
('982e460f-0575-2c8e-61af-6465d73b40be', NULL, '2023-05-18 07:45:00', '2023-05-18 07:45:00', '1', '1', '0 co chj', 0, '1', 0, 0, '2023-05-18 07:45:00', '2023-05-18 07:45:00', 'Leads', 'Held', 'Outbound', '3b640e05-181b-6b95-4d10-6464cf0e6382', -1, -1, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `calls_contacts`
--

CREATE TABLE `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_leads`
--

CREATE TABLE `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calls_leads`
--

INSERT INTO `calls_leads` (`id`, `call_id`, `lead_id`, `required`, `accept_status`, `date_modified`, `deleted`) VALUES
('1bd7f2de-60a5-3091-29d4-6469a290d97f', '17b5d0c6-b099-8612-727c-6469a2a6f932', '3cae6e4f-bc4d-81df-c343-6464cfdf40e5', '1', 'none', '2023-05-21 04:47:53', 0),
('41290ec0-97f8-d7b6-91ad-6469a2671e18', '3c2d7684-62c8-9bd7-aada-6469a2d34493', '3cae6e4f-bc4d-81df-c343-6464cfdf40e5', '1', 'none', '2023-05-21 04:48:32', 0),
('42a5704c-05ce-1525-297e-6468f8f9b9cc', '3e6179ca-9a0c-8009-68e0-6468f89a8ebb', '4979b343-0026-d607-b17e-6464cf849a51', '1', 'none', '2023-05-20 16:41:19', 0),
('618ec4ac-8407-e651-8e11-6468ee8dc5c6', '5f02a914-4e38-1057-0030-6468eea4052f', '3cae6e4f-bc4d-81df-c343-6464cfdf40e5', '1', 'none', '2023-05-20 16:00:42', 0),
('61b5a911-384f-6012-31c6-6468f076a184', '5d19994b-35ce-98cd-921f-6468f0a4de99', '3b640e05-181b-6b95-4d10-6464cf0e6382', '1', 'none', '2023-05-20 16:10:39', 0),
('77eb4e39-58aa-02c5-dcf2-6468f6a482d3', '745c1495-2c39-801b-7765-6468f6266280', '4979b343-0026-d607-b17e-6464cf849a51', '1', 'none', '2023-05-20 16:32:16', 0),
('9ffee8f4-ccc8-109b-0740-6465d72dbbf4', '982e460f-0575-2c8e-61af-6465d73b40be', '3b640e05-181b-6b95-4d10-6464cf0e6382', '1', 'none', '2023-05-18 07:45:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `calls_reschedule`
--

CREATE TABLE `calls_reschedule` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_reschedule_audit`
--

CREATE TABLE `calls_reschedule_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_users`
--

CREATE TABLE `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calls_users`
--

INSERT INTO `calls_users` (`id`, `call_id`, `user_id`, `required`, `accept_status`, `date_modified`, `deleted`) VALUES
('447c2024-eea6-367d-5307-6468ee44e4a4', '5f02a914-4e38-1057-0030-6468eea4052f', '1', '1', 'accept', '2023-05-20 16:00:42', 0),
('5734b146-19fd-ae50-7cc8-6468f897c006', '3e6179ca-9a0c-8009-68e0-6468f89a8ebb', '1', '1', 'accept', '2023-05-20 16:41:19', 0),
('857f61d9-44c4-337a-7f8c-6469a20c6b85', '3c2d7684-62c8-9bd7-aada-6469a2d34493', '1', '1', 'accept', '2023-05-21 04:48:32', 0),
('ce04066c-b3b5-15aa-9e54-6468f6715cc2', '745c1495-2c39-801b-7765-6468f6266280', '1', '1', 'accept', '2023-05-20 16:32:16', 0),
('d6a6901c-2b82-db43-4bb9-6469a22d6b56', '17b5d0c6-b099-8612-727c-6469a2a6f932', '1', '1', 'accept', '2023-05-21 04:47:53', 0),
('d893292a-ecf3-b2c3-a036-6468f010ad4e', '5d19994b-35ce-98cd-921f-6468f0a4de99', '1', '1', 'accept', '2023-05-20 16:10:39', 0),
('db53938d-6963-b6ca-00df-6465d7d54968', '982e460f-0575-2c8e-61af-6465d73b40be', '1', '1', 'accept', '2023-05-18 07:45:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL,
  `tracker_count` int(11) DEFAULT '0',
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT '0',
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text,
  `content` text,
  `frequency` varchar(100) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns_audit`
--

CREATE TABLE `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_log`
--

CREATE TABLE `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_trkrs`
--

CREATE TABLE `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(255) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `work_log` text,
  `account_id` char(36) DEFAULT NULL,
  `state` varchar(100) DEFAULT 'Open',
  `contact_created_by_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases_audit`
--

CREATE TABLE `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases_bugs`
--

CREATE TABLE `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases_cstm`
--

CREATE TABLE `cases_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`category`, `name`, `value`) VALUES
('notify', 'fromaddress', 'do_not_reply@example.com'),
('notify', 'fromname', 'SuiteCRM'),
('notify', 'send_by_default', '1'),
('notify', 'on', '1'),
('notify', 'send_from_assigning_user', '0'),
('info', 'sugar_version', '6.5.25'),
('MySettings', 'tab', 'YTozODp7aTowO3M6NDoiSG9tZSI7aToxO3M6ODoiQWNjb3VudHMiO2k6MjtzOjg6IkNvbnRhY3RzIjtpOjM7czoxMzoiT3Bwb3J0dW5pdGllcyI7aTo0O3M6NToiTGVhZHMiO2k6NTtzOjEwOiJBT1NfUXVvdGVzIjtpOjY7czo4OiJDYWxlbmRhciI7aTo3O3M6OToiRG9jdW1lbnRzIjtpOjg7czo2OiJFbWFpbHMiO2k6OTtzOjU6IlNwb3RzIjtpOjEwO3M6OToiQ2FtcGFpZ25zIjtpOjExO3M6NToiQ2FsbHMiO2k6MTI7czo4OiJNZWV0aW5ncyI7aToxMztzOjU6IlRhc2tzIjtpOjE0O3M6NToiTm90ZXMiO2k6MTU7czoxMjoiQU9TX0ludm9pY2VzIjtpOjE2O3M6MTM6IkFPU19Db250cmFjdHMiO2k6MTc7czo1OiJDYXNlcyI7aToxODtzOjk6IlByb3NwZWN0cyI7aToxOTtzOjEzOiJQcm9zcGVjdExpc3RzIjtpOjIwO3M6NzoiUHJvamVjdCI7aToyMTtzOjE5OiJBTV9Qcm9qZWN0VGVtcGxhdGVzIjtpOjIyO3M6MTY6IkFNX1Rhc2tUZW1wbGF0ZXMiO2k6MjM7czo5OiJGUF9ldmVudHMiO2k6MjQ7czoxODoiRlBfRXZlbnRfTG9jYXRpb25zIjtpOjI1O3M6MTI6IkFPU19Qcm9kdWN0cyI7aToyNjtzOjIyOiJBT1NfUHJvZHVjdF9DYXRlZ29yaWVzIjtpOjI3O3M6MTc6IkFPU19QREZfVGVtcGxhdGVzIjtpOjI4O3M6OToiamp3Z19NYXBzIjtpOjI5O3M6MTI6Impqd2dfTWFya2VycyI7aTozMDtzOjEwOiJqandnX0FyZWFzIjtpOjMxO3M6MTg6Impqd2dfQWRkcmVzc19DYWNoZSI7aTozMjtzOjExOiJBT1JfUmVwb3J0cyI7aTozMztzOjEyOiJBT1dfV29ya0Zsb3ciO2k6MzQ7czoxNzoiQU9LX0tub3dsZWRnZUJhc2UiO2k6MzU7czoyOToiQU9LX0tub3dsZWRnZV9CYXNlX0NhdGVnb3JpZXMiO2k6MzY7czoxNDoiRW1haWxUZW1wbGF0ZXMiO2k6Mzc7czo3OiJTdXJ2ZXlzIjt9'),
('portal', 'on', '0'),
('tracker', 'Tracker', '1'),
('system', 'skypeout_on', '1'),
('sugarfeed', 'enabled', '1'),
('sugarfeed', 'module_UserFeed', '1'),
('sugarfeed', 'module_Cases', '1'),
('sugarfeed', 'module_Contacts', '1'),
('sugarfeed', 'module_Leads', '1'),
('sugarfeed', 'module_Opportunities', '1'),
('Update', 'CheckUpdates', 'manual'),
('system', 'name', 'SuiteCRM'),
('system', 'adminwizard', '1'),
('notify', 'allow_default_outbound', '0');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `lawful_basis` text,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `joomla_account_id` varchar(255) DEFAULT NULL,
  `portal_account_disabled` tinyint(1) DEFAULT NULL,
  `portal_user_type` varchar(100) DEFAULT 'Single'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `salutation`, `first_name`, `last_name`, `title`, `photo`, `department`, `do_not_call`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `lawful_basis`, `date_reviewed`, `lawful_basis_source`, `primary_address_street`, `primary_address_city`, `primary_address_state`, `primary_address_postalcode`, `primary_address_country`, `alt_address_street`, `alt_address_city`, `alt_address_state`, `alt_address_postalcode`, `alt_address_country`, `assistant`, `assistant_phone`, `lead_source`, `reports_to_id`, `birthdate`, `campaign_id`, `joomla_account_id`, `portal_account_disabled`, `portal_user_type`) VALUES
('2b7e0b7b-329a-b160-2e0f-646746069aae', '2023-05-19 09:49:50', '2023-05-19 09:49:50', '1', '1', NULL, 0, '1', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Single'),
('8f22ce18-1324-5913-4d45-6464ea27963f', '2023-05-17 14:55:49', '2023-05-17 14:55:49', '501ca596-4cc7-9be3-cd73-6464e9a61d59', '501ca596-4cc7-9be3-cd73-6464e9a61d59', NULL, 0, '501ca596-4cc7-9be3-cd73-6464e9a61d59', NULL, NULL, '', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Single');

-- --------------------------------------------------------

--
-- Table structure for table `contacts_audit`
--

CREATE TABLE `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_bugs`
--

CREATE TABLE `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_cases`
--

CREATE TABLE `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_cstm`
--

CREATE TABLE `contacts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts_cstm`
--

INSERT INTO `contacts_cstm` (`id_c`, `jjwg_maps_lng_c`, `jjwg_maps_lat_c`, `jjwg_maps_geocode_status_c`, `jjwg_maps_address_c`) VALUES
('2b7e0b7b-329a-b160-2e0f-646746069aae', 0.00000000, 0.00000000, NULL, NULL),
('8f22ce18-1324-5913-4d45-6464ea27963f', 0.00000000, 0.00000000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts_users`
--

CREATE TABLE `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cron_remove_documents`
--

CREATE TABLE `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT '0',
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `template_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_accounts`
--

CREATE TABLE `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_bugs`
--

CREATE TABLE `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_cases`
--

CREATE TABLE `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_contacts`
--

CREATE TABLE `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_opportunities`
--

CREATE TABLE `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `document_revisions`
--

CREATE TABLE `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `eapm`
--

CREATE TABLE `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emailman`
--

CREATE TABLE `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT '0',
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `related_confirm_opt_in` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `orphaned` tinyint(1) DEFAULT NULL,
  `last_synced` datetime DEFAULT NULL,
  `date_sent_received` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_beans`
--

CREATE TABLE `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_email_addr_rel`
--

CREATE TABLE `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_text`
--

CREATE TABLE `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text,
  `cc_addrs` text,
  `bcc_addrs` text,
  `description` longtext,
  `description_html` longtext,
  `raw_source` longtext,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_addresses`
--

CREATE TABLE `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `confirm_opt_in` varchar(255) DEFAULT 'not-opt-in',
  `confirm_opt_in_date` datetime DEFAULT NULL,
  `confirm_opt_in_sent_date` datetime DEFAULT NULL,
  `confirm_opt_in_fail_date` datetime DEFAULT NULL,
  `confirm_opt_in_token` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addresses`
--

INSERT INTO `email_addresses` (`id`, `email_address`, `email_address_caps`, `invalid_email`, `opt_out`, `confirm_opt_in`, `confirm_opt_in_date`, `confirm_opt_in_sent_date`, `confirm_opt_in_fail_date`, `confirm_opt_in_token`, `date_created`, `date_modified`, `deleted`) VALUES
('52e1a468-bafa-2ad3-3c90-6464e989befd', 'vinhndqph26105@fpt.edu.vn', 'VINHNDQPH26105@FPT.EDU.VN', 0, 0, 'confirmed-opt-in', NULL, NULL, NULL, NULL, '2023-05-17 14:49:00', '2023-05-18 15:45:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_addresses_audit`
--

CREATE TABLE `email_addresses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addresses_audit`
--

INSERT INTO `email_addresses_audit` (`id`, `parent_id`, `date_created`, `created_by`, `field_name`, `data_type`, `before_value_string`, `after_value_string`, `before_value_text`, `after_value_text`) VALUES
('4b2c931e-b423-b0f6-bf47-6464e9baf391', '52e1a468-bafa-2ad3-3c90-6464e989befd', '2023-05-17 14:49:57', '1', 'confirm_opt_in', 'enum', 'not-opt-in', 'confirmed-opt-in', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_addr_bean_rel`
--

CREATE TABLE `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addr_bean_rel`
--

INSERT INTO `email_addr_bean_rel` (`id`, `email_address_id`, `bean_id`, `bean_module`, `primary_address`, `reply_to_address`, `date_created`, `date_modified`, `deleted`) VALUES
('526e644a-2179-94d5-7a83-6464e9512ff0', '52e1a468-bafa-2ad3-3c90-6464e989befd', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'Users', 1, 0, '2023-05-17 14:49:57', '2023-05-17 14:49:57', 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_cache`
--

CREATE TABLE `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) UNSIGNED DEFAULT NULL,
  `imap_uid` int(10) UNSIGNED DEFAULT NULL,
  `msgno` int(10) UNSIGNED DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing`
--

CREATE TABLE `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `outbound_email_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing_prospect_lists`
--

CREATE TABLE `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` longtext,
  `body_html` longtext,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `published`, `name`, `description`, `subject`, `body`, `body_html`, `deleted`, `assigned_user_id`, `text_only`, `type`) VALUES
('109b2109-b47f-4ba3-5b4b-6464cd709b67', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'off', 'Case Creation', 'Template to send to a contact when a case is received from them.', '$acase_name [CASE:$acase_case_number]', 'Hi $contact_first_name $contact_last_name,\r\n\r\n					   We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered\r\n					   Status:		$acase_status\r\n					   Reference:	$acase_case_number\r\n					   Description:	$acase_description', '<p> Hi $contact_first_name $contact_last_name,</p>\r\n					    <p>We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered</p>\r\n					    <table border=\"0\"><tbody>\r\n					    <tr><td>Status</td><td>$acase_status</td></tr>\r\n					    <tr><td>Reference</td><td>$acase_case_number</td></tr>\r\n					    <tr><td>Description</td><td>$acase_description</td></tr>\r\n					    </tbody></table>', 0, NULL, NULL, 'system'),
('278e707a-fee8-4c03-341f-6464cd922877', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'off', 'System-generated password email', 'This template is used when the System Administrator sends a new password to a user.', 'New account information', '\r\nHere is your account username and temporary password:\r\nUsername : $contact_user_user_name\r\nPassword : $contact_user_user_hash\r\n\r\n$config_site_url\r\n\r\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.', '<div><table width=\"550\"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr> </tbody></table> </div>', 0, NULL, 0, 'system'),
('2c3bc4ef-aa25-47e1-b177-6464cd699bde', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'off', 'Forgot Password email', 'This template is used to send a user a link to click to reset the user\'s account password.', 'Reset your account password', '\r\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\r\n\r\nClick on the link below to reset your password:\r\n\r\n$contact_user_link_guid', '<div><table width=\"550\"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr> </tbody></table> </div>', 0, NULL, 0, 'system'),
('306f8d4a-8ca2-d8cf-7c3e-6464cd440f06', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'off', 'Two Factor Authentication email', 'This template is used to send a user a code for Two Factor Authentication.', 'Two Factor Authentication Code', 'Two Factor Authentication code is $code.', '<div><table width=\"550\"><tbody><tr><td><p>Two Factor Authentication code is <b>$code</b>.</p>  </td>         </tr><tr><td></td>         </tr> </tbody></table> </div>', 0, NULL, 0, 'system'),
('4c4fd28b-f4c4-e70f-d26c-6464cd82e53e', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'off', 'Confirmed Opt In', 'Email template to send to a contact to confirm they have opted in.', 'Confirm Opt In', 'Hi $contact_first_name $contact_last_name, \\n Please confirm that you have opted in by selecting the following link: $sugarurl/index.php?entryPoint=ConfirmOptIn&from=$emailaddress_email_address', '<p>Hi $contact_first_name $contact_last_name,</p>\r\n             <p>\r\n                Please confirm that you have opted in by selecting the following link:\r\n                <a href=\"$sugarurl/index.php?entryPoint=ConfirmOptIn&from=$emailaddress_confirm_opt_in_token\">Opt In</a>\r\n             </p>', 0, NULL, NULL, 'system'),
('75604cea-782a-b11e-8c88-6464cd669cd0', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'off', 'Contact Case Update', 'Template to send to a contact when their case is updated.', '$acase_name update [CASE:$acase_case_number]', 'Hi $user_first_name $user_last_name,\r\n\r\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\r\n					       $contact_first_name $contact_last_name, said:\r\n					               $aop_case_updates_description', '<p>Hi $contact_first_name $contact_last_name,</p>\r\n					    <p> </p>\r\n					    <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\r\n					    <p><strong>$user_first_name $user_last_name said:</strong></p>\r\n					    <p style=\"padding-left:30px;\">$aop_case_updates_description</p>', 0, NULL, NULL, 'system'),
('7a8384e5-a590-9ba5-514d-6464cdcec6ac', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'off', 'User Case Update', 'Email template to send to a Sugar user when their case is updated.', '$acase_name (# $acase_case_number) update', 'Hi $user_first_name $user_last_name,\r\n\r\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\r\n					       $contact_first_name $contact_last_name, said:\r\n					               $aop_case_updates_description\r\n                        You may review this Case at:\r\n                            $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;', '<p>Hi $user_first_name $user_last_name,</p>\r\n					     <p> </p>\r\n					     <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\r\n					     <p><strong>$contact_first_name $contact_last_name, said:</strong></p>\r\n					     <p style=\"padding-left:30px;\">$aop_case_updates_description</p>\r\n					     <p>You may review this Case at: $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;</p>', 0, NULL, NULL, 'system'),
('81670064-e948-09b3-a97a-6464cd630c58', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'off', 'Joomla Account Creation', 'Template used when informing a contact that they\'ve been given an account on the joomla portal.', 'Support Portal Account Created', 'Hi $contact_name,\r\n					   An account has been created for you at $portal_address.\r\n					   You may login using this email address and the password $joomla_pass', '<p>Hi $contact_name,</p>\r\n					    <p>An account has been created for you at <a href=\"$portal_address\">$portal_address</a>.</p>\r\n					    <p>You may login using this email address and the password $joomla_pass</p>', 0, NULL, NULL, 'system'),
('d64d6047-68d5-ea5a-ae94-6464cd4b4434', '2013-05-24 14:31:45', '2023-05-17 12:51:10', '1', '1', 'off', 'Event Invite Template', 'Default event invite template.', 'You have been invited to $fp_events_name', 'Dear $contact_name,\r\nYou have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end\r\n$fp_events_description\r\nYours Sincerely,\r\n', '\r\n<p>Dear $contact_name,</p>\r\n<p>You have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end</p>\r\n<p>$fp_events_description</p>\r\n<p>If you would like to accept this invititation please click accept.</p>\r\n<p> $fp_events_link or $fp_events_link_declined</p>\r\n<p>Yours Sincerely,</p>\r\n', 0, NULL, NULL, 'system'),
('f0a6a49c-1f13-0656-2163-6464cd7483ce', '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'off', 'Case Closure', 'Template for informing a contact that their case has been closed.', '$acase_name [CASE:$acase_case_number] closed', 'Hi $contact_first_name $contact_last_name,\r\n\r\n					   Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered\r\n					   Status:				$acase_status\r\n					   Reference:			$acase_case_number\r\n					   Resolution:			$acase_resolution', '<p> Hi $contact_first_name $contact_last_name,</p>\r\n					    <p>Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered</p>\r\n					    <table border=\"0\"><tbody>\r\n					    <tr><td>Status</td><td>$acase_status</td></tr>\r\n					    <tr><td>Reference</td><td>$acase_case_number</td></tr>\r\n					    <tr><td>Resolution</td><td>$acase_resolution</td></tr>\r\n					    </tbody></table>', 0, NULL, NULL, 'system');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fields_meta_data`
--

CREATE TABLE `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `audited` tinyint(1) DEFAULT '0',
  `massupdate` tinyint(1) DEFAULT '0',
  `duplicate_merge` smallint(6) DEFAULT '0',
  `reportable` tinyint(1) DEFAULT '1',
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields_meta_data`
--

INSERT INTO `fields_meta_data` (`id`, `name`, `vname`, `comments`, `help`, `custom_module`, `type`, `len`, `required`, `default_value`, `date_modified`, `deleted`, `audited`, `massupdate`, `duplicate_merge`, `reportable`, `importable`, `ext1`, `ext2`, `ext3`, `ext4`) VALUES
('Accountsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Accounts', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Accountsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Accounts', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Accountsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Accounts', 'float', 10, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Accountsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Accounts', 'float', 11, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Casesjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Cases', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Casesjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Cases', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Casesjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Cases', 'float', 10, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Casesjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Cases', 'float', 11, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Contactsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Contacts', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Contactsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Contacts', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Contactsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Contacts', 'float', 10, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Contactsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Contacts', 'float', 11, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Leadsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Leads', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Leadsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Leads', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Leadsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Leads', 'float', 10, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Leadsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Leads', 'float', 11, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Leadsrating_c', 'rating_c', 'LBL_RATING_C', '', '', 'Leads', 'enum', 100, 0, '', '2023-05-20 12:22:34', 0, 0, 0, 0, 1, 'true', 'rating_list', '', '', ''),
('Leadsschedule_date_c', 'schedule_date_c', 'LBL_SCHEDULE_DATE_C', NULL, NULL, 'Leads', 'date', NULL, 0, 'now', '2023-05-19 17:35:15', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('Meetingsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Meetings', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Meetingsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Meetings', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Meetingsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Meetings', 'float', 10, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Meetingsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Meetings', 'float', 11, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Opportunitiesjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Opportunities', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Opportunitiesjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Opportunities', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Opportunitiesjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Opportunities', 'float', 10, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Opportunitiesjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Opportunities', 'float', 11, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Projectjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Project', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Projectjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Project', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Projectjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Project', 'float', 10, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Projectjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Project', 'float', 11, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Prospectsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Prospects', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Prospectsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Prospects', 'varchar', 255, 0, NULL, '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Prospectsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Prospects', 'float', 10, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Prospectsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Prospects', 'float', 11, 0, '0.00000000', '2023-05-17 12:51:10', 0, 0, 0, 0, 1, 'true', '8', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `folders_rel`
--

CREATE TABLE `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `folders_subscriptions`
--

CREATE TABLE `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fpoly_leadimports`
--

CREATE TABLE `fpoly_leadimports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `phone_home` varchar(255) DEFAULT NULL,
  `phone_mobile` varchar(255) DEFAULT NULL,
  `phone_work` varchar(255) DEFAULT NULL,
  `phone_other` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `expected_major` varchar(255) DEFAULT NULL,
  `expected_job` varchar(255) DEFAULT NULL,
  `telesales` varchar(255) DEFAULT NULL,
  `parent1_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `duplicate_status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fpoly_leadimports`
--

INSERT INTO `fpoly_leadimports` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `birthdate`, `area`, `school`, `lead_source`, `rating`, `status`, `class`, `email`, `facebook`, `city`, `expected_major`, `expected_job`, `telesales`, `parent1_name`, `address`, `duplicate_status`) VALUES
('45385871-7e20-8347-50a4-6465d47e7eb6', 'Tét', '2023-05-18 07:34:08', '2023-05-18 07:34:08', '1', '1', NULL, 0, '1', '0', '0', '0', '0', NULL, NULL, '', 'google', 'hot_lead', '', '', '', '', '', NULL, '', NULL, '', '', 'missing'),
('53d22934-f90b-36b3-b1e8-6464ced6277b', '\"Họ và tên', '2023-05-17 12:54:59', '2023-05-17 13:03:08', '1', '1', NULL, 1, '1', '0', '0', '0', '0', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'missing'),
('78dc4ba1-c1ed-ddef-894a-6464ce3ce992', '\"Default Name for fpoly_LeadImports', '2023-05-17 12:54:59', '2023-05-17 13:03:08', '1', '1', NULL, 1, '1', '0', '0', '0', '0', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'missing'),
('7f006485-dee5-9533-82c9-6464cef2e628', '\"Default Name for fpoly_LeadImports', '2023-05-17 12:54:59', '2023-05-17 13:03:08', '1', '1', NULL, 1, '1', '0', '0', '0', '0', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'missing'),
('7f21dcd2-8a5d-ad82-728e-6464cfeb28ff', 'Sách hóa khỉ khổng lồ 2', '2023-05-17 12:56:53', '2023-05-17 13:03:08', '1', '1', NULL, 0, '1', '0968739042', '0968739042', '0', '0', '2003-11-11', NULL, 'THPT Yên Lãng', 'zalo', 'not_lead', 'New', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'new'),
('822d0e21-97ea-4da9-3bcc-646651f2cbf1', 'Vinh vjp pro', '2023-05-18 16:24:03', '2023-05-18 16:24:03', '501ca596-4cc7-9be3-cd73-6464e9a61d59', '501ca596-4cc7-9be3-cd73-6464e9a61d59', NULL, 0, '501ca596-4cc7-9be3-cd73-6464e9a61d59', '0', '0', '0', '0', NULL, NULL, 'THPT Yên Lãng', 'online', '', '', '', '', '', '', NULL, '', NULL, '', '', 'missing'),
('846b0d90-ecf2-92c4-9870-6464cebf0d3b', 'Nguyễn Duy Quang Vinh', '2023-05-17 12:54:59', '2023-05-17 12:56:11', '1', '1', NULL, 0, '1', '0968739042', '0968739042', '0', '0', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'missing'),
('89d30519-d320-8f99-b75c-6464ce454229', '\"Default Name for fpoly_LeadImports', '2023-05-17 12:54:59', '2023-05-17 12:54:59', '1', '1', NULL, 0, '1', '0', '0', '0', '0', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'missing'),
('8f047881-2d68-d7f7-9c7e-6464ce76d605', '\"Default Name for fpoly_LeadImports', '2023-05-17 12:54:59', '2023-05-17 12:54:59', '1', '1', NULL, 0, '1', '0', '0', '0', '0', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'missing');

-- --------------------------------------------------------

--
-- Table structure for table `fpoly_leadimports_audit`
--

CREATE TABLE `fpoly_leadimports_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fpoly_leadimports_audit`
--

INSERT INTO `fpoly_leadimports_audit` (`id`, `parent_id`, `date_created`, `created_by`, `field_name`, `data_type`, `before_value_string`, `after_value_string`, `before_value_text`, `after_value_text`) VALUES
('1a248bd2-0ae9-826d-7386-6464cefbb87d', '846b0d90-ecf2-92c4-9870-6464cebf0d3b', '2023-05-17 12:56:11', '1', 'phone_mobile', 'phone', '0', '0968739042', NULL, NULL),
('3ba3bb7f-0298-c2fc-68e4-6464cef363f4', '846b0d90-ecf2-92c4-9870-6464cebf0d3b', '2023-05-17 12:55:53', '1', 'phone_home', 'phone', '0', '0968739042', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fpoly_leadimports_leads_1_c`
--

CREATE TABLE `fpoly_leadimports_leads_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fpoly_leadimports_leads_1fpoly_leadimports_ida` varchar(36) DEFAULT NULL,
  `fpoly_leadimports_leads_1leads_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fpoly_leadimports_leads_1_c`
--

INSERT INTO `fpoly_leadimports_leads_1_c` (`id`, `date_modified`, `deleted`, `fpoly_leadimports_leads_1fpoly_leadimports_ida`, `fpoly_leadimports_leads_1leads_idb`) VALUES
('5781fbf5-6071-dc14-e6a4-6465d585a1a8', '2023-05-18 07:35:13', 0, '45385871-7e20-8347-50a4-6465d47e7eb6', '56e2e7d1-41b0-447d-4a8f-6464cfcf6d40'),
('5d7e87d6-0954-b95c-ccad-6465d7a3ef58', '2023-05-18 07:48:41', 0, '45385871-7e20-8347-50a4-6465d47e7eb6', '3b640e05-181b-6b95-4d10-6464cf0e6382');

-- --------------------------------------------------------

--
-- Table structure for table `fpoly_schools`
--

CREATE TABLE `fpoly_schools` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fpoly_schools_audit`
--

CREATE TABLE `fpoly_schools_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events`
--

CREATE TABLE `fp_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `budget` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `invite_templates` varchar(100) DEFAULT NULL,
  `accept_redirect` varchar(255) DEFAULT NULL,
  `decline_redirect` varchar(255) DEFAULT NULL,
  `activity_status_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_audit`
--

CREATE TABLE `fp_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_contacts_c`
--

CREATE TABLE `fp_events_contacts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_contactsfp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_contactscontacts_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_fp_event_delegates_1_c`
--

CREATE TABLE `fp_events_fp_event_delegates_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_delegates_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_delegates_1fp_event_delegates_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_fp_event_locations_1_c`
--

CREATE TABLE `fp_events_fp_event_locations_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_locations_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_locations_1fp_event_locations_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_leads_1_c`
--

CREATE TABLE `fp_events_leads_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_leads_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_leads_1leads_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_prospects_1_c`
--

CREATE TABLE `fp_events_prospects_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_prospects_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_prospects_1prospects_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_event_locations`
--

CREATE TABLE `fp_event_locations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_event_locations_audit`
--

CREATE TABLE `fp_event_locations_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_event_locations_fp_events_1_c`
--

CREATE TABLE `fp_event_locations_fp_events_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_event_locations_fp_events_1fp_event_locations_ida` varchar(36) DEFAULT NULL,
  `fp_event_locations_fp_events_1fp_events_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `import_maps`
--

CREATE TABLE `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text,
  `default_values` text,
  `has_header` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email`
--

CREATE TABLE `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text,
  `delete_seen` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT '0',
  `groupfolder_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email_autoreply`
--

CREATE TABLE `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email_cache_ts`
--

CREATE TABLE `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_address_cache`
--

CREATE TABLE `jjwg_address_cache` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `lat` float(10,8) DEFAULT NULL,
  `lng` float(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_address_cache_audit`
--

CREATE TABLE `jjwg_address_cache_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_areas`
--

CREATE TABLE `jjwg_areas` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `coordinates` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_areas_audit`
--

CREATE TABLE `jjwg_areas_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps`
--

CREATE TABLE `jjwg_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `distance` float(9,4) DEFAULT NULL,
  `unit_type` varchar(100) DEFAULT 'mi',
  `module_type` varchar(100) DEFAULT 'Accounts',
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps_audit`
--

CREATE TABLE `jjwg_maps_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps_jjwg_areas_c`
--

CREATE TABLE `jjwg_maps_jjwg_areas_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_5304wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_41f2g_areas_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps_jjwg_markers_c`
--

CREATE TABLE `jjwg_maps_jjwg_markers_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_b229wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_2e31markers_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_markers`
--

CREATE TABLE `jjwg_markers` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `jjwg_maps_lat` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_lng` float(11,8) DEFAULT '0.00000000',
  `marker_image` varchar(100) DEFAULT 'company'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_markers_audit`
--

CREATE TABLE `jjwg_markers_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_queue`
--

CREATE TABLE `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text,
  `target` varchar(255) DEFAULT NULL,
  `data` text,
  `requeue` tinyint(1) DEFAULT '0',
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `lawful_basis` text,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT '0',
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `salutation`, `first_name`, `last_name`, `title`, `photo`, `department`, `do_not_call`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `lawful_basis`, `date_reviewed`, `lawful_basis_source`, `primary_address_street`, `primary_address_city`, `primary_address_state`, `primary_address_postalcode`, `primary_address_country`, `alt_address_street`, `alt_address_city`, `alt_address_state`, `alt_address_postalcode`, `alt_address_country`, `assistant`, `assistant_phone`, `converted`, `refered_by`, `lead_source`, `lead_source_description`, `status`, `status_description`, `reports_to_id`, `account_name`, `account_description`, `contact_id`, `account_id`, `opportunity_id`, `opportunity_name`, `opportunity_amount`, `campaign_id`, `birthdate`, `portal_name`, `portal_app`, `website`) VALUES
('3b640e05-181b-6b95-4d10-6464cf0e6382', '2023-05-17 12:59:02', '2023-05-20 16:10:39', '1', '501ca596-4cc7-9be3-cd73-6464e9a61d59', NULL, 0, '501ca596-4cc7-9be3-cd73-6464e9a61d59', NULL, '', 'Nguyễn Duy Quang Vinh', NULL, NULL, NULL, 0, '0', '0968739042', '0', '0', NULL, '^^', '2023-05-02', NULL, NULL, 'Hà Nội', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'friends_relatives', NULL, 'New', NULL, '', 'Nguyễn Duy Quang Vinh', NULL, '8f22ce18-1324-5913-4d45-6464ea27963f', '7bb3db6f-ec1c-2ee1-a967-6464eafcb4ba', '', NULL, NULL, '', NULL, NULL, NULL, NULL),
('3cae6e4f-bc4d-81df-c343-6464cfdf40e5', '2023-05-17 12:59:02', '2023-05-21 04:48:32', '1', '1', NULL, 0, '1', NULL, '', '\"default Name For Fpoly_leadimports', NULL, NULL, NULL, 0, '0', '02597507604464647815', '0', '0', NULL, '^^', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, 'New', NULL, '', NULL, NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL),
('4979b343-0026-d607-b17e-6464cf849a51', '2023-05-17 12:59:02', '2023-05-20 16:41:19', '1', '1', NULL, 0, '1', NULL, '', '\"default Name For Fpoly_leadimports', NULL, NULL, NULL, 0, '0', '02700387416493126646403899', '0', '0', NULL, '^^', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'zalo', NULL, 'active_lead', NULL, '', '\"default Name For Fpoly_leadimports', NULL, '2b7e0b7b-329a-b160-2e0f-646746069aae', '2782b39b-1cf9-b918-cf5a-64674680abf0', '', NULL, NULL, '', NULL, NULL, NULL, NULL),
('56e2e7d1-41b0-447d-4a8f-6464cfcf6d40', '2023-05-17 12:59:02', '2023-05-18 07:37:26', '1', '1', NULL, 0, '1', NULL, '', '\"default Name For Fpoly_leadimports', NULL, NULL, NULL, 0, '0', '027693865461646468332', '0', '0', NULL, '^^', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, 'active_lead', NULL, '', NULL, NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL),
('64c84905-c8ae-3003-df1e-6464cf070ce9', '2023-05-17 12:59:02', '2023-05-18 18:17:00', '1', '1', NULL, 0, '1', NULL, '', 'Quang Vinh 2', NULL, NULL, NULL, 0, '0', '0286871629664648464', '0', '0', NULL, '^^', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'online_marketing', NULL, 'New', NULL, '', NULL, NULL, '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads_accounts_1_c`
--

CREATE TABLE `leads_accounts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `leads_accounts_1leads_ida` varchar(36) DEFAULT NULL,
  `leads_accounts_1accounts_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads_audit`
--

CREATE TABLE `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads_audit`
--

INSERT INTO `leads_audit` (`id`, `parent_id`, `date_created`, `created_by`, `field_name`, `data_type`, `before_value_string`, `after_value_string`, `before_value_text`, `after_value_text`) VALUES
('38862c40-9443-be51-0a2a-6464eaf86f87', '3b640e05-181b-6b95-4d10-6464cf0e6382', '2023-05-17 14:51:45', '1', 'assigned_user_id', 'relate', '1', '501ca596-4cc7-9be3-cd73-6464e9a61d59', NULL, NULL),
('4203b32e-7043-d24e-4057-6464ea4b9e1a', '3b640e05-181b-6b95-4d10-6464cf0e6382', '2023-05-17 14:55:27', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'last_name', 'varchar', 'Vinh', 'Nguyễn Duy Quang Vinh', NULL, NULL),
('5572031a-c1cd-9bdf-752c-6467b53a4892', '4979b343-0026-d607-b17e-6464cf849a51', '2023-05-19 17:46:04', '1', 'lead_source', 'enum', '', 'zalo', NULL, NULL),
('566d0805-db84-831e-ded7-6465bda638b4', '64c84905-c8ae-3003-df1e-6464cf070ce9', '2023-05-18 05:55:22', '1', 'lead_source', 'enum', '', 'online_marketing', NULL, NULL),
('65b2943d-bceb-01e0-2579-6465bdcb0c0c', '64c84905-c8ae-3003-df1e-6464cf070ce9', '2023-05-18 05:55:05', '1', 'last_name', 'varchar', '\"default Name For Fpoly_leadimports', 'Quang Vinh 2', NULL, NULL),
('9af8c31d-e97c-0e0f-defd-6465d58de983', '56e2e7d1-41b0-447d-4a8f-6464cfcf6d40', '2023-05-18 07:37:26', '1', 'status', 'enum', 'New', 'active_lead', NULL, NULL),
('c8bf07fa-697e-2c91-c247-6464d0015da8', '3b640e05-181b-6b95-4d10-6464cf0e6382', '2023-05-17 13:01:40', '1', 'last_name', 'varchar', '\"default Name For Fpoly_leadimports', 'Vinh', NULL, NULL),
('d1430471-2818-40da-4cfc-6464d01ff47b', '3b640e05-181b-6b95-4d10-6464cf0e6382', '2023-05-17 13:01:40', '1', 'phone_mobile', 'phone', '0247899809456464454', '0968739042', NULL, NULL),
('d9e10314-ed51-0787-3268-6464d0501dfc', '3b640e05-181b-6b95-4d10-6464cf0e6382', '2023-05-17 13:01:40', '1', 'lead_source', 'enum', '', 'friends_relatives', NULL, NULL),
('ed337c52-99c2-be94-eb11-6467b572de17', '4979b343-0026-d607-b17e-6464cf849a51', '2023-05-19 17:45:45', '1', 'status', 'enum', 'New', 'active_lead', NULL, NULL),
('f1720835-780c-dbf2-f27b-6464ea379ed4', '3b640e05-181b-6b95-4d10-6464cf0e6382', '2023-05-17 14:54:22', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'primary_address_city', 'varchar', NULL, 'Hà Nội', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads_cstm`
--

CREATE TABLE `leads_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  `marketing_c` varchar(255) NOT NULL,
  `content_c` varchar(255) NOT NULL,
  `area_c` int(11) NOT NULL,
  `source_c` int(11) NOT NULL,
  `contacted_c` int(11) NOT NULL,
  `ne_c` int(11) NOT NULL,
  `topic_c` int(11) NOT NULL,
  `dot_nhap_hoc_c` int(11) NOT NULL,
  `school_c` int(11) NOT NULL,
  `call_log_c` int(11) NOT NULL,
  `number_of_calls_c` int(11) NOT NULL,
  `assessor_c` int(11) NOT NULL,
  `dup_c` int(11) NOT NULL,
  `schedule_date_c` date DEFAULT NULL,
  `rating_c` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads_cstm`
--

INSERT INTO `leads_cstm` (`id_c`, `jjwg_maps_lng_c`, `jjwg_maps_lat_c`, `jjwg_maps_geocode_status_c`, `jjwg_maps_address_c`, `marketing_c`, `content_c`, `area_c`, `source_c`, `contacted_c`, `ne_c`, `topic_c`, `dot_nhap_hoc_c`, `school_c`, `call_log_c`, `number_of_calls_c`, `assessor_c`, `dup_c`, `schedule_date_c`, `rating_c`) VALUES
('3b640e05-181b-6b95-4d10-6464cf0e6382', 0.00000000, 0.00000000, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-20', 'hot_lead'),
('3cae6e4f-bc4d-81df-c343-6464cfdf40e5', 0.00000000, 0.00000000, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-21', ''),
('4979b343-0026-d607-b17e-6464cf849a51', 0.00000000, 0.00000000, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-20', ''),
('56e2e7d1-41b0-447d-4a8f-6464cfcf6d40', 0.00000000, 0.00000000, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
('64c84905-c8ae-3003-df1e-6464cf070ce9', 0.00000000, 0.00000000, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads_opportunities_1_c`
--

CREATE TABLE `leads_opportunities_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `leads_opportunities_1leads_ida` varchar(36) DEFAULT NULL,
  `leads_opportunities_1opportunities_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `linked_documents`
--

CREATE TABLE `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  `gsync_id` varchar(1024) DEFAULT NULL,
  `gsync_lastsync` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_contacts`
--

CREATE TABLE `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_cstm`
--

CREATE TABLE `meetings_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_leads`
--

CREATE TABLE `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_users`
--

CREATE TABLE `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT '0',
  `description` text,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`assigned_user_id`, `id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `file_mime_type`, `filename`, `parent_type`, `parent_id`, `contact_id`, `portal_flag`, `embed_flag`, `description`, `deleted`) VALUES
('1', '8e3063c3-2fb4-3054-98fe-6465d7ccaa52', '2023-05-18 07:44:16', '2023-05-18 07:44:16', '1', '1', 'Tét', NULL, '', 'Leads', '3b640e05-181b-6b95-4d10-6464cf0e6382', '', 0, 0, 'abc xyz', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oauth2clients`
--

CREATE TABLE `oauth2clients` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `secret` varchar(4000) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `is_confidential` tinyint(1) DEFAULT '1',
  `allowed_grant_type` varchar(255) DEFAULT 'password',
  `duration_value` int(11) DEFAULT NULL,
  `duration_amount` int(11) DEFAULT NULL,
  `duration_unit` varchar(255) DEFAULT 'Duration Unit',
  `assigned_user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth2tokens`
--

CREATE TABLE `oauth2tokens` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `token_is_revoked` tinyint(1) DEFAULT NULL,
  `token_type` varchar(255) DEFAULT NULL,
  `access_token_expires` datetime DEFAULT NULL,
  `access_token` varchar(4000) DEFAULT NULL,
  `refresh_token` varchar(4000) DEFAULT NULL,
  `refresh_token_expires` datetime DEFAULT NULL,
  `grant_type` varchar(255) DEFAULT NULL,
  `state` varchar(1024) DEFAULT NULL,
  `client` char(36) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumer`
--

CREATE TABLE `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_nonce`
--

CREATE TABLE `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_tokens`
--

CREATE TABLE `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities`
--

CREATE TABLE `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_audit`
--

CREATE TABLE `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_contacts`
--

CREATE TABLE `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_cstm`
--

CREATE TABLE `opportunities_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_leads_1_c`
--

CREATE TABLE `opportunities_leads_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `opportunities_leads_1opportunities_ida` varchar(36) DEFAULT NULL,
  `opportunities_leads_1leads_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `outbound_email`
--

CREATE TABLE `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `smtp_from_name` varchar(255) DEFAULT NULL,
  `smtp_from_addr` varchar(255) DEFAULT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` varchar(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` varchar(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outbound_email`
--

INSERT INTO `outbound_email` (`id`, `name`, `type`, `user_id`, `smtp_from_name`, `smtp_from_addr`, `mail_sendtype`, `mail_smtptype`, `mail_smtpserver`, `mail_smtpport`, `mail_smtpuser`, `mail_smtppass`, `mail_smtpauth_req`, `mail_smtpssl`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `deleted`, `assigned_user_id`) VALUES
('6ad01204-13c6-648b-8c74-6464cd337d5d', 'system', 'system', '1', NULL, NULL, 'SMTP', 'other', '', '25', '', '', 1, '0', NULL, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `outbound_email_audit`
--

CREATE TABLE `outbound_email_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `override_business_hours` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_accounts`
--

CREATE TABLE `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_bugs`
--

CREATE TABLE `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_cases`
--

CREATE TABLE `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_contacts`
--

CREATE TABLE `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_opportunities`
--

CREATE TABLE `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_products`
--

CREATE TABLE `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_contacts_1_c`
--

CREATE TABLE `project_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_contacts_1project_ida` varchar(36) DEFAULT NULL,
  `project_contacts_1contacts_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_cstm`
--

CREATE TABLE `project_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_task`
--

CREATE TABLE `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `relationship_type` varchar(255) DEFAULT NULL,
  `description` text,
  `predecessors` text,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT '1',
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `utilization` int(11) DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_task_audit`
--

CREATE TABLE `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_users_1_c`
--

CREATE TABLE `project_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_users_1project_ida` varchar(36) DEFAULT NULL,
  `project_users_1users_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospects`
--

CREATE TABLE `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `lawful_basis` text,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospects_cstm`
--

CREATE TABLE `prospects_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_lists`
--

CREATE TABLE `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text,
  `domain_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_lists_prospects`
--

CREATE TABLE `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_list_campaigns`
--

CREATE TABLE `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relationships`
--

CREATE TABLE `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(64) DEFAULT NULL,
  `join_key_lhs` varchar(64) DEFAULT NULL,
  `join_key_rhs` varchar(64) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relationships`
--

INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('1012904b-2f59-5f7e-e30d-6468bb89b608', 'campaign_opportunities', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('105cc309-2b92-f928-e618-6468bb4c749f', 'campaign_email_marketing', 'Campaigns', 'campaigns', 'id', 'EmailMarketing', 'email_marketing', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('10aa3d8b-d17b-d7c1-7aee-6468bb56f9eb', 'campaign_emailman', 'Campaigns', 'campaigns', 'id', 'EmailMan', 'emailman', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('11811843-2363-ee26-01bc-6468bb229c58', 'campaign_campaignlog', 'Campaigns', 'campaigns', 'id', 'CampaignLog', 'campaign_log', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('119eb5e3-8126-9f4e-94cb-6468bb444a6c', 'templatesectionline_modified_user', 'Users', 'users', 'id', 'TemplateSectionLine', 'templatesectionline', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('11e98e0b-b106-21f3-da94-6468bbb74902', 'templatesectionline_created_by', 'Users', 'users', 'id', 'TemplateSectionLine', 'templatesectionline', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('11f1fc14-66db-d864-cd0c-6468bbc67c00', 'campaign_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1255c214-614d-6b81-da4e-6468bb134a6b', 'campaign_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('129a8ee1-1082-3f5f-8516-6468bbc87705', 'surveyresponses_campaigns', 'Campaigns', 'campaigns', 'id', 'SurveyResponses', 'surveyresponses', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('14a7bf6a-fc43-2546-7f14-6468bb261b4b', 'prospectlists_assigned_user', 'Users', 'users', 'id', 'prospectlists', 'prospect_lists', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1513b221-3763-51af-7b5b-6468bb3f41e9', 'securitygroups_prospectlists', 'SecurityGroups', 'securitygroups', 'id', 'ProspectLists', 'prospect_lists', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProspectLists', 0, 0),
('15237a6f-c9c2-5355-8c82-6468bbbadcaf', 'aok_knowledgebase_modified_user', 'Users', 'users', 'id', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('157ac593-0ad9-e478-6470-6468bb561d40', 'aok_knowledgebase_created_by', 'Users', 'users', 'id', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('15c26d3c-2d18-baf1-8a6f-6468bbe24c02', 'aok_knowledgebase_assigned_user', 'Users', 'users', 'id', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('161a23cd-f811-5f4a-e731-6468bb5fe197', 'securitygroups_aok_knowledgebase', 'SecurityGroups', 'securitygroups', 'id', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOK_KnowledgeBase', 0, 0),
('184fb3c6-493b-f75d-b3e9-6468bb708ad8', 'oauth2tokens_modified_user', 'Users', 'users', 'id', 'OAuth2Tokens', 'oauth2tokens', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('18df048d-d05b-b895-aac0-6468bb8cbb1b', 'oauth2tokens_created_by', 'Users', 'users', 'id', 'OAuth2Tokens', 'oauth2tokens', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('192a7b71-e213-6b17-7685-6468bb7a1c1c', 'oauth2tokens_assigned_user', 'Users', 'users', 'id', 'OAuth2Tokens', 'oauth2tokens', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1d04fa48-662e-b98f-6aef-6468bb2d5555', 'prospects_modified_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1d44d38c-2d31-3087-d9eb-6468bb42493f', 'reminders_modified_user', 'Users', 'users', 'id', 'Reminders', 'reminders', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1d7a727f-3532-5ac0-6cd2-6468bb1439a6', 'prospects_created_by', 'Users', 'users', 'id', 'Prospects', 'prospects', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1d97651e-0907-1764-ffa8-6468bbf1101b', 'reminders_created_by', 'Users', 'users', 'id', 'Reminders', 'reminders', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1dd1a080-b01f-fd52-4e65-6468bbc8efae', 'prospects_assigned_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1ddc6789-e631-70c2-6342-6468bbd4c0e2', 'reminders_assigned_user', 'Users', 'users', 'id', 'Reminders', 'reminders', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1e327dc8-3b43-6ae8-3ec5-6468bb3e02e7', 'securitygroups_prospects', 'SecurityGroups', 'securitygroups', 'id', 'Prospects', 'prospects', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Prospects', 0, 0),
('1e86b312-68c4-ef6f-e6a8-6468bb30b9e8', 'prospects_email_addresses', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('1ecbc60b-54b3-172c-a7f2-6468bbeb83c5', 'prospects_email_addresses_primary', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('1f29eb72-e80b-29f8-4af6-6468bb8cf41c', 'prospect_tasks', 'Prospects', 'prospects', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('1f6d0a05-c74e-cfb2-6f38-6468bbf1f27b', 'securitygroups_projecttask', 'SecurityGroups', 'securitygroups', 'id', 'ProjectTask', 'project_task', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProjectTask', 0, 0),
('1f781468-0e4e-5092-0d99-6468bb83535a', 'prospect_notes', 'Prospects', 'prospects', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('1f8c2f75-38e5-49c6-221f-6468bb0b26e3', 'oauth2clients_modified_user', 'Users', 'users', 'id', 'OAuth2Clients', 'oauth2clients', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1fc233ae-c2c7-92ff-098b-6468bb30d8f2', 'prospect_meetings', 'Prospects', 'prospects', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('1ff221ee-5ea6-2713-d415-6468bb4f6c3c', 'oauth2clients_created_by', 'Users', 'users', 'id', 'OAuth2Clients', 'oauth2clients', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2002a814-f2a1-57ec-98a9-6468bb9bb033', 'prospect_calls', 'Prospects', 'prospects', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('2035cf8b-1ab1-7836-56ac-6468bb69d96d', 'oauth2clients_oauth2tokens', 'OAuth2Clients', 'oauth2clients', 'id', 'OAuth2Tokens', 'oauth2tokens', 'client', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('20444e4b-7791-711d-745e-6468bb37c354', 'prospect_emails', 'Prospects', 'prospects', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('207aaead-b35e-49e1-7d84-6468bbf420f7', 'oauth2clients_assigned_user', 'Users', 'users', 'id', 'OAuth2Clients', 'oauth2clients', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('208e3ae2-a661-6bd0-c526-6468bbd54004', 'prospect_campaign_log', 'Prospects', 'prospects', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Prospects', 0, 0),
('240a55d7-121d-932f-5c65-6468bb4edb03', 'securitygroups_emailmarketing', 'SecurityGroups', 'securitygroups', 'id', 'EmailMarketing', 'email_marketing', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'EmailMarketing', 0, 0),
('2452dfc1-3d73-6b88-d417-6468bb825eaf', 'reminders_invitees_modified_user', 'Users', 'users', 'id', 'Reminders_Invitees', 'reminders_invitees', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('246b628f-ec2a-d9f6-0d88-6468bb9d8e09', 'email_template_email_marketings', 'EmailTemplates', 'email_templates', 'id', 'EmailMarketing', 'email_marketing', 'template_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('24cf7891-15b3-5c87-3d7d-6468bb1b5ed3', 'reminders_invitees_created_by', 'Users', 'users', 'id', 'Reminders_Invitees', 'reminders_invitees', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('25215ee6-161d-37a8-f19a-6468bba4d321', 'reminders_invitees_assigned_user', 'Users', 'users', 'id', 'Reminders_Invitees', 'reminders_invitees', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('26170060-26e6-a0ba-c45b-6468bb0955e7', 'campaign_campaigntrakers', 'Campaigns', 'campaigns', 'id', 'CampaignTrackers', 'campaign_trkrs', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('270f02f2-e032-de85-c4f3-6468bbdad8e2', 'project_tasks_notes', 'ProjectTask', 'project_task', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('278c84fb-0d0c-8209-306f-6468bbdda061', 'surveyresponses_modified_user', 'Users', 'users', 'id', 'SurveyResponses', 'surveyresponses', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('27e6eb66-57cc-a4b9-df89-6468bb28a9e2', 'surveyresponses_created_by', 'Users', 'users', 'id', 'SurveyResponses', 'surveyresponses', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2835d5b3-b252-7d59-f70b-6468bb63691a', 'surveyresponses_assigned_user', 'Users', 'users', 'id', 'SurveyResponses', 'surveyresponses', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('287f0e03-8ca3-f423-1bc0-6468bbe8378c', 'securitygroups_surveyresponses', 'SecurityGroups', 'securitygroups', 'id', 'SurveyResponses', 'surveyresponses', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'SurveyResponses', 0, 0),
('28c5b919-e34a-20a9-1c4a-6468bb252dec', 'surveyresponses_surveyquestionresponses', 'SurveyResponses', 'surveyresponses', 'id', 'SurveyQuestionResponses', 'surveyquestionresponses', 'surveyresponse_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2bf56f3c-6c2c-4d77-24d1-6468bb9228c0', 'fp_events_modified_user', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2c45c9c2-dc20-0101-719e-6468bbc53419', 'fp_events_created_by', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2c687086-2372-519e-ca01-6468bbb9d8c7', 'schedulers_created_by_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('2c961884-72af-d620-6b6b-6468bb93d792', 'fp_events_assigned_user', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2cb9e3f1-1179-6165-e41a-6468bb7db2eb', 'schedulers_modified_user_id_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2ce6c958-4a88-e03a-c161-6468bbe7ad64', 'securitygroups_fp_events', 'SecurityGroups', 'securitygroups', 'id', 'FP_events', 'fp_events', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'FP_events', 0, 0),
('2d0b8197-dac3-79f6-9181-6468bb3480dc', 'schedulers_jobs_rel', 'Schedulers', 'schedulers', 'id', 'SchedulersJobs', 'job_queue', 'scheduler_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2d140ffa-5bb1-ddc5-15b9-6468bb26df20', 'project_tasks_tasks', 'ProjectTask', 'project_task', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('2da2016a-eac7-320a-e4b4-6468bb727a6a', 'schedulersjobs_assigned_user', 'Users', 'users', 'id', 'SchedulersJobs', 'job_queue', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('300e2c9d-d2d1-6234-f76d-6468bb042f26', 'surveys_modified_user', 'Users', 'users', 'id', 'Surveys', 'surveys', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('309e783d-7e39-cc2b-cf60-6468bb32a4f1', 'surveys_created_by', 'Users', 'users', 'id', 'Surveys', 'surveys', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3148a4ba-5bb6-40a6-cc84-6468bb0ef884', 'surveys_assigned_user', 'Users', 'users', 'id', 'Surveys', 'surveys', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('31be2513-02cd-c875-6358-6468bb689b78', 'securitygroups_surveys', 'SecurityGroups', 'securitygroups', 'id', 'Surveys', 'surveys', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Surveys', 0, 0),
('32257f91-9bd6-c656-1427-6468bbbdb3da', 'surveys_surveyquestions', 'Surveys', 'surveys', 'id', 'SurveyQuestions', 'surveyquestions', 'survey_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('327a4520-bd1e-a6fb-dc88-6468bbe03c37', 'surveys_surveyresponses', 'Surveys', 'surveys', 'id', 'SurveyResponses', 'surveyresponses', 'survey_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('32a50371-aaac-9223-d351-6468bb7eef03', 'project_tasks_meetings', 'ProjectTask', 'project_task', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('32cccfaa-5832-5997-ae0e-6468bb9a03f7', 'surveys_campaigns', 'Surveys', 'surveys', 'id', 'Campaigns', 'campaigns', 'survey_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('33e5a0d6-a03c-c7bc-d83f-6468bb626132', 'fp_event_locations_modified_user', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('347b65b3-2f11-c751-2c05-6468bbd6744d', 'fp_event_locations_created_by', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('34d7801b-16ea-fb29-ba2d-6468bbb95d64', 'fp_event_locations_assigned_user', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('351f91c9-b844-5d3b-f7a0-6468bb6cfd7b', 'securitygroups_fp_event_locations', 'SecurityGroups', 'securitygroups', 'id', 'FP_Event_Locations', 'fp_event_locations', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'FP_Event_Locations', 0, 0),
('357378fc-15fc-3da1-0d31-6468bbbb6bee', 'optimistic_locking', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
('35bbaccc-e468-a763-4012-6468bb76b001', 'unified_search', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
('36f19f73-8cf4-8560-3c6f-6468bb119c4f', 'contacts_modified_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('375dbca6-bc31-f34b-3ab9-6468bbc251cc', 'contacts_created_by', 'Users', 'users', 'id', 'Contacts', 'contacts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('37ac17c2-d545-6c59-244a-6468bb5e98c0', 'contacts_assigned_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('37efcf06-ee39-313d-b875-6468bb1abf77', 'securitygroups_contacts', 'SecurityGroups', 'securitygroups', 'id', 'Contacts', 'contacts', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Contacts', 0, 0),
('38386938-6783-ee83-bdba-6468bbe70bb7', 'contacts_email_addresses', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('38829ca5-5c57-6552-5b65-6468bbea7aaf', 'contacts_email_addresses_primary', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('38970deb-fbac-6318-4899-6468bbd47644', 'project_tasks_calls', 'ProjectTask', 'project_task', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('38c88d3b-86bd-3e13-818d-6468bbb9da0b', 'contact_direct_reports', 'Contacts', 'contacts', 'id', 'Contacts', 'contacts', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('392a014e-f8f3-b28c-714c-6468bb06401f', 'contact_leads', 'Contacts', 'contacts', 'id', 'Leads', 'leads', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('39841553-951c-e67d-474e-6468bbc6ad2e', 'contact_notes', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('39e5f5d4-2f21-2f94-600f-6468bb69d8f6', 'contact_tasks', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('39fdf79d-bf75-5e69-5d0d-6468bb83ecbb', 'surveyquestionresponses_modified_user', 'Users', 'users', 'id', 'SurveyQuestionResponses', 'surveyquestionresponses', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3a602d1f-3650-9909-3e1a-6468bb4c8472', 'contact_tasks_parent', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('3ab67992-2e7a-181b-4d9b-6468bb713e4c', 'surveyquestionresponses_created_by', 'Users', 'users', 'id', 'SurveyQuestionResponses', 'surveyquestionresponses', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3ad8bb07-5eb4-7668-6e20-6468bb202179', 'contact_notes_parent', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('3b29dc87-1c75-c976-fb90-6468bbbb6802', 'surveyquestionresponses_assigned_user', 'Users', 'users', 'id', 'SurveyQuestionResponses', 'surveyquestionresponses', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3b373f3f-ca20-376d-ca7a-6468bb7aa266', 'contact_campaign_log', 'Contacts', 'contacts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Contacts', 0, 0),
('3b99b04c-b31e-8912-a3ea-6468bb45b7a9', 'securitygroups_surveyquestionresponses', 'SecurityGroups', 'securitygroups', 'id', 'SurveyQuestionResponses', 'surveyquestionresponses', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'SurveyQuestionResponses', 0, 0),
('3ba2366f-40d5-ade4-449b-6468bbf12a79', 'contact_aos_quotes', 'Contacts', 'contacts', 'id', 'AOS_Quotes', 'aos_quotes', 'billing_contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3bf0619f-ec91-790d-54ab-6468bb746ce7', 'contact_aos_invoices', 'Contacts', 'contacts', 'id', 'AOS_Invoices', 'aos_invoices', 'billing_contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3c248eb8-d996-2749-fd50-6468bb2d20fc', 'aod_indexevent_modified_user', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3c34dbdb-5bf9-6e1c-1307-6468bb8b54a4', 'contact_aos_contracts', 'Contacts', 'contacts', 'id', 'AOS_Contracts', 'aos_contracts', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3c8ad330-8e53-8fb5-6459-6468bb30ae41', 'aod_indexevent_created_by', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3c8d1930-9949-6355-0bbd-6468bbd4c90a', 'contacts_aop_case_updates', 'Contacts', 'contacts', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3d1f119f-4f11-833c-e61d-6468bb9be867', 'aod_indexevent_assigned_user', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3d8b0911-e25f-492a-bf7e-6468bb5bacf1', 'project_tasks_emails', 'ProjectTask', 'project_task', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('3dc10a4c-3c74-6459-8b1f-6468bbfb2498', 'aod_index_modified_user', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3e2798b5-f407-b3e9-15fc-6468bbbe258b', 'aod_index_created_by', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3e7f5c18-3f45-d9cb-5e36-6468bb5720fc', 'aod_index_assigned_user', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4096f547-4906-d36f-c6e5-6468bb5d7bd7', 'aop_case_events_modified_user', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4101d5a8-3c8a-182f-8347-6468bb4380fc', 'aop_case_events_created_by', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('414e87f5-f9d4-4249-9654-6468bb0ad914', 'aop_case_events_assigned_user', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('41a7b087-23ce-0ab6-7ade-6468bb857092', 'cases_aop_case_events', 'Cases', 'cases', 'id', 'AOP_Case_Events', 'aop_case_events', 'case_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('423a0be0-b2d2-5471-af2f-6468bb5f7a1f', 'project_tasks_assigned_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('427b6090-e0dd-185e-2c40-6468bbdaba69', 'surveyquestions_modified_user', 'Users', 'users', 'id', 'SurveyQuestions', 'surveyquestions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('42ea99ea-e2a0-592d-9cb4-6468bb867f05', 'surveyquestions_created_by', 'Users', 'users', 'id', 'SurveyQuestions', 'surveyquestions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('433982bb-3dae-0b80-06cb-6468bb471c37', 'surveyquestions_assigned_user', 'Users', 'users', 'id', 'SurveyQuestions', 'surveyquestions', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('438f06aa-98af-ca34-1477-6468bb5ab9dc', 'securitygroups_surveyquestions', 'SecurityGroups', 'securitygroups', 'id', 'SurveyQuestions', 'surveyquestions', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'SurveyQuestions', 0, 0),
('43da2b25-716b-e8a5-e20b-6468bba71631', 'surveyquestions_surveyquestionoptions', 'SurveyQuestions', 'surveyquestions', 'id', 'SurveyQuestionOptions', 'surveyquestionoptions', 'survey_question_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('46200cf0-85bc-9378-edd0-6468bbd7375a', 'calls_reschedule_created_by', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('468744e1-8d31-7d88-969b-6468bb695353', 'accounts_modified_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('46c60263-d1b1-8e68-76ad-6468bb2876a8', 'project_tasks_modified_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('46f8ae8a-80fb-1549-6a88-6468bb1b7cf2', 'accounts_created_by', 'Users', 'users', 'id', 'Accounts', 'accounts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('474bdb8f-3828-29f3-66a3-6468bb6ec08b', 'accounts_assigned_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4795c7d7-93c6-8b6a-b70c-6468bb35983d', 'securitygroups_accounts', 'SecurityGroups', 'securitygroups', 'id', 'Accounts', 'accounts', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Accounts', 0, 0),
('47dfe68b-e42d-adb0-eb0d-6468bb7ec5ae', 'accounts_email_addresses', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('4827698f-5340-6684-8f8c-6468bb382b01', 'accounts_email_addresses_primary', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('488928d1-73d2-7b3d-60dd-6468bb7ae410', 'member_accounts', 'Accounts', 'accounts', 'id', 'Accounts', 'accounts', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('48e9b327-40b4-bef6-1938-6468bb448a23', 'account_cases', 'Accounts', 'accounts', 'id', 'Cases', 'cases', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4945e732-ceb6-50a6-225e-6468bb55af3c', 'account_tasks', 'Accounts', 'accounts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('4966eea5-8448-494d-8c19-6468bb33b9f0', 'aop_case_updates_modified_user', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('498b0f58-78d8-18bc-8618-6468bb6686d4', 'account_notes', 'Accounts', 'accounts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('49ca02d3-8015-8769-e026-6468bb34bc04', 'aop_case_updates_created_by', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('49d29b35-f79b-eb25-006f-6468bb40ff41', 'account_meetings', 'Accounts', 'accounts', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('4a16f2f8-ae76-b584-c558-6468bbac1b51', 'account_calls', 'Accounts', 'accounts', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('4a34639e-94a3-1d92-cef7-6468bbab6d43', 'aop_case_updates_assigned_user', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4a7f796b-11b2-7775-fe2e-6468bb70b4e5', 'account_emails', 'Accounts', 'accounts', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('4aa8d592-daa5-4191-8a63-6468bb5f40d6', 'cases_aop_case_updates', 'Cases', 'cases', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'case_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4ad3a5d0-8321-550d-62f9-6468bb784492', 'account_leads', 'Accounts', 'accounts', 'id', 'Leads', 'leads', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4ae85f4b-fd91-69e2-dade-6468bb7855ef', 'surveyquestionoptions_modified_user', 'Users', 'users', 'id', 'SurveyQuestionOptions', 'surveyquestionoptions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4afd2e09-e2c8-5fd1-2688-6468bb3beb94', 'aop_case_updates_notes', 'AOP_Case_Updates', 'aop_case_updates', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOP_Case_Updates', 0, 0),
('4b1772c5-04dc-dfef-7c9a-6468bb772ad3', 'account_campaign_log', 'Accounts', 'accounts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Accounts', 0, 0),
('4b33dbc8-ffe9-8ae7-ba5b-6468bb99e425', 'surveyquestionoptions_created_by', 'Users', 'users', 'id', 'SurveyQuestionOptions', 'surveyquestionoptions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4b721beb-d7e9-9ffd-14a8-6468bb34e8bd', 'account_aos_quotes', 'Accounts', 'accounts', 'id', 'AOS_Quotes', 'aos_quotes', 'billing_account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4b76596c-070b-3d7a-ce60-6468bb88915e', 'surveyquestionoptions_assigned_user', 'Users', 'users', 'id', 'SurveyQuestionOptions', 'surveyquestionoptions', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4bb64f53-c9b5-2dd4-1f7b-6468bbef832c', 'account_aos_invoices', 'Accounts', 'accounts', 'id', 'AOS_Invoices', 'aos_invoices', 'billing_account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4bbe55f5-8099-c748-da0c-6468bb0148f0', 'securitygroups_surveyquestionoptions', 'SecurityGroups', 'securitygroups', 'id', 'SurveyQuestionOptions', 'surveyquestionoptions', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'SurveyQuestionOptions', 0, 0),
('4c07a36c-d4b8-d930-8c5f-6468bb40b523', 'account_aos_contracts', 'Accounts', 'accounts', 'id', 'AOS_Contracts', 'aos_contracts', 'contract_account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4d78013a-4616-72ac-204b-6468bb8e13c2', 'project_tasks_created_by', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4daed3c6-d21c-d7b3-69de-6468bb2d20c0', 'analyticreporting_modified_user', 'Users', 'users', 'id', 'AnalyticReporting', 'analyticreporting', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4e142d3a-bfc7-ad0b-98de-6468bb969178', 'analyticreporting_created_by', 'Users', 'users', 'id', 'AnalyticReporting', 'analyticreporting', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4e66f26d-b71d-1c1d-4fad-6468bbb73856', 'analyticreporting_assigned_user', 'Users', 'users', 'id', 'AnalyticReporting', 'analyticreporting', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('52fd7433-facb-688b-da3c-6468bb842f9e', 'aor_reports_modified_user', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5359576e-32d4-64db-77e5-6468bbdc718a', 'aor_reports_created_by', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('53a53fb8-d10c-103a-7a59-6468bbc49058', 'aor_reports_assigned_user', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('53fa9732-c46f-452d-d22e-6468bbee0a08', 'securitygroups_aor_reports', 'SecurityGroups', 'securitygroups', 'id', 'AOR_Reports', 'aor_reports', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOR_Reports', 0, 0),
('544415a4-06f4-8b77-d4cb-6468bb910d93', 'aor_reports_aor_fields', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Fields', 'aor_fields', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('54945ad6-f84c-6790-9efe-6468bb4f0646', 'aor_reports_aor_conditions', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Conditions', 'aor_conditions', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('54e6dac4-2329-d638-e39e-6468bb19039c', 'aor_scheduled_reports_aor_reports', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('55a620c3-8a78-56de-aa2e-6468bb19593a', 'asteriskintegration_modified_user', 'Users', 'users', 'id', 'AsteriskIntegration', 'asteriskintegration', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('55fde243-846c-948d-abea-6468bb76c620', 'asteriskintegration_created_by', 'Users', 'users', 'id', 'AsteriskIntegration', 'asteriskintegration', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('56580669-4300-5110-f9c2-6468bbbde480', 'asteriskintegration_assigned_user', 'Users', 'users', 'id', 'AsteriskIntegration', 'asteriskintegration', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('56aed2bb-ae36-ddda-491e-6468bb1439d7', 'securitygroups_asteriskintegration', 'SecurityGroups', 'securitygroups', 'id', 'AsteriskIntegration', 'asteriskintegration', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AsteriskIntegration', 0, 0),
('5907d560-3d4f-56eb-6c50-6468bba0cd15', 'fpoly_schools_modified_user', 'Users', 'users', 'id', 'fpoly_Schools', 'fpoly_schools', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('594edf22-cf60-b95c-a87f-6468bbde4c44', 'fpoly_schools_created_by', 'Users', 'users', 'id', 'fpoly_Schools', 'fpoly_schools', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('59921867-ae29-2d16-7192-6468bb03251d', 'fpoly_schools_assigned_user', 'Users', 'users', 'id', 'fpoly_Schools', 'fpoly_schools', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('59e15684-2d06-bb7f-c108-6468bbeb7a1e', 'securitygroups_fpoly_schools', 'SecurityGroups', 'securitygroups', 'id', 'fpoly_Schools', 'fpoly_schools', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'fpoly_Schools', 0, 0),
('5bd88cef-887b-ccb7-c37c-6468bb8d1384', 'aor_fields_modified_user', 'Users', 'users', 'id', 'AOR_Fields', 'aor_fields', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5c283944-d131-300d-1826-6468bb538280', 'aor_fields_created_by', 'Users', 'users', 'id', 'AOR_Fields', 'aor_fields', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5e3df632-1883-31ed-cca1-6468bb21c4ad', 'opportunities_modified_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5e4b8d4d-ee90-0304-af49-6468bb4c61c2', 'aor_charts_modified_user', 'Users', 'users', 'id', 'AOR_Charts', 'aor_charts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5ea0183f-451e-3f2f-d676-6468bbc002c9', 'aor_charts_created_by', 'Users', 'users', 'id', 'AOR_Charts', 'aor_charts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5ed26b19-fcc8-ef86-c3f6-6468bb2036c0', 'opportunities_created_by', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5ef3cc5b-ebe4-bd6c-b038-6468bb70c66c', 'aor_charts_aor_reports', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Charts', 'aor_charts', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5f987cc0-c081-3772-3f7d-6468bbac295b', 'opportunities_assigned_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('60729f80-39f1-457a-58e6-6468bb675ceb', 'securitygroups_opportunities', 'SecurityGroups', 'securitygroups', 'id', 'Opportunities', 'opportunities', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Opportunities', 0, 0),
('611d78f5-ca72-fbf3-4e23-6468bbdf8757', 'fpoly_leadimports_modified_user', 'Users', 'users', 'id', 'fpoly_LeadImports', 'fpoly_leadimports', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('61437e4a-fcb4-7703-828f-6468bb9cff56', 'opportunity_calls', 'Opportunities', 'opportunities', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('61968385-64a9-b78b-1d9d-6468bb4fd053', 'fpoly_leadimports_created_by', 'Users', 'users', 'id', 'fpoly_LeadImports', 'fpoly_leadimports', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('61e3c7c3-a402-a973-55f0-6468bb82a7e8', 'fpoly_leadimports_assigned_user', 'Users', 'users', 'id', 'fpoly_LeadImports', 'fpoly_leadimports', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('621855c4-e75d-c04f-fcdb-6468bb78f18d', 'opportunity_meetings', 'Opportunities', 'opportunities', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('62318ffa-3893-2711-6ca5-6468bba62643', 'securitygroups_fpoly_leadimports', 'SecurityGroups', 'securitygroups', 'id', 'fpoly_LeadImports', 'fpoly_leadimports', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'fpoly_LeadImports', 0, 0),
('636e74d5-b779-31b7-521e-6468bb53d230', 'opportunity_tasks', 'Opportunities', 'opportunities', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('642aa1d4-c694-080f-0b80-6468bba94614', 'opportunity_notes', 'Opportunities', 'opportunities', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('65007d52-4fbe-63de-a049-6468bbe10c67', 'opportunity_emails', 'Opportunities', 'opportunities', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('65db7179-b093-560c-7aa0-6468bb64cd44', 'opportunity_leads', 'Opportunities', 'opportunities', 'id', 'Leads', 'leads', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('661a4da6-37db-e629-4016-6468bba7ba8c', 'accounts_bugs', 'Accounts', 'accounts', 'id', 'Bugs', 'bugs', 'id', 'accounts_bugs', 'account_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('664db52d-b857-5f64-e036-6468bb71161c', 'aor_conditions_modified_user', 'Users', 'users', 'id', 'AOR_Conditions', 'aor_conditions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6688cb0e-5d72-ab21-ada5-6468bbb6b150', 'accounts_contacts', 'Accounts', 'accounts', 'id', 'Contacts', 'contacts', 'id', 'accounts_contacts', 'account_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('66a7a5c0-d3eb-e58d-7c4b-6468bb2a9bf1', 'aor_conditions_created_by', 'Users', 'users', 'id', 'AOR_Conditions', 'aor_conditions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('66dbba2b-e6e0-bb17-1228-6468bb5be60c', 'opportunity_currencies', 'Opportunities', 'opportunities', 'currency_id', 'Currencies', 'currencies', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('66dd2c2a-4ce2-707d-542e-6468bb56a0c5', 'accounts_opportunities', 'Accounts', 'accounts', 'id', 'Opportunities', 'opportunities', 'id', 'accounts_opportunities', 'account_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('6739409b-f545-6f1a-0325-6468bb9b7594', 'calls_contacts', 'Calls', 'calls', 'id', 'Contacts', 'contacts', 'id', 'calls_contacts', 'call_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('67931f88-c183-1616-90a4-6468bb789183', 'calls_users', 'Calls', 'calls', 'id', 'Users', 'users', 'id', 'calls_users', 'call_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('67f33be2-0953-2b62-fe63-6468bb110eef', 'opportunities_campaign', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('67f4085c-7160-4510-d79c-6468bbcde176', 'calls_leads', 'Calls', 'calls', 'id', 'Leads', 'leads', 'id', 'calls_leads', 'call_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('683f7fcd-af76-80ae-5d5f-6468bb1b053a', 'cases_bugs', 'Cases', 'cases', 'id', 'Bugs', 'bugs', 'id', 'cases_bugs', 'case_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('6884c684-0b99-ca0d-cb3c-6468bbb4b45b', 'contacts_bugs', 'Contacts', 'contacts', 'id', 'Bugs', 'bugs', 'id', 'contacts_bugs', 'contact_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('68bf7808-2f38-9618-7a2b-6468bbaf7b34', 'opportunity_aos_quotes', 'Opportunities', 'opportunities', 'id', 'AOS_Quotes', 'aos_quotes', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('68c789c6-9ecc-d82c-4169-6468bb81d3ed', 'contacts_cases', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'id', 'contacts_cases', 'contact_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('690a5fc7-624a-72cd-3c62-6468bb5c0c00', 'contacts_users', 'Contacts', 'contacts', 'id', 'Users', 'users', 'id', 'contacts_users', 'contact_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('6947f097-d423-79d9-9620-6468bb0f958e', 'opportunity_aos_contracts', 'Opportunities', 'opportunities', 'id', 'AOS_Contracts', 'aos_contracts', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('69810dba-0b16-4d29-fa93-6468bb10cb66', 'emails_bugs_rel', 'Emails', 'emails', 'id', 'Bugs', 'bugs', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Bugs', 0, 0),
('6a00f704-4eb9-54f6-dbe5-6468bbfc5ef0', 'emails_cases_rel', 'Emails', 'emails', 'id', 'Cases', 'cases', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Cases', 0, 0),
('6a8c24a1-68f9-a14d-3b11-6468bbd7204f', 'emails_opportunities_rel', 'Emails', 'emails', 'id', 'Opportunities', 'opportunities', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Opportunities', 0, 0),
('6ad6734e-2326-89e3-ee7b-6468bb9f1bc8', 'emails_tasks_rel', 'Emails', 'emails', 'id', 'Tasks', 'tasks', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Tasks', 0, 0),
('6b2e2d31-e9c0-4103-d823-6468bb3a5488', 'emails_users_rel', 'Emails', 'emails', 'id', 'Users', 'users', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('6b7beb14-4419-1f87-f088-6468bb59c5b3', 'emails_project_task_rel', 'Emails', 'emails', 'id', 'ProjectTask', 'project_task', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'ProjectTask', 0, 0),
('6bb9a1dd-af5b-4279-a530-6468bb4c3512', 'emails_projects_rel', 'Emails', 'emails', 'id', 'Project', 'project', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Project', 0, 0),
('6c02d9cc-c07e-ad27-cacd-6468bb2cc539', 'emails_prospects_rel', 'Emails', 'emails', 'id', 'Prospects', 'prospects', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('6c5f3ecc-1dda-8c3f-8c6f-6468bb02035d', 'meetings_contacts', 'Meetings', 'meetings', 'id', 'Contacts', 'contacts', 'id', 'meetings_contacts', 'meeting_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('6ca963b8-6ad3-5d92-9ea5-6468bb1ed900', 'meetings_users', 'Meetings', 'meetings', 'id', 'Users', 'users', 'id', 'meetings_users', 'meeting_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('6d098068-e426-85e9-cfe9-6468bb69706d', 'meetings_leads', 'Meetings', 'meetings', 'id', 'Leads', 'leads', 'id', 'meetings_leads', 'meeting_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('6d5b980b-467d-cd9f-f574-6468bb7e6d3a', 'opportunities_contacts', 'Opportunities', 'opportunities', 'id', 'Contacts', 'contacts', 'id', 'opportunities_contacts', 'opportunity_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('6da66b0d-e244-aac5-b4fe-6468bb748d73', 'prospect_list_campaigns', 'ProspectLists', 'prospect_lists', 'id', 'Campaigns', 'campaigns', 'id', 'prospect_list_campaigns', 'prospect_list_id', 'campaign_id', 'many-to-many', NULL, NULL, 0, 0),
('6dbfcf21-3752-c902-03f6-6468bb3a368d', 'securitygroups_emailtemplates', 'SecurityGroups', 'securitygroups', 'id', 'EmailTemplates', 'email_templates', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'EmailTemplates', 0, 0),
('6deb499e-bd30-0e37-4fdb-6468bb1d8aac', 'prospect_list_contacts', 'ProspectLists', 'prospect_lists', 'id', 'Contacts', 'contacts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Contacts', 0, 0),
('6e133557-d18c-de19-61c0-6468bb446466', 'emailtemplates_assigned_user', 'Users', 'users', 'id', 'EmailTemplates', 'email_templates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6e2acb30-6d98-c0c8-27b5-6468bb1d0fd3', 'prospect_list_prospects', 'ProspectLists', 'prospect_lists', 'id', 'Prospects', 'prospects', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Prospects', 0, 0),
('6e6a1e1f-2894-6cec-484f-6468bb784953', 'prospect_list_leads', 'ProspectLists', 'prospect_lists', 'id', 'Leads', 'leads', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Leads', 0, 0),
('6e7bd91a-6d3b-0ba8-eeeb-6468bb875354', 'aor_scheduled_reports_modified_user', 'Users', 'users', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6eb5eb00-54ac-b97c-690d-6468bb5bec5b', 'prospect_list_users', 'ProspectLists', 'prospect_lists', 'id', 'Users', 'users', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Users', 0, 0),
('6edf586d-506e-3195-df39-6468bb23702d', 'aor_scheduled_reports_created_by', 'Users', 'users', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6f231b99-65c8-b0ee-f9de-6468bb3ab687', 'securitygroups_aor_scheduled_reports', 'SecurityGroups', 'securitygroups', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOR_Scheduled_Reports', 0, 0),
('6f2e5867-2f6b-ea41-921c-6468bb8f4540', 'prospect_list_accounts', 'ProspectLists', 'prospect_lists', 'id', 'Accounts', 'accounts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Accounts', 0, 0),
('6f861f9b-609a-ca76-0c3c-6468bb536104', 'roles_users', 'Roles', 'roles', 'id', 'Users', 'users', 'id', 'roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('6fecbdf5-1b7c-4e13-2013-6468bbcbb860', 'projects_bugs', 'Project', 'project', 'id', 'Bugs', 'bugs', 'id', 'projects_bugs', 'project_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('703d04db-9386-031b-1e6a-6468bb5e1672', 'projects_cases', 'Project', 'project', 'id', 'Cases', 'cases', 'id', 'projects_cases', 'project_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('709faeb9-6dfa-12fa-5c98-6468bb557de7', 'projects_accounts', 'Project', 'project', 'id', 'Accounts', 'accounts', 'id', 'projects_accounts', 'project_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('70e9ac5b-d6a5-58c2-08d1-6468bb20d6c4', 'projects_contacts', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'projects_contacts', 'project_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('713256e7-8cac-bd46-ca0a-6468bbac31af', 'projects_opportunities', 'Project', 'project', 'id', 'Opportunities', 'opportunities', 'id', 'projects_opportunities', 'project_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('714b0b2a-331e-48d6-de56-6468bbe88968', 'am_tasktemplates_modified_user', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('71794cd9-9467-7c1a-2cf4-6468bba1c3a7', 'acl_roles_actions', 'ACLRoles', 'acl_roles', 'id', 'ACLActions', 'acl_actions', 'id', 'acl_roles_actions', 'role_id', 'action_id', 'many-to-many', NULL, NULL, 0, 0),
('71c15ca9-6b26-f92b-bbc3-6468bbea0b16', 'acl_roles_users', 'ACLRoles', 'acl_roles', 'id', 'Users', 'users', 'id', 'acl_roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('723767dd-23da-94ab-5082-6468bb2cdb89', 'email_marketing_prospect_lists', 'EmailMarketing', 'email_marketing', 'id', 'ProspectLists', 'prospect_lists', 'id', 'email_marketing_prospect_lists', 'email_marketing_id', 'prospect_list_id', 'many-to-many', NULL, NULL, 0, 0),
('729e2de1-18f0-7e11-7b6e-6468bb817172', 'leads_documents', 'Leads', 'leads', 'id', 'Documents', 'documents', 'id', 'linked_documents', 'parent_id', 'document_id', 'many-to-many', 'parent_type', 'Leads', 0, 0),
('72ec8d90-c5dc-a3a8-6aab-6468bb630a4d', 'documents_accounts', 'Documents', 'documents', 'id', 'Accounts', 'accounts', 'id', 'documents_accounts', 'document_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('73343e87-3d28-80e0-f69b-6468bb828692', 'documents_contacts', 'Documents', 'documents', 'id', 'Contacts', 'contacts', 'id', 'documents_contacts', 'document_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('737d671c-30d4-e753-ba5c-6468bb017b75', 'documents_opportunities', 'Documents', 'documents', 'id', 'Opportunities', 'opportunities', 'id', 'documents_opportunities', 'document_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('73dc92a2-4e95-cf0e-6527-6468bbdb8cdb', 'documents_cases', 'Documents', 'documents', 'id', 'Cases', 'cases', 'id', 'documents_cases', 'document_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('7425bf66-6411-1397-2c75-6468bb6a81db', 'documents_bugs', 'Documents', 'documents', 'id', 'Bugs', 'bugs', 'id', 'documents_bugs', 'document_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('747c8d49-5f08-b643-b689-6468bb3b10ab', 'aok_knowledgebase_categories', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'id', 'AOK_Knowledge_Base_Categories', 'aok_knowledge_base_categories', 'id', 'aok_knowledgebase_categories', 'aok_knowledgebase_id', 'aok_knowledge_base_categories_id', 'many-to-many', NULL, NULL, 0, 0),
('74c0fa79-81de-f235-d9af-6468bb8d490c', 'am_projecttemplates_project_1', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'Project', 'project', 'id', 'am_projecttemplates_project_1_c', 'am_projecttemplates_project_1am_projecttemplates_ida', 'am_projecttemplates_project_1project_idb', 'many-to-many', NULL, NULL, 0, 0),
('75054cd8-2a44-62b3-4244-6468bbea1b03', 'am_projecttemplates_contacts_1', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'Contacts', 'contacts', 'id', 'am_projecttemplates_contacts_1_c', 'am_projecttemplates_ida', 'contacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('7548281e-5b93-abf7-9c93-6468bb82091c', 'am_projecttemplates_users_1', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'Users', 'users', 'id', 'am_projecttemplates_users_1_c', 'am_projecttemplates_ida', 'users_idb', 'many-to-many', NULL, NULL, 0, 0);
INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('75a0512c-5c7e-5567-6a0d-6468bbd7a713', 'am_tasktemplates_am_projecttemplates', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'id', 'am_tasktemplates_am_projecttemplates_c', 'am_tasktemplates_am_projecttemplatesam_projecttemplates_ida', 'am_tasktemplates_am_projecttemplatesam_tasktemplates_idb', 'many-to-many', NULL, NULL, 0, 0),
('762168d2-84e8-06fb-ce05-6468bbed8870', 'aos_contracts_documents', 'AOS_Contracts', 'aos_contracts', 'id', 'Documents', 'documents', 'id', 'aos_contracts_documents', 'aos_contracts_id', 'documents_id', 'many-to-many', NULL, NULL, 0, 0),
('76900878-d61d-2c84-83df-6468bb7a7c2f', 'aos_quotes_aos_contracts', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Contracts', 'aos_contracts', 'id', 'aos_quotes_os_contracts_c', 'aos_quotese81e_quotes_ida', 'aos_quotes4dc0ntracts_idb', 'many-to-many', NULL, NULL, 0, 0),
('76a00dc6-0f9b-a24d-f83f-6468bb699dff', 'securitygroups_modified_user', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('76d4c541-56a2-b7be-a513-6468bbaf4b22', 'aos_quotes_aos_invoices', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Invoices', 'aos_invoices', 'id', 'aos_quotes_aos_invoices_c', 'aos_quotes77d9_quotes_ida', 'aos_quotes6b83nvoices_idb', 'many-to-many', NULL, NULL, 0, 0),
('770e4095-7da2-29d0-a95a-6468bb16aa59', 'aos_contracts_modified_user', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('77205fc5-6540-68f9-c6d5-6468bbb50e1f', 'aos_quotes_project', 'AOS_Quotes', 'aos_quotes', 'id', 'Project', 'project', 'id', 'aos_quotes_project_c', 'aos_quotes1112_quotes_ida', 'aos_quotes7207project_idb', 'many-to-many', NULL, NULL, 0, 0),
('7770f67d-2d59-8190-4faa-6468bb60d77d', 'aos_contracts_created_by', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('77723257-f2aa-c46f-bd90-6468bb2e5b7f', 'aow_processed_aow_actions', 'AOW_Processed', 'aow_processed', 'id', 'AOW_Actions', 'aow_actions', 'id', 'aow_processed_aow_actions', 'aow_processed_id', 'aow_action_id', 'many-to-many', NULL, NULL, 0, 0),
('77bc371c-e870-49a7-d158-6468bbfc94fe', 'aos_contracts_assigned_user', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('77c98beb-a1ae-d17b-a34e-6468bbdf6eb1', 'fp_event_locations_fp_events_1', 'FP_Event_Locations', 'fp_event_locations', 'id', 'FP_events', 'fp_events', 'id', 'fp_event_locations_fp_events_1_c', 'fp_event_locations_fp_events_1fp_event_locations_ida', 'fp_event_locations_fp_events_1fp_events_idb', 'many-to-many', NULL, NULL, 0, 0),
('77fd11b7-86e3-037a-9041-6468bbf94071', 'securitygroups_aos_contracts', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Contracts', 'aos_contracts', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Contracts', 0, 0),
('7813c0fb-1fb1-25a3-8115-6468bb4bf5e1', 'fp_events_contacts', 'FP_events', 'fp_events', 'id', 'Contacts', 'contacts', 'id', 'fp_events_contacts_c', 'fp_events_contactsfp_events_ida', 'fp_events_contactscontacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('7846d32d-206b-b456-33be-6468bb747909', 'aos_contracts_tasks', 'AOS_Contracts', 'aos_contracts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOS_Contracts', 0, 0),
('78582467-a83f-060b-59f7-6468bba3bd6b', 'fp_events_fp_event_locations_1', 'FP_events', 'fp_events', 'id', 'FP_Event_Locations', 'fp_event_locations', 'id', 'fp_events_fp_event_locations_1_c', 'fp_events_fp_event_locations_1fp_events_ida', 'fp_events_fp_event_locations_1fp_event_locations_idb', 'many-to-many', NULL, NULL, 0, 0),
('789947b7-f135-3cef-11b0-6468bb94efa4', 'fp_events_leads_1', 'FP_events', 'fp_events', 'id', 'Leads', 'leads', 'id', 'fp_events_leads_1_c', 'fp_events_leads_1fp_events_ida', 'fp_events_leads_1leads_idb', 'many-to-many', NULL, NULL, 0, 0),
('78b13a24-189e-007d-a7b1-6468bb1e8f20', 'aos_contracts_notes', 'AOS_Contracts', 'aos_contracts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOS_Contracts', 0, 0),
('78dbe787-e2af-d4a6-ad12-6468bbb0cebb', 'fp_events_prospects_1', 'FP_events', 'fp_events', 'id', 'Prospects', 'prospects', 'id', 'fp_events_prospects_1_c', 'fp_events_prospects_1fp_events_ida', 'fp_events_prospects_1prospects_idb', 'many-to-many', NULL, NULL, 0, 0),
('791e4093-57cb-bb81-98fb-6468bb7b3000', 'aos_contracts_meetings', 'AOS_Contracts', 'aos_contracts', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOS_Contracts', 0, 0),
('794278f8-ae1b-a2d2-bdfb-6468bbf1c0fa', 'jjwg_maps_jjwg_areas', 'jjwg_Maps', 'jjwg_maps', 'id', 'jjwg_Areas', 'jjwg_areas', 'id', 'jjwg_maps_jjwg_areas_c', 'jjwg_maps_5304wg_maps_ida', 'jjwg_maps_41f2g_areas_idb', 'many-to-many', NULL, NULL, 0, 0),
('798e6ceb-dacc-a4fd-a873-6468bbb30690', 'jjwg_maps_jjwg_markers', 'jjwg_Maps', 'jjwg_maps', 'id', 'jjwg_Markers', 'jjwg_markers', 'id', 'jjwg_maps_jjwg_markers_c', 'jjwg_maps_b229wg_maps_ida', 'jjwg_maps_2e31markers_idb', 'many-to-many', NULL, NULL, 0, 0),
('79b1f0b2-f8da-2e85-6644-6468bb493ec6', 'aos_contracts_calls', 'AOS_Contracts', 'aos_contracts', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOS_Contracts', 0, 0),
('79d1ff35-1723-68d3-d521-6468bb8a909f', 'project_contacts_1', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'project_contacts_1_c', 'project_contacts_1project_ida', 'project_contacts_1contacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('79ed7f15-cd70-3c24-c7cc-6468bb1f51bc', 'notes_assigned_user', 'Users', 'users', 'id', 'Notes', 'notes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7a0a1a1e-ab89-3ab2-aeb3-6468bb638c39', 'aos_contracts_aos_products_quotes', 'AOS_Contracts', 'aos_contracts', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7a210c01-3eca-b071-45d0-6468bb516b53', 'project_users_1', 'Project', 'project', 'id', 'Users', 'users', 'id', 'project_users_1_c', 'project_users_1project_ida', 'project_users_1users_idb', 'many-to-many', NULL, NULL, 0, 0),
('7a4b4ade-c657-92c9-f14d-6468bbac0301', 'aos_contracts_aos_line_item_groups', 'AOS_Contracts', 'aos_contracts', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7a637265-8741-b6cd-08c8-6468bb65f1d5', 'securitygroups_acl_roles', 'SecurityGroups', 'securitygroups', 'id', 'ACLRoles', 'acl_roles', 'id', 'securitygroups_acl_roles', 'securitygroup_id', 'role_id', 'many-to-many', NULL, NULL, 0, 0),
('7a800899-9a3b-956f-8762-6468bb7d06d5', 'am_tasktemplates_created_by', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7ac1edfd-b05c-f5f1-af9b-6468bbace7d4', 'securitygroups_notes', 'SecurityGroups', 'securitygroups', 'id', 'Notes', 'notes', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Notes', 0, 0),
('7b8a14ff-fd9b-8013-b3fa-6468bb4be218', 'notes_modified_user', 'Users', 'users', 'id', 'Notes', 'notes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7ba30d77-5ff0-c945-9f45-6468bbff9926', 'securitygroups_created_by', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7ba53150-0ea9-83d0-1eec-6468bba90df8', 'securitygroups_project_task', 'SecurityGroups', 'securitygroups', 'id', 'ProjectTask', 'project_task', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProjectTask', 0, 0),
('7be5f2e0-5f4e-8502-1f27-6468bb78d367', 'securitygroups_prospect_lists', 'SecurityGroups', 'securitygroups', 'id', 'ProspectLists', 'prospect_lists', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProspectLists', 0, 0),
('7c4a6611-8df3-ac8a-7163-6468bb2663c3', 'securitygroups_users', 'SecurityGroups', 'securitygroups', 'id', 'Users', 'users', 'id', 'securitygroups_users', 'securitygroup_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('7c582d08-6831-639d-9151-6468bb44bcb4', 'notes_created_by', 'Users', 'users', 'id', 'Notes', 'notes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7ca10568-a9cd-1f59-9509-6468bb0e464d', 'surveyquestionoptions_surveyquestionresponses', 'SurveyQuestionOptions', 'surveyquestionoptions', 'id', 'SurveyQuestionResponses', 'surveyquestionresponses', 'id', 'surveyquestionoptions_surveyquestionresponses', 'surveyq72c7options_ida', 'surveyq10d4sponses_idb', 'many-to-many', NULL, NULL, 0, 0),
('7ce7fa85-b57e-4786-a379-6468bb0b641a', 'accounts_cases_1', 'Accounts', 'accounts', 'id', 'Cases', 'cases', 'id', 'accounts_cases_1_c', 'accounts_cases_1accounts_ida', 'accounts_cases_1cases_idb', 'many-to-many', NULL, NULL, 0, 0),
('7d2e9426-068e-4d05-68f0-6468bba63db2', 'accounts_leads_1', 'Accounts', 'accounts', 'id', 'Leads', 'leads', 'id', 'accounts_leads_1_c', 'accounts_leads_1accounts_ida', 'accounts_leads_1leads_idb', 'many-to-many', NULL, NULL, 0, 0),
('7d7e4702-b42b-d0e3-0fe8-6468bba27230', 'asteriskintegration_accounts', 'Accounts', 'accounts', 'id', 'AsteriskIntegration', 'asteriskintegration', 'id', 'asteriskintegration_accounts', 'asteriskintegration_accountsaccounts_ida', 'asteriskintegration_accountsasteriskintegration_idb', 'many-to-many', NULL, NULL, 0, 0),
('7dc16f74-e001-3fae-03e4-6468bbd33847', 'asteriskintegration_contacts', 'Contacts', 'contacts', 'id', 'AsteriskIntegration', 'asteriskintegration', 'id', 'asteriskintegration_contacts', 'asteriskintegration_contactscontacts_ida', 'asteriskintegration_contactsasteriskintegration_idb', 'many-to-many', NULL, NULL, 0, 0),
('7e00730a-3008-d101-feed-6468bb1c4b31', 'asteriskintegration_leads', 'Leads', 'leads', 'id', 'AsteriskIntegration', 'asteriskintegration', 'id', 'asteriskintegration_leads', 'asteriskintegration_leadsleads_ida', 'asteriskintegration_leadsasteriskintegration_idb', 'many-to-many', NULL, NULL, 0, 0),
('7e5d03c8-7a07-e5b4-4681-6468bb8a58f1', 'fpoly_leadimports_leads_1', 'fpoly_LeadImports', 'fpoly_leadimports', 'id', 'Leads', 'leads', 'id', 'fpoly_leadimports_leads_1_c', 'fpoly_leadimports_leads_1fpoly_leadimports_ida', 'fpoly_leadimports_leads_1leads_idb', 'many-to-many', NULL, NULL, 0, 0),
('7ecc8f7b-984c-6f40-b8fa-6468bb8a149e', 'leads_accounts_1', 'Leads', 'leads', 'id', 'Accounts', 'accounts', 'id', 'leads_accounts_1_c', 'leads_accounts_1leads_ida', 'leads_accounts_1accounts_idb', 'many-to-many', NULL, NULL, 0, 0),
('7f1dd429-ce6e-dac3-0cde-6468bb986d9f', 'leads_opportunities_1', 'Leads', 'leads', 'id', 'Opportunities', 'opportunities', 'id', 'leads_opportunities_1_c', 'leads_opportunities_1leads_ida', 'leads_opportunities_1opportunities_idb', 'many-to-many', NULL, NULL, 0, 0),
('7f7f8861-6d0a-1aa9-2202-6468bb83d349', 'opportunities_leads_1', 'Opportunities', 'opportunities', 'id', 'Leads', 'leads', 'id', 'opportunities_leads_1_c', 'opportunities_leads_1opportunities_ida', 'opportunities_leads_1leads_idb', 'many-to-many', NULL, NULL, 0, 0),
('800b09af-10d8-45ba-c7c3-6468bb4b98e0', 'securitygroups_assigned_user', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('80700489-14e0-7f6e-99ce-6468bbf1419d', 'am_tasktemplates_assigned_user', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('81a3b92e-5281-b968-f5b9-6468bbcdd274', 'aos_invoices_modified_user', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8212fa3e-40b1-a1db-9c0a-6468bb1ff1bd', 'aos_invoices_created_by', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('82b8d00a-165f-54c1-c12a-6468bb509c72', 'aos_invoices_assigned_user', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('83067740-e35c-404a-2619-6468bb26dfdd', 'securitygroups_aos_invoices', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Invoices', 'aos_invoices', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Invoices', 0, 0),
('836a0fea-2b60-6a9e-7acd-6468bb8f2e1b', 'aos_invoices_aos_product_quotes', 'AOS_Invoices', 'aos_invoices', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('83c72cbd-6716-b887-a927-6468bb3aac09', 'aos_invoices_aos_line_item_groups', 'AOS_Invoices', 'aos_invoices', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('87e8c9ba-6617-a1bb-61c6-6468bb3abafc', 'calls_modified_user', 'Users', 'users', 'id', 'Calls', 'calls', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('88382a72-5a92-30c8-4ac4-6468bb26ddc4', 'calls_created_by', 'Users', 'users', 'id', 'Calls', 'calls', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('88834c97-4a12-32dd-f01d-6468bb0f406d', 'calls_assigned_user', 'Users', 'users', 'id', 'Calls', 'calls', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('88d2cddf-5269-f809-f01b-6468bbd5d081', 'securitygroups_calls', 'SecurityGroups', 'securitygroups', 'id', 'Calls', 'calls', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Calls', 0, 0),
('8928755d-4a6d-b0ab-ce94-6468bbe4895a', 'calls_notes', 'Calls', 'calls', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Calls', 0, 0),
('89722aa3-27d0-330c-3363-6468bb04b900', 'calls_reschedule', 'Calls', 'calls', 'id', 'Calls_Reschedule', 'calls_reschedule', 'call_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8b139b98-77d5-f019-d6d6-6468bb11bbaa', 'aos_pdf_templates_modified_user', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8b6b1514-b42b-79b6-4d8d-6468bbdafc44', 'aos_pdf_templates_created_by', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8bae9dbf-1ce0-f226-6409-6468bb790cfd', 'aos_pdf_templates_assigned_user', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8bfe6125-402c-e797-be15-6468bb06c0a8', 'securitygroups_aos_pdf_templates', 'SecurityGroups', 'securitygroups', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_PDF_Templates', 0, 0),
('92ed91bd-b73c-cce3-0917-6468bbd9b444', 'aos_product_categories_modified_user', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9351a967-f29c-faaa-28fb-6468bb2c68f1', 'aos_product_categories_created_by', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('93bd7001-d2fa-2631-502c-6468bb5a7e8a', 'aos_product_categories_assigned_user', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('940ffef5-2c3c-134d-57cb-6468bbb72d2e', 'securitygroups_aos_product_categories', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Product_Categories', 0, 0),
('942c8cb0-f1ce-0f2f-f1cd-6468bb0af564', 'emails_modified_user', 'Users', 'users', 'id', 'Emails', 'emails', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9464ec78-b4ea-934b-1b10-6468bb1319fd', 'sub_product_categories', 'AOS_Product_Categories', 'aos_product_categories', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'parent_category_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('948b5970-67da-ef24-2b35-6468bbfff70d', 'emails_created_by', 'Users', 'users', 'id', 'Emails', 'emails', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('94e7c504-7d4a-bcd4-cf07-6468bb8e13f1', 'emails_assigned_user', 'Users', 'users', 'id', 'Emails', 'emails', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9531572e-d79d-9bb7-9309-6468bb8a7684', 'securitygroups_emails', 'SecurityGroups', 'securitygroups', 'id', 'Emails', 'emails', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Emails', 0, 0),
('9578e237-bc3e-e8fb-3823-6468bbd7f163', 'emails_notes_rel', 'Emails', 'emails', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('95c04361-e903-4d14-15f3-6468bb03204f', 'emails_contacts_rel', 'Emails', 'emails', 'id', 'Contacts', 'contacts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('96058f8f-d697-68be-698e-6468bbfc24f3', 'emails_accounts_rel', 'Emails', 'emails', 'id', 'Accounts', 'accounts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('964466cd-21b3-bfdc-6758-6468bb5bffbf', 'emails_leads_rel', 'Emails', 'emails', 'id', 'Leads', 'leads', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('96a5dd68-4e6a-efad-e8f1-6468bb903109', 'emails_aos_contracts_rel', 'Emails', 'emails', 'id', 'AOS_Contracts', 'aos_contracts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'AOS_Contracts', 0, 0),
('9709f9e9-9055-0baa-e984-6468bb80766a', 'emails_meetings_rel', 'Emails', 'emails', 'id', 'Meetings', 'meetings', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Meetings', 0, 0),
('9be8043f-96be-ca8b-abc7-6468bbaa0cf8', 'aos_products_modified_user', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9c2bbb4f-6c25-3e79-8931-6468bbe861e3', 'aos_products_created_by', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9c6ffd43-12ed-252e-a287-6468bb6ebbe9', 'aos_products_assigned_user', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9cb41922-71c4-501a-9a89-6468bbb5aad6', 'securitygroups_aos_products', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Products', 'aos_products', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Products', 0, 0),
('9cfa16f3-36cd-1883-9fbe-6468bbca2e7e', 'product_categories', 'AOS_Product_Categories', 'aos_product_categories', 'id', 'AOS_Products', 'aos_products', 'aos_product_category_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9ebffb51-954f-e766-13c1-6468bb17444a', 'meetings_modified_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9f24fe5d-6584-7572-9ca7-6468bb90b786', 'meetings_created_by', 'Users', 'users', 'id', 'Meetings', 'meetings', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9f7377d6-2fbf-06ad-7968-6468bb43a17c', 'meetings_assigned_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9fb9bc6f-b3a7-8aaf-3bb5-6468bb2ead64', 'securitygroups_meetings', 'SecurityGroups', 'securitygroups', 'id', 'Meetings', 'meetings', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Meetings', 0, 0),
('a007dfb3-a2e4-66d6-81f6-6468bbcc061d', 'meetings_notes', 'Meetings', 'meetings', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Meetings', 0, 0),
('a2b00831-e07b-2693-b7d2-6468bb72335d', 'calls_reschedule_assigned_user', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a2e0096e-aa7f-229a-cc73-6468bbc1db5f', 'favorites_modified_user', 'Users', 'users', 'id', 'Favorites', 'favorites', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a44b0ab6-9c9e-3cb4-db85-6468bb83941f', 'aos_products_quotes_modified_user', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a4a5afc0-e2fc-e751-ffb7-6468bb8869dc', 'aos_products_quotes_created_by', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a4ecb7eb-8188-a8f5-6eea-6468bb499f8c', 'aos_products_quotes_assigned_user', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a533732c-b068-1f70-a470-6468bb041d16', 'aos_product_quotes_aos_products', 'AOS_Products', 'aos_products', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'product_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a7e4069b-d185-8db3-828f-6468bb052e15', 'tasks_modified_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a8399dd5-0b8d-63ac-995e-6468bb690782', 'tasks_created_by', 'Users', 'users', 'id', 'Tasks', 'tasks', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a87ad3f3-0bdb-d348-e5f2-6468bbe0d45f', 'tasks_assigned_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a8bda3b9-104a-79d5-23d3-6468bb65919c', 'securitygroups_tasks', 'SecurityGroups', 'securitygroups', 'id', 'Tasks', 'tasks', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Tasks', 0, 0),
('a8fdeb27-9d99-2e42-47b3-6468bb06ff4f', 'tasks_notes', 'Tasks', 'tasks', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a9210c47-e093-41ea-39d7-6468bbbb4fbf', 'favorites_created_by', 'Users', 'users', 'id', 'Favorites', 'favorites', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('acef45da-fce2-b2ea-2e2f-6468bb07c0b0', 'aos_line_item_groups_modified_user', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ad80353f-80c5-32d3-0356-6468bb7dd587', 'aos_line_item_groups_created_by', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ade101e9-b157-ebab-7622-6468bb9f4f2e', 'favorites_assigned_user', 'Users', 'users', 'id', 'Favorites', 'favorites', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ae10d5b3-3df4-7ec5-1789-6468bbdaae0c', 'aos_line_item_groups_assigned_user', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ae6fbc18-a0b4-a99a-ce91-6468bbc2de72', 'groups_aos_product_quotes', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'group_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b6a34e55-d4ec-6dee-a2ab-6468bbdb0601', 'alerts_modified_user', 'Users', 'users', 'id', 'Alerts', 'alerts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b6ebdcf4-b5a9-d80b-3e84-6468bb739d18', 'alerts_created_by', 'Users', 'users', 'id', 'Alerts', 'alerts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b70c2082-5a7f-4da7-fd47-6468bbca9163', 'aos_quotes_modified_user', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b72e175f-7a22-8065-47ee-6468bb47edb9', 'alerts_assigned_user', 'Users', 'users', 'id', 'Alerts', 'alerts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b79151f6-84ec-1e78-fd59-6468bbc7b371', 'aos_quotes_created_by', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b8303215-d521-a63e-ad5f-6468bbdf2d8c', 'aos_quotes_assigned_user', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b8968c36-ca6f-0d16-f3a8-6468bb9042b7', 'securitygroups_aos_quotes', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Quotes', 'aos_quotes', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Quotes', 0, 0),
('b90572a0-b5f8-c3ca-0b1a-6468bb7ad06b', 'aos_quotes_aos_product_quotes', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b960ece1-0900-1931-1145-6468bb77f5ab', 'aos_quotes_aos_line_item_groups', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bb72e8cb-b3bd-d93d-3178-6468bb405da1', 'aow_actions_modified_user', 'Users', 'users', 'id', 'AOW_Actions', 'aow_actions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bbe8061f-ffa7-5549-b1d0-6468bb023b96', 'aow_actions_created_by', 'Users', 'users', 'id', 'AOW_Actions', 'aow_actions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bcfbc9ab-fed1-b0cb-ab6e-6468bbc53e84', 'aow_workflow_modified_user', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bd5119d3-6bd9-2bf3-2af2-6468bbf53981', 'leads_modified_user', 'Users', 'users', 'id', 'Leads', 'leads', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bd51df44-ffc1-18ad-d32a-6468bb5d7004', 'aow_workflow_created_by', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bd9eeb4a-54ce-a4f3-c832-6468bb20373a', 'aow_workflow_assigned_user', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bdb76526-2ef8-d3bd-a7af-6468bb2e1f9e', 'leads_created_by', 'Users', 'users', 'id', 'Leads', 'leads', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bdeb0333-7054-b93e-fe44-6468bb635c6c', 'securitygroups_aow_workflow', 'SecurityGroups', 'securitygroups', 'id', 'AOW_WorkFlow', 'aow_workflow', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOW_WorkFlow', 0, 0),
('be026b78-78ce-9e00-190f-6468bb71ac85', 'leads_assigned_user', 'Users', 'users', 'id', 'Leads', 'leads', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('be447aaa-a181-6504-cb75-6468bbcb34b5', 'aow_workflow_aow_conditions', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Conditions', 'aow_conditions', 'aow_workflow_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('be67ecd7-0c78-38ba-0a16-6468bb0c6238', 'securitygroups_leads', 'SecurityGroups', 'securitygroups', 'id', 'Leads', 'leads', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Leads', 0, 0),
('beabdb4e-4e64-2216-f32a-6468bb0e711b', 'aow_workflow_aow_actions', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Actions', 'aow_actions', 'aow_workflow_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bf0df65f-371a-689a-1086-6468bb9bc272', 'leads_email_addresses', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('bf3d3ef9-26d3-9d97-53d5-6468bbb85b55', 'aow_workflow_aow_processed', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Processed', 'aow_processed', 'aow_workflow_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bf6cc693-2741-7f53-8ed3-6468bb6acd17', 'documents_modified_user', 'Users', 'users', 'id', 'Documents', 'documents', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bf71434e-2624-d0fb-3cb7-6468bb395b26', 'leads_email_addresses_primary', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('bfcef3db-953b-1328-cebc-6468bbec619b', 'documents_created_by', 'Users', 'users', 'id', 'Documents', 'documents', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bfcf196d-6994-3824-b1e2-6468bbc1bdaa', 'lead_direct_reports', 'Leads', 'leads', 'id', 'Leads', 'leads', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c01aca06-a25e-ac7e-02d9-6468bb4f37e7', 'documents_assigned_user', 'Users', 'users', 'id', 'Documents', 'documents', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c02bf1e2-2a28-dfe4-986a-6468bbf4e403', 'lead_tasks', 'Leads', 'leads', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('c05dc1f9-3f19-7c10-ea81-6468bb80d72d', 'securitygroups_documents', 'SecurityGroups', 'securitygroups', 'id', 'Documents', 'documents', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Documents', 0, 0),
('c08a3bea-c6ae-b260-2921-6468bbac8ce1', 'lead_notes', 'Leads', 'leads', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('c0ab346d-f1e6-adc5-238d-6468bbebafb2', 'document_revisions', 'Documents', 'documents', 'id', 'DocumentRevisions', 'document_revisions', 'document_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c0d65881-3bf8-4e57-24d6-6468bbdc3d51', 'lead_meetings', 'Leads', 'leads', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('c123b4fe-cd38-d976-5b0f-6468bbff94c4', 'lead_calls', 'Leads', 'leads', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('c1773e39-283d-fd72-d953-6468bb1e9aaf', 'lead_emails', 'Leads', 'leads', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('c1e6fbe7-5fcc-1bcf-7c34-6468bbd05319', 'lead_campaign_log', 'Leads', 'leads', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Leads', 0, 0),
('c25fec33-17eb-33b0-2203-6468bb73dab7', 'revisions_created_by', 'Users', 'users', 'id', 'DocumentRevisions', 'document_revisions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c6393330-89a5-1f23-96a8-6468bbb612bc', 'aow_processed_modified_user', 'Users', 'users', 'id', 'AOW_Processed', 'aow_processed', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c68d1899-6bfe-b4a3-8fd5-6468bba037f2', 'aow_processed_created_by', 'Users', 'users', 'id', 'AOW_Processed', 'aow_processed', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c79ebc93-65ab-ac30-9618-6468bb4af813', 'inbound_email_created_by', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('c806f854-139f-9647-19fb-6468bb08cc18', 'inbound_email_modified_user_id', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'modified_user_id', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('c9e477f3-ca06-a9bc-d0a7-6468bb7faf29', 'saved_search_assigned_user', 'Users', 'users', 'id', 'SavedSearch', 'saved_search', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cb2d686d-3c8e-28cf-5108-6468bb364ff5', 'cases_modified_user', 'Users', 'users', 'id', 'Cases', 'cases', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cb7e1f3c-12fd-3452-7d7b-6468bbc6ef47', 'cases_created_by', 'Users', 'users', 'id', 'Cases', 'cases', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cbbb0b9f-3497-11cd-3d6a-6468bb4574bc', 'campaigns_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cbd413e6-f988-1ae3-8411-6468bb5a9a60', 'cases_assigned_user', 'Users', 'users', 'id', 'Cases', 'cases', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cc22ac1a-0757-1e10-7be2-6468bb9c514d', 'securitygroups_cases', 'SecurityGroups', 'securitygroups', 'id', 'Cases', 'cases', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Cases', 0, 0),
('cc69f9db-59d0-15d6-01ad-6468bbb49a12', 'case_calls', 'Cases', 'cases', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('ccaaa6af-b722-cda7-74ef-6468bbee4ba3', 'case_tasks', 'Cases', 'cases', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('cce7cf0e-51e1-8e5a-0c6d-6468bb94c2e8', 'case_notes', 'Cases', 'cases', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('cd25982f-0631-fa06-72ed-6468bb3b58a9', 'case_meetings', 'Cases', 'cases', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('cd5d0083-7263-021f-eef8-6468bb4cd0b6', 'aok_knowledge_base_categories_modified_user', 'Users', 'users', 'id', 'AOK_Knowledge_Base_Categories', 'aok_knowledge_base_categories', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cd6541ad-2853-de36-8c94-6468bb71d508', 'case_emails', 'Cases', 'cases', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('cda9de4e-8209-fc4d-4da7-6468bb736017', 'cases_created_contact', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'contact_created_by_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cde51756-000b-169b-28a0-6468bba2c024', 'aow_conditions_modified_user', 'Users', 'users', 'id', 'AOW_Conditions', 'aow_conditions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ce53edd3-dda8-cb67-41a3-6468bb644dca', 'aow_conditions_created_by', 'Users', 'users', 'id', 'AOW_Conditions', 'aow_conditions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d0d605a2-eaad-95d1-8bbc-6468bbb43e96', 'campaigns_created_by', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d3061357-9791-a345-0896-6468bbbffadc', 'spots_modified_user', 'Users', 'users', 'id', 'Spots', 'spots', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d360ab8f-d961-eb51-110c-6468bb81a723', 'spots_created_by', 'Users', 'users', 'id', 'Spots', 'spots', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d3c8f390-2f14-f106-5c45-6468bbebee98', 'spots_assigned_user', 'Users', 'users', 'id', 'Spots', 'spots', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d3f40e2c-e8eb-a27a-7268-6468bb0ee7cb', 'aok_knowledge_base_categories_created_by', 'Users', 'users', 'id', 'AOK_Knowledge_Base_Categories', 'aok_knowledge_base_categories', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d41a1ca2-3ea0-c5a2-b0b2-6468bba88fbb', 'securitygroups_spots', 'SecurityGroups', 'securitygroups', 'id', 'Spots', 'spots', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Spots', 0, 0),
('d5af1e4d-efc0-efb0-77b3-6468bbbc889e', 'bugs_modified_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d606b7d7-b080-8381-55cb-6468bb3c38e1', 'bugs_created_by', 'Users', 'users', 'id', 'Bugs', 'bugs', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d6420491-af41-8615-2c4f-6468bb19739d', 'jjwg_maps_modified_user', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d64b889e-3f42-0ef3-f9ff-6468bb273891', 'bugs_assigned_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d66988e5-243f-290a-5cee-6468bb0739aa', 'aobh_businesshours_modified_user', 'Users', 'users', 'id', 'AOBH_BusinessHours', 'aobh_businesshours', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d6a8ebbe-2241-8245-789d-6468bb53d912', 'securitygroups_bugs', 'SecurityGroups', 'securitygroups', 'id', 'Bugs', 'bugs', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Bugs', 0, 0),
('d6bd624c-1664-74c7-1edd-6468bbd70442', 'jjwg_maps_created_by', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d6c2fa14-f3d5-4e20-1322-6468bb33b22f', 'aobh_businesshours_created_by', 'Users', 'users', 'id', 'AOBH_BusinessHours', 'aobh_businesshours', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d72a1c17-6f19-876a-617e-6468bbc51bfd', 'bug_tasks', 'Bugs', 'bugs', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('d7409c43-4599-a6d5-9862-6468bb6b5ce6', 'jjwg_maps_assigned_user', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d7829894-01c2-a929-90ab-6468bbac3af7', 'bug_meetings', 'Bugs', 'bugs', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('d78deb34-ad01-e66a-9d32-6468bbfc509d', 'securitygroups_jjwg_maps', 'SecurityGroups', 'securitygroups', 'id', 'jjwg_Maps', 'jjwg_maps', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'jjwg_Maps', 0, 0),
('d7d8fba4-fbde-7512-60a0-6468bbc09bf8', 'jjwg_Maps_accounts', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Accounts', 'accounts', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('d7e41bab-6f8d-73b6-3e9b-6468bbf91623', 'bug_calls', 'Bugs', 'bugs', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('d824cb77-9558-ec5e-58bd-6468bb9a7609', 'jjwg_Maps_contacts', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Contacts', 'contacts', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('d83bd1cb-9af0-f7ac-8b03-6468bb67c68f', 'bug_emails', 'Bugs', 'bugs', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('d875d23b-e870-3e24-9177-6468bb6bac1c', 'jjwg_Maps_leads', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Leads', 'leads', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('d88bad2a-c5ce-8396-25a5-6468bbfa1597', 'bug_notes', 'Bugs', 'bugs', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('d8b7221f-481e-efbb-c91a-6468bb29790c', 'jjwg_Maps_opportunities', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Opportunities', 'opportunities', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('d8c9061d-02f6-e5bf-5f26-6468bbafdf48', 'aok_knowledge_base_categories_assigned_user', 'Users', 'users', 'id', 'AOK_Knowledge_Base_Categories', 'aok_knowledge_base_categories', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d8cc5a6a-8334-fb22-6eca-6468bb64ca08', 'bugs_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'found_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d8f6cf71-6d24-15a8-eb50-6468bb073b4b', 'jjwg_Maps_cases', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Cases', 'cases', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('d90b874f-b82f-a371-3daa-6468bbea6189', 'bugs_fixed_in_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'fixed_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d935aee7-623c-00ff-55e4-6468bb8b4120', 'jjwg_Maps_projects', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Project', 'project', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('d9736e88-c865-6c82-50c5-6468bb8a4241', 'jjwg_Maps_meetings', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Meetings', 'meetings', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Meetings', 0, 0),
('d9b04205-2672-2578-fffe-6468bba0586e', 'user_direct_reports', 'Users', 'users', 'id', 'Users', 'users', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d9b07ca9-7124-3d16-0372-6468bb6fc8d9', 'jjwg_Maps_prospects', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Prospects', 'prospects', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('da12ba8b-c290-ae90-f144-6468bb472211', 'users_email_addresses', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('da48033f-cffb-9485-c22e-6468bbce2b8b', 'campaigns_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('da64a7fa-3eef-034d-5848-6468bbab5c0f', 'users_email_addresses_primary', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('ddd3e39f-bdc2-892d-0c98-6468bb691cd6', 'sugarfeed_modified_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('de20702f-77b8-e78e-7484-6468bb07fd90', 'sugarfeed_created_by', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('de609bec-107a-f60b-81d7-6468bb196e2a', 'sugarfeed_assigned_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e0e08493-5d99-8188-c657-6468bb905417', 'jjwg_markers_modified_user', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e10c0240-a43d-1b40-99e4-6468bb485e95', 'securitygroups_campaigns', 'SecurityGroups', 'securitygroups', 'id', 'Campaigns', 'campaigns', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Campaigns', 0, 0),
('e134073b-401e-c550-3033-6468bb670880', 'jjwg_markers_created_by', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e17bf857-b6c5-2bf1-cdc6-6468bb204302', 'jjwg_markers_assigned_user', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e1892d91-0e45-02f0-1b5c-6468bb97a136', 'campaignlog_contact', 'CampaignLog', 'campaign_log', 'related_id', 'Contacts', 'contacts', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e1c9ad05-975b-f25c-ecfd-6468bb5522fe', 'securitygroups_jjwg_markers', 'SecurityGroups', 'securitygroups', 'id', 'jjwg_Markers', 'jjwg_markers', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'jjwg_Markers', 0, 0),
('e1e8195d-1cb9-bbeb-6413-6468bbf6deec', 'campaignlog_lead', 'CampaignLog', 'campaign_log', 'related_id', 'Leads', 'leads', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e22e0517-7459-a859-7c26-6468bb6d2036', 'campaignlog_created_opportunities', 'CampaignLog', 'campaign_log', 'related_id', 'Opportunities', 'opportunities', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e2810dff-7574-6361-1872-6468bb9dc9d1', 'campaignlog_targeted_users', 'CampaignLog', 'campaign_log', 'target_id', 'Users', 'users', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e2df8784-b6a1-762b-3f15-6468bb53ab8e', 'campaignlog_sent_emails', 'CampaignLog', 'campaign_log', 'related_id', 'Emails', 'emails', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e6128997-3446-25de-6e21-6468bb82deba', 'eapm_modified_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e69a0b45-4a64-e75b-14da-6468bbff2fa7', 'eapm_created_by', 'Users', 'users', 'id', 'EAPM', 'eapm', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e704f275-77b1-454e-a5f5-6468bb1af173', 'eapm_assigned_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e7bc008f-bae0-7e2e-ed91-6468bbd0843f', 'campaign_accounts', 'Campaigns', 'campaigns', 'id', 'Accounts', 'accounts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e8d5b975-f21b-f367-39e5-6468bba8b130', 'oauthkeys_modified_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauth_consumer', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e8ee9bc9-bfb5-e556-7439-6468bbb857f3', 'jjwg_areas_modified_user', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e93d8200-692f-fcf0-b3ce-6468bb598bf9', 'jjwg_areas_created_by', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e96eed85-8053-7f07-9fb1-6468bbd97ead', 'oauthkeys_created_by', 'Users', 'users', 'id', 'OAuthKeys', 'oauth_consumer', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e98c6415-43c2-ba49-353b-6468bb836f94', 'jjwg_areas_assigned_user', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e9d0a1fd-658b-547e-1601-6468bb6ffe73', 'securitygroups_jjwg_areas', 'SecurityGroups', 'securitygroups', 'id', 'jjwg_Areas', 'jjwg_areas', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'jjwg_Areas', 0, 0),
('ea01af4e-606c-1b26-d077-6468bb4391f0', 'oauthkeys_assigned_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauth_consumer', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ea070492-5a02-8622-0014-6468bbdea0bc', 'outbound_email_modified_user', 'Users', 'users', 'id', 'OutboundEmailAccounts', 'outbound_email', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ea1ea06d-f1b4-8839-fd81-6468bbc4f32e', 'securitygroups_project', 'SecurityGroups', 'securitygroups', 'id', 'Project', 'project', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Project', 0, 0),
('ea925681-e545-fc11-c5d2-6468bbfef46b', 'projects_notes', 'Project', 'project', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('ead9d0b4-4dc2-8e2e-b125-6468bb74de01', 'projects_tasks', 'Project', 'project', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('eb1e3208-07d6-f045-6c76-6468bb8ae35d', 'projects_meetings', 'Project', 'project', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('eb8557a8-d1b2-6680-c683-6468bb80b91a', 'projects_calls', 'Project', 'project', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('eba68e70-7c65-dfa6-b9cb-6468bb87fda7', 'consumer_tokens', 'OAuthKeys', 'oauth_consumer', 'id', 'OAuthTokens', 'oauth_tokens', 'consumer', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ebcde87d-a1e9-79f7-b571-6468bba8ef99', 'projects_emails', 'Project', 'project', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('ec133d07-e6d9-b00b-4c37-6468bb91a9d1', 'projects_project_tasks', 'Project', 'project', 'id', 'ProjectTask', 'project_task', 'project_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ec180eae-482e-73ad-c79f-6468bba800e2', 'oauthtokens_assigned_user', 'Users', 'users', 'id', 'OAuthTokens', 'oauth_tokens', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ec592ed2-8faf-a822-842f-6468bb4dfd7f', 'projects_assigned_user', 'Users', 'users', 'id', 'Project', 'project', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ec94710d-6002-f432-ac2e-6468bbd03e24', 'jjwg_address_cache_modified_user', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ecb6a9b8-5e4a-015f-02f1-6468bbd02033', 'projects_modified_user', 'Users', 'users', 'id', 'Project', 'project', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('eceebb24-4173-072e-fe25-6468bbc44287', 'jjwg_address_cache_created_by', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ed1547d0-89ba-8c37-1faf-6468bb0f3220', 'projects_created_by', 'Users', 'users', 'id', 'Project', 'project', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ed3e50ae-963c-35c8-3e70-6468bb6b2648', 'jjwg_address_cache_assigned_user', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('edf9083a-e7c8-a453-33cd-6468bbd81ffe', 'campaign_contacts', 'Campaigns', 'campaigns', 'id', 'Contacts', 'contacts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0);
INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('ef410204-c2ab-192f-5fdc-6468bbfb741f', 'outbound_email_created_by', 'Users', 'users', 'id', 'OutboundEmailAccounts', 'outbound_email', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f32f5355-0ad4-2f77-b8c4-6468bb65cd66', 'am_projecttemplates_modified_user', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f35605e3-4278-6ce7-12a7-6468bbc71b52', 'outbound_email_assigned_user', 'Users', 'users', 'id', 'OutboundEmailAccounts', 'outbound_email', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f38292db-dd5a-2b52-f5a7-6468bb8fc43d', 'am_projecttemplates_created_by', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f3c5e87e-3e55-3354-ab10-6468bb317a91', 'am_projecttemplates_assigned_user', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f3ec7fff-24ae-dbdd-6120-6468bb550b29', 'calls_reschedule_modified_user', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f3fa0ac7-c5df-1cea-e027-6468bb4dd419', 'campaign_leads', 'Campaigns', 'campaigns', 'id', 'Leads', 'leads', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('fb9d05b5-fc5d-18fd-2823-6468bb06c4ae', 'campaign_prospects', 'Campaigns', 'campaigns', 'id', 'Prospects', 'prospects', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `releases`
--

CREATE TABLE `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `popup` tinyint(1) DEFAULT NULL,
  `email` tinyint(1) DEFAULT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `timer_popup` varchar(32) DEFAULT NULL,
  `timer_email` varchar(32) DEFAULT NULL,
  `related_event_module` varchar(32) DEFAULT NULL,
  `related_event_module_id` char(36) NOT NULL,
  `date_willexecute` int(60) DEFAULT '-1',
  `popup_viewed` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reminders_invitees`
--

CREATE TABLE `reminders_invitees` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reminder_id` char(36) NOT NULL,
  `related_invitee_module` varchar(32) DEFAULT NULL,
  `related_invitee_module_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `modules` text,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_modules`
--

CREATE TABLE `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saved_search`
--

CREATE TABLE `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `saved_search`
--

INSERT INTO `saved_search` (`id`, `name`, `search_module`, `deleted`, `date_entered`, `date_modified`, `assigned_user_id`, `contents`, `description`) VALUES
('66699bd8-a24b-43e9-4d07-6466f2d9071e', 'today', 'Leads', 0, '2023-05-19 03:53:02', '2023-05-19 03:53:02', '1', 'YTo0MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxNToiYWR2YW5jZWRfc2VhcmNoIjtzOjU6InF1ZXJ5IjtzOjQ6InRydWUiO3M6MTY6InRvcGljX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE2OiJlbWFpbF9jX2FkdmFuY2VkIjtzOjA6IiI7czoyOToicHJpbWFyeV9hZGRyZXNzX2NpdHlfYWR2YW5jZWQiO3M6MDoiIjtzOjE3OiJzY2hvb2xfY19hZHZhbmNlZCI7czowOiIiO3M6MTY6ImNsYXNzX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjM0OiJkYXRlX2VudGVyZWRfYWR2YW5jZWRfcmFuZ2VfY2hvaWNlIjtzOjE6Ij0iO3M6Mjc6InJhbmdlX2RhdGVfZW50ZXJlZF9hZHZhbmNlZCI7czowOiIiO3M6MzM6InN0YXJ0X3JhbmdlX2RhdGVfZW50ZXJlZF9hZHZhbmNlZCI7czowOiIiO3M6MzE6ImVuZF9yYW5nZV9kYXRlX2VudGVyZWRfYWR2YW5jZWQiO3M6MDoiIjtzOjM3OiJzY2hlZHVsZV9kYXRlX2NfYWR2YW5jZWRfcmFuZ2VfY2hvaWNlIjtzOjE6Ij0iO3M6MzA6InJhbmdlX3NjaGVkdWxlX2RhdGVfY19hZHZhbmNlZCI7czoxMDoiMjAyMy0wNS0xOSI7czozNjoic3RhcnRfcmFuZ2Vfc2NoZWR1bGVfZGF0ZV9jX2FkdmFuY2VkIjtzOjA6IiI7czozNDoiZW5kX3JhbmdlX3NjaGVkdWxlX2RhdGVfY19hZHZhbmNlZCI7czowOiIiO3M6MjU6ImRhdGVfYWN0aXZhdGVkX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjI0OiJkYXRlX2Vucm9sbGVkX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE0OiJkdXBfY19hZHZhbmNlZCI7czowOiIiO3M6MTk6Imxhc3RfZHVwX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE5OiJmYWNlYm9va19jX2FkdmFuY2VkIjtzOjA6IiI7czoxODoiY29udmVydGVkX2FkdmFuY2VkIjtzOjA6IiI7czoyMDoiY29udGFjdGVkX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjEzOiJuZV9jX2FkdmFuY2VkIjtzOjA6IiI7czoyNjoibnVtYmVyX29mX2NhbGxzX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjIzOiJjb252ZXJ0X2RhdGVfY19hZHZhbmNlZCI7czowOiIiO3M6MzU6ImRhdGVfbW9kaWZpZWRfYWR2YW5jZWRfcmFuZ2VfY2hvaWNlIjtzOjE6Ij0iO3M6Mjg6InJhbmdlX2RhdGVfbW9kaWZpZWRfYWR2YW5jZWQiO3M6MDoiIjtzOjM0OiJzdGFydF9yYW5nZV9kYXRlX21vZGlmaWVkX2FkdmFuY2VkIjtzOjA6IiI7czozMjoiZW5kX3JhbmdlX2RhdGVfbW9kaWZpZWRfYWR2YW5jZWQiO3M6MDoiIjtzOjMxOiJiaXJ0aGRhdGVfYWR2YW5jZWRfcmFuZ2VfY2hvaWNlIjtzOjE6Ij0iO3M6MjQ6InJhbmdlX2JpcnRoZGF0ZV9hZHZhbmNlZCI7czowOiIiO3M6MzA6InN0YXJ0X3JhbmdlX2JpcnRoZGF0ZV9hZHZhbmNlZCI7czowOiIiO3M6Mjg6ImVuZF9yYW5nZV9iaXJ0aGRhdGVfYWR2YW5jZWQiO3M6MDoiIjtzOjE4OiJjb250ZW50X2NfYWR2YW5jZWQiO3M6MDoiIjtzOjEzOiJzZWFyY2hfbW9kdWxlIjtzOjU6IkxlYWRzIjtzOjE5OiJzYXZlZF9zZWFyY2hfYWN0aW9uIjtzOjQ6InNhdmUiO3M6MTQ6ImRpc3BsYXlDb2x1bW5zIjtzOjI1MDoiQVJFQV9DfFNPVVJDRV9DfFRPUElDX0N8RE9UX05IQVBfSE9DX0N8TEFTVF9OQU1FfFBIT05FX01PQklMRXxSQVRJTkdfQ3xTQ0hPT0xfQ3xBU1NJR05FRF9VU0VSX05BTUV8Q0FMTF9MT0dfQ3xMRUFEX1NPVVJDRXxTVEFUVVN8TlVNQkVSX09GX0NBTExTX0N8REFURV9FTlRFUkVEfERBVEVfTU9ESUZJRUR8QVNTRVNTT1JfQ3xEVVBfQ3xDUkVBVEVEX0JZX05BTUV8Q09OVkVSVEVEfEVYUEVDVEVEX01BSk9SXzJfQ3xORV9DfE5FV19EVVBfQyI7czo4OiJoaWRlVGFicyI7czozNDU6IlRJVExFfFJFRkVSRURfQll8RU1BSUwxfEFDQ09VTlRfTkFNRXxQSE9ORV9XT1JLfERFUEFSVE1FTlR8RE9fTk9UX0NBTEx8UEhPTkVfSE9NRXxQUklNQVJZX0FERFJFU1NfQ0lUWXxQSE9ORV9PVEhFUnxQSE9ORV9GQVh8UFJJTUFSWV9BRERSRVNTX0NPVU5UUll8UFJJTUFSWV9BRERSRVNTX1NUUkVFVHxQUklNQVJZX0FERFJFU1NfU1RBVEV8UFJJTUFSWV9BRERSRVNTX1BPU1RBTENPREV8QUxUX0FERFJFU1NfQ09VTlRSWXxBTFRfQUREUkVTU19TVFJFRVR8QUxUX0FERFJFU1NfQ0lUWXxBTFRfQUREUkVTU19TVEFURXxBTFRfQUREUkVTU19QT1NUQUxDT0RFfENSRUFURURfQll8TU9ESUZJRURfQllfTkFNRSI7czo3OiJvcmRlckJ5IjtzOjk6Ik5FV19EVVBfQyI7czo5OiJzb3J0T3JkZXIiO3M6MzoiQVNDIjtzOjg6ImFkdmFuY2VkIjtiOjE7fQ==', NULL),
('95f92a5c-c5d3-1d15-e7e4-646650c76e2b', 'today', 'Leads', 1, '2023-05-18 16:23:06', '2023-05-18 16:32:35', '', 'YTo0MDp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxNToiYWR2YW5jZWRfc2VhcmNoIjtzOjU6InF1ZXJ5IjtzOjQ6InRydWUiO3M6MTY6InRvcGljX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjIwOiJsZWFkX3NvdXJjZV9hZHZhbmNlZCI7YToxOntpOjA7czowOiIiO31zOjE1OiJzdGF0dXNfYWR2YW5jZWQiO2E6MTp7aTowO3M6MDoiIjt9czoxNjoiZW1haWxfY19hZHZhbmNlZCI7czowOiIiO3M6Mjk6InByaW1hcnlfYWRkcmVzc19jaXR5X2FkdmFuY2VkIjtzOjA6IiI7czoxNzoic2Nob29sX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE2OiJjbGFzc19jX2FkdmFuY2VkIjtzOjA6IiI7czozNDoiZGF0ZV9lbnRlcmVkX2FkdmFuY2VkX3JhbmdlX2Nob2ljZSI7czoxOiI9IjtzOjI3OiJyYW5nZV9kYXRlX2VudGVyZWRfYWR2YW5jZWQiO3M6MDoiIjtzOjMzOiJzdGFydF9yYW5nZV9kYXRlX2VudGVyZWRfYWR2YW5jZWQiO3M6MDoiIjtzOjMxOiJlbmRfcmFuZ2VfZGF0ZV9lbnRlcmVkX2FkdmFuY2VkIjtzOjA6IiI7czoyNDoic2NoZWR1bGVfZGF0ZV9jX2FkdmFuY2VkIjtzOjEwOiIxOC8wNS8yMDIzIjtzOjI1OiJkYXRlX2FjdGl2YXRlZF9jX2FkdmFuY2VkIjtzOjA6IiI7czoyNDoiZGF0ZV9lbnJvbGxlZF9jX2FkdmFuY2VkIjtzOjA6IiI7czoxNDoiZHVwX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE5OiJsYXN0X2R1cF9jX2FkdmFuY2VkIjtzOjA6IiI7czoxOToiZmFjZWJvb2tfY19hZHZhbmNlZCI7czowOiIiO3M6MTg6ImNvbnZlcnRlZF9hZHZhbmNlZCI7czowOiIiO3M6MjA6ImNvbnRhY3RlZF9jX2FkdmFuY2VkIjtzOjA6IiI7czoxMzoibmVfY19hZHZhbmNlZCI7czowOiIiO3M6MjY6Im51bWJlcl9vZl9jYWxsc19jX2FkdmFuY2VkIjtzOjA6IiI7czoyMzoiY29udmVydF9kYXRlX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjM1OiJkYXRlX21vZGlmaWVkX2FkdmFuY2VkX3JhbmdlX2Nob2ljZSI7czoxOiI9IjtzOjI4OiJyYW5nZV9kYXRlX21vZGlmaWVkX2FkdmFuY2VkIjtzOjA6IiI7czozNDoic3RhcnRfcmFuZ2VfZGF0ZV9tb2RpZmllZF9hZHZhbmNlZCI7czowOiIiO3M6MzI6ImVuZF9yYW5nZV9kYXRlX21vZGlmaWVkX2FkdmFuY2VkIjtzOjA6IiI7czozMToiYmlydGhkYXRlX2FkdmFuY2VkX3JhbmdlX2Nob2ljZSI7czoxOiI9IjtzOjI0OiJyYW5nZV9iaXJ0aGRhdGVfYWR2YW5jZWQiO3M6MDoiIjtzOjMwOiJzdGFydF9yYW5nZV9iaXJ0aGRhdGVfYWR2YW5jZWQiO3M6MDoiIjtzOjI4OiJlbmRfcmFuZ2VfYmlydGhkYXRlX2FkdmFuY2VkIjtzOjA6IiI7czoxODoiY29udGVudF9jX2FkdmFuY2VkIjtzOjA6IiI7czoxMzoic2VhcmNoX21vZHVsZSI7czo1OiJMZWFkcyI7czoxOToic2F2ZWRfc2VhcmNoX2FjdGlvbiI7czo0OiJzYXZlIjtzOjE0OiJkaXNwbGF5Q29sdW1ucyI7czoyNTA6IkFSRUFfQ3xTT1VSQ0VfQ3xUT1BJQ19DfERPVF9OSEFQX0hPQ19DfExBU1RfTkFNRXxQSE9ORV9NT0JJTEV8UkFUSU5HX0N8U0NIT09MX0N8QVNTSUdORURfVVNFUl9OQU1FfENBTExfTE9HX0N8TEVBRF9TT1VSQ0V8U1RBVFVTfE5VTUJFUl9PRl9DQUxMU19DfERBVEVfRU5URVJFRHxEQVRFX01PRElGSUVEfEFTU0VTU09SX0N8RFVQX0N8Q1JFQVRFRF9CWV9OQU1FfENPTlZFUlRFRHxFWFBFQ1RFRF9NQUpPUl8yX0N8TkVfQ3xORVdfRFVQX0MiO3M6ODoiaGlkZVRhYnMiO3M6MzQ1OiJUSVRMRXxSRUZFUkVEX0JZfEVNQUlMMXxBQ0NPVU5UX05BTUV8UEhPTkVfV09SS3xERVBBUlRNRU5UfERPX05PVF9DQUxMfFBIT05FX0hPTUV8UFJJTUFSWV9BRERSRVNTX0NJVFl8UEhPTkVfT1RIRVJ8UEhPTkVfRkFYfFBSSU1BUllfQUREUkVTU19DT1VOVFJZfFBSSU1BUllfQUREUkVTU19TVFJFRVR8UFJJTUFSWV9BRERSRVNTX1NUQVRFfFBSSU1BUllfQUREUkVTU19QT1NUQUxDT0RFfEFMVF9BRERSRVNTX0NPVU5UUll8QUxUX0FERFJFU1NfU1RSRUVUfEFMVF9BRERSRVNTX0NJVFl8QUxUX0FERFJFU1NfU1RBVEV8QUxUX0FERFJFU1NfUE9TVEFMQ09ERXxDUkVBVEVEX0JZfE1PRElGSUVEX0JZX05BTUUiO3M6Nzoib3JkZXJCeSI7czo5OiJORVdfRFVQX0MiO3M6OToic29ydE9yZGVyIjtzOjM6IkFTQyI7czo4OiJhZHZhbmNlZCI7YjoxO30=', NULL),
('c3c2e81d-df89-ea83-8b3d-64665326792c', 'today', 'Leads', 1, '2023-05-18 16:33:29', '2023-05-18 16:34:51', '', 'YTozODp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxNToiYWR2YW5jZWRfc2VhcmNoIjtzOjU6InF1ZXJ5IjtzOjQ6InRydWUiO3M6MTY6InRvcGljX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE2OiJlbWFpbF9jX2FkdmFuY2VkIjtzOjA6IiI7czoyOToicHJpbWFyeV9hZGRyZXNzX2NpdHlfYWR2YW5jZWQiO3M6MDoiIjtzOjE3OiJzY2hvb2xfY19hZHZhbmNlZCI7czowOiIiO3M6MTY6ImNsYXNzX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjM0OiJkYXRlX2VudGVyZWRfYWR2YW5jZWRfcmFuZ2VfY2hvaWNlIjtzOjE6Ij0iO3M6Mjc6InJhbmdlX2RhdGVfZW50ZXJlZF9hZHZhbmNlZCI7czowOiIiO3M6MzM6InN0YXJ0X3JhbmdlX2RhdGVfZW50ZXJlZF9hZHZhbmNlZCI7czowOiIiO3M6MzE6ImVuZF9yYW5nZV9kYXRlX2VudGVyZWRfYWR2YW5jZWQiO3M6MDoiIjtzOjI0OiJzY2hlZHVsZV9kYXRlX2NfYWR2YW5jZWQiO3M6MTA6IjE4LzA1LzIwMjMiO3M6MjU6ImRhdGVfYWN0aXZhdGVkX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjI0OiJkYXRlX2Vucm9sbGVkX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE0OiJkdXBfY19hZHZhbmNlZCI7czowOiIiO3M6MTk6Imxhc3RfZHVwX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE5OiJmYWNlYm9va19jX2FkdmFuY2VkIjtzOjA6IiI7czoxODoiY29udmVydGVkX2FkdmFuY2VkIjtzOjA6IiI7czoyMDoiY29udGFjdGVkX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjEzOiJuZV9jX2FkdmFuY2VkIjtzOjA6IiI7czoyNjoibnVtYmVyX29mX2NhbGxzX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjIzOiJjb252ZXJ0X2RhdGVfY19hZHZhbmNlZCI7czowOiIiO3M6MzU6ImRhdGVfbW9kaWZpZWRfYWR2YW5jZWRfcmFuZ2VfY2hvaWNlIjtzOjE6Ij0iO3M6Mjg6InJhbmdlX2RhdGVfbW9kaWZpZWRfYWR2YW5jZWQiO3M6MDoiIjtzOjM0OiJzdGFydF9yYW5nZV9kYXRlX21vZGlmaWVkX2FkdmFuY2VkIjtzOjA6IiI7czozMjoiZW5kX3JhbmdlX2RhdGVfbW9kaWZpZWRfYWR2YW5jZWQiO3M6MDoiIjtzOjMxOiJiaXJ0aGRhdGVfYWR2YW5jZWRfcmFuZ2VfY2hvaWNlIjtzOjE6Ij0iO3M6MjQ6InJhbmdlX2JpcnRoZGF0ZV9hZHZhbmNlZCI7czowOiIiO3M6MzA6InN0YXJ0X3JhbmdlX2JpcnRoZGF0ZV9hZHZhbmNlZCI7czowOiIiO3M6Mjg6ImVuZF9yYW5nZV9iaXJ0aGRhdGVfYWR2YW5jZWQiO3M6MDoiIjtzOjE4OiJjb250ZW50X2NfYWR2YW5jZWQiO3M6MDoiIjtzOjEzOiJzZWFyY2hfbW9kdWxlIjtzOjU6IkxlYWRzIjtzOjE5OiJzYXZlZF9zZWFyY2hfYWN0aW9uIjtzOjY6InVwZGF0ZSI7czoxNDoiZGlzcGxheUNvbHVtbnMiO3M6MjUwOiJBUkVBX0N8U09VUkNFX0N8VE9QSUNfQ3xET1RfTkhBUF9IT0NfQ3xMQVNUX05BTUV8UEhPTkVfTU9CSUxFfFJBVElOR19DfFNDSE9PTF9DfEFTU0lHTkVEX1VTRVJfTkFNRXxDQUxMX0xPR19DfExFQURfU09VUkNFfFNUQVRVU3xOVU1CRVJfT0ZfQ0FMTFNfQ3xEQVRFX0VOVEVSRUR8REFURV9NT0RJRklFRHxBU1NFU1NPUl9DfERVUF9DfENSRUFURURfQllfTkFNRXxDT05WRVJURUR8RVhQRUNURURfTUFKT1JfMl9DfE5FX0N8TkVXX0RVUF9DIjtzOjg6ImhpZGVUYWJzIjtzOjM0NToiVElUTEV8UkVGRVJFRF9CWXxFTUFJTDF8QUNDT1VOVF9OQU1FfFBIT05FX1dPUkt8REVQQVJUTUVOVHxET19OT1RfQ0FMTHxQSE9ORV9IT01FfFBSSU1BUllfQUREUkVTU19DSVRZfFBIT05FX09USEVSfFBIT05FX0ZBWHxQUklNQVJZX0FERFJFU1NfQ09VTlRSWXxQUklNQVJZX0FERFJFU1NfU1RSRUVUfFBSSU1BUllfQUREUkVTU19TVEFURXxQUklNQVJZX0FERFJFU1NfUE9TVEFMQ09ERXxBTFRfQUREUkVTU19DT1VOVFJZfEFMVF9BRERSRVNTX1NUUkVFVHxBTFRfQUREUkVTU19DSVRZfEFMVF9BRERSRVNTX1NUQVRFfEFMVF9BRERSRVNTX1BPU1RBTENPREV8Q1JFQVRFRF9CWXxNT0RJRklFRF9CWV9OQU1FIjtzOjc6Im9yZGVyQnkiO3M6OToiTkVXX0RVUF9DIjtzOjk6InNvcnRPcmRlciI7czozOiJBU0MiO3M6ODoiYWR2YW5jZWQiO2I6MTt9', NULL),
('c70010bb-d6ae-16a7-183f-6466531a51f5', 'today', 'Leads', 1, '2023-05-18 16:34:07', '2023-05-18 16:35:05', '', 'YTozODp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxNToiYWR2YW5jZWRfc2VhcmNoIjtzOjU6InF1ZXJ5IjtzOjQ6InRydWUiO3M6MTY6InRvcGljX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE2OiJlbWFpbF9jX2FkdmFuY2VkIjtzOjA6IiI7czoyOToicHJpbWFyeV9hZGRyZXNzX2NpdHlfYWR2YW5jZWQiO3M6MDoiIjtzOjE3OiJzY2hvb2xfY19hZHZhbmNlZCI7czowOiIiO3M6MTY6ImNsYXNzX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjM0OiJkYXRlX2VudGVyZWRfYWR2YW5jZWRfcmFuZ2VfY2hvaWNlIjtzOjE6Ij0iO3M6Mjc6InJhbmdlX2RhdGVfZW50ZXJlZF9hZHZhbmNlZCI7czowOiIiO3M6MzM6InN0YXJ0X3JhbmdlX2RhdGVfZW50ZXJlZF9hZHZhbmNlZCI7czowOiIiO3M6MzE6ImVuZF9yYW5nZV9kYXRlX2VudGVyZWRfYWR2YW5jZWQiO3M6MDoiIjtzOjI0OiJzY2hlZHVsZV9kYXRlX2NfYWR2YW5jZWQiO3M6MTA6IjE4LzA1LzIwMjMiO3M6MjU6ImRhdGVfYWN0aXZhdGVkX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjI0OiJkYXRlX2Vucm9sbGVkX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE0OiJkdXBfY19hZHZhbmNlZCI7czowOiIiO3M6MTk6Imxhc3RfZHVwX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE5OiJmYWNlYm9va19jX2FkdmFuY2VkIjtzOjA6IiI7czoxODoiY29udmVydGVkX2FkdmFuY2VkIjtzOjA6IiI7czoyMDoiY29udGFjdGVkX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjEzOiJuZV9jX2FkdmFuY2VkIjtzOjA6IiI7czoyNjoibnVtYmVyX29mX2NhbGxzX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjIzOiJjb252ZXJ0X2RhdGVfY19hZHZhbmNlZCI7czowOiIiO3M6MzU6ImRhdGVfbW9kaWZpZWRfYWR2YW5jZWRfcmFuZ2VfY2hvaWNlIjtzOjE6Ij0iO3M6Mjg6InJhbmdlX2RhdGVfbW9kaWZpZWRfYWR2YW5jZWQiO3M6MDoiIjtzOjM0OiJzdGFydF9yYW5nZV9kYXRlX21vZGlmaWVkX2FkdmFuY2VkIjtzOjA6IiI7czozMjoiZW5kX3JhbmdlX2RhdGVfbW9kaWZpZWRfYWR2YW5jZWQiO3M6MDoiIjtzOjMxOiJiaXJ0aGRhdGVfYWR2YW5jZWRfcmFuZ2VfY2hvaWNlIjtzOjE6Ij0iO3M6MjQ6InJhbmdlX2JpcnRoZGF0ZV9hZHZhbmNlZCI7czowOiIiO3M6MzA6InN0YXJ0X3JhbmdlX2JpcnRoZGF0ZV9hZHZhbmNlZCI7czowOiIiO3M6Mjg6ImVuZF9yYW5nZV9iaXJ0aGRhdGVfYWR2YW5jZWQiO3M6MDoiIjtzOjE4OiJjb250ZW50X2NfYWR2YW5jZWQiO3M6MDoiIjtzOjEzOiJzZWFyY2hfbW9kdWxlIjtzOjU6IkxlYWRzIjtzOjE5OiJzYXZlZF9zZWFyY2hfYWN0aW9uIjtzOjQ6InNhdmUiO3M6MTQ6ImRpc3BsYXlDb2x1bW5zIjtzOjI1MDoiQVJFQV9DfFNPVVJDRV9DfFRPUElDX0N8RE9UX05IQVBfSE9DX0N8TEFTVF9OQU1FfFBIT05FX01PQklMRXxSQVRJTkdfQ3xTQ0hPT0xfQ3xBU1NJR05FRF9VU0VSX05BTUV8Q0FMTF9MT0dfQ3xMRUFEX1NPVVJDRXxTVEFUVVN8TlVNQkVSX09GX0NBTExTX0N8REFURV9FTlRFUkVEfERBVEVfTU9ESUZJRUR8QVNTRVNTT1JfQ3xEVVBfQ3xDUkVBVEVEX0JZX05BTUV8Q09OVkVSVEVEfEVYUEVDVEVEX01BSk9SXzJfQ3xORV9DfE5FV19EVVBfQyI7czo4OiJoaWRlVGFicyI7czozNDU6IlRJVExFfFJFRkVSRURfQll8RU1BSUwxfEFDQ09VTlRfTkFNRXxQSE9ORV9XT1JLfERFUEFSVE1FTlR8RE9fTk9UX0NBTEx8UEhPTkVfSE9NRXxQUklNQVJZX0FERFJFU1NfQ0lUWXxQSE9ORV9PVEhFUnxQSE9ORV9GQVh8UFJJTUFSWV9BRERSRVNTX0NPVU5UUll8UFJJTUFSWV9BRERSRVNTX1NUUkVFVHxQUklNQVJZX0FERFJFU1NfU1RBVEV8UFJJTUFSWV9BRERSRVNTX1BPU1RBTENPREV8QUxUX0FERFJFU1NfQ09VTlRSWXxBTFRfQUREUkVTU19TVFJFRVR8QUxUX0FERFJFU1NfQ0lUWXxBTFRfQUREUkVTU19TVEFURXxBTFRfQUREUkVTU19QT1NUQUxDT0RFfENSRUFURURfQll8TU9ESUZJRURfQllfTkFNRSI7czo3OiJvcmRlckJ5IjtzOjk6Ik5FV19EVVBfQyI7czo5OiJzb3J0T3JkZXIiO3M6MzoiQVNDIjtzOjg6ImFkdmFuY2VkIjtiOjE7fQ==', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedulers`
--

CREATE TABLE `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedulers`
--

INSERT INTO `schedulers` (`id`, `deleted`, `date_entered`, `date_modified`, `created_by`, `modified_user_id`, `name`, `job`, `date_time_start`, `date_time_end`, `job_interval`, `time_from`, `time_to`, `last_run`, `status`, `catch_up`) VALUES
('9d533b57-537f-2254-0b65-6464cdce93ec', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Process Workflow Tasks', 'function::processAOW_Workflow', '2015-01-01 13:00:01', NULL, '*::*::*::*::*', NULL, NULL, NULL, 'Active', 1),
('a60637c2-8dd7-062a-7a28-6464cd6e3117', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Run Report Generation Scheduled Tasks', 'function::aorRunScheduledReports', '2015-01-01 16:45:01', NULL, '*::*::*::*::*', NULL, NULL, NULL, 'Active', 1),
('a8e0db49-29bf-2863-fce6-6464cdb6855b', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Prune Tracker Tables', 'function::trimTracker', '2015-01-01 16:45:01', NULL, '0::2::1::*::*', NULL, NULL, NULL, 'Active', 1),
('ab838594-6455-cc7a-ce23-6464cdd2a588', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Check Inbound Mailboxes', 'function::pollMonitoredInboxesAOP', '2015-01-01 13:45:01', NULL, '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('ae522633-b2c6-df38-1761-6464cd86ada8', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Run Nightly Process Bounced Campaign Emails', 'function::pollMonitoredInboxesForBouncedCampaignEmails', '2015-01-01 09:45:01', NULL, '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('b15521de-cff7-78c8-02a9-6464cd81ccea', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Run Nightly Mass Email Campaigns', 'function::runMassEmailCampaign', '2015-01-01 17:00:01', NULL, '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('b3d84b10-11bf-b3db-6b7a-6464cdacf8bb', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Prune Database on 1st of Month', 'function::pruneDatabase', '2015-01-01 15:15:01', NULL, '0::4::1::*::*', NULL, NULL, NULL, 'Inactive', 0),
('b6b47a86-4249-28e3-3782-6464cda4e352', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Perform Lucene Index', 'function::aodIndexUnindexed', '2015-01-01 10:45:01', NULL, '0::0::*::*::*', NULL, NULL, NULL, 'Active', 0),
('b9f6efbd-838c-d7a8-9b90-6464cdeba08f', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Optimise AOD Index', 'function::aodOptimiseIndex', '2015-01-01 10:45:01', NULL, '0::*/3::*::*::*', NULL, NULL, NULL, 'Active', 0),
('bddd0b1d-fa6e-a3f2-266c-6464cd45631b', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Run Email Reminder Notifications', 'function::sendEmailReminders', '2015-01-01 11:30:01', NULL, '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('c1dbd176-afae-d955-fb94-6464cd7e3848', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Clean Jobs Queue', 'function::cleanJobQueue', '2015-01-01 15:00:01', NULL, '0::5::*::*::*', NULL, NULL, NULL, 'Active', 0),
('c59d328d-b459-5224-b88f-6464cdf05d14', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Removal of documents from filesystem', 'function::removeDocumentsFromFS', '2015-01-01 14:00:01', NULL, '0::3::1::*::*', NULL, NULL, NULL, 'Active', 0),
('c9c3021e-1c3c-0586-ff9b-6464cda518cd', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Prune SuiteCRM Feed Tables', 'function::trimSugarFeeds', '2015-01-01 17:45:01', NULL, '0::2::1::*::*', NULL, NULL, NULL, 'Active', 1),
('ce00a68f-0b80-d672-e2d6-6464cdc12406', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '1', 'Google Calendar Sync', 'function::syncGoogleCalendar', '2015-01-01 14:00:01', NULL, '*/15::*::*::*::*', NULL, NULL, NULL, 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups`
--

CREATE TABLE `securitygroups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_acl_roles`
--

CREATE TABLE `securitygroups_acl_roles` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `role_id` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_audit`
--

CREATE TABLE `securitygroups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_default`
--

CREATE TABLE `securitygroups_default` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_records`
--

CREATE TABLE `securitygroups_records` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `record_id` char(36) DEFAULT NULL,
  `module` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_users`
--

CREATE TABLE `securitygroups_users` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `securitygroup_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `primary_group` tinyint(1) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spots`
--

CREATE TABLE `spots` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `config` longtext,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sugarfeed`
--

CREATE TABLE `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sugarfeed`
--

INSERT INTO `sugarfeed` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `related_module`, `related_id`, `link_url`, `link_type`) VALUES
('213c0eb2-5ef5-b1dc-4f4d-6464cfa17a45', '<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:3b640e05-181b-6b95-4d10-6464cf0e6382:\"default Name For Fpoly_leadimports]', '2023-05-17 12:59:02', '2023-05-17 12:59:02', '1', '1', NULL, 0, '1', 'Leads', '3b640e05-181b-6b95-4d10-6464cf0e6382', NULL, NULL),
('33dc3921-d73b-ac03-54c5-64674690e753', '<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_CONTACT} [Contacts:2b7e0b7b-329a-b160-2e0f-646746069aae: ]', '2023-05-19 09:49:50', '2023-05-19 09:49:50', '1', '1', NULL, 0, '1', 'Contacts', '2b7e0b7b-329a-b160-2e0f-646746069aae', NULL, NULL),
('3f84a477-c819-1342-6d63-6464cf2c50a0', '<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:3cae6e4f-bc4d-81df-c343-6464cfdf40e5:\"default Name For Fpoly_leadimports]', '2023-05-17 12:59:02', '2023-05-17 12:59:02', '1', '1', NULL, 0, '1', 'Leads', '3cae6e4f-bc4d-81df-c343-6464cfdf40e5', NULL, NULL),
('4ccd25b7-a008-86d5-c5f5-6464cfffcde2', '<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:4979b343-0026-d607-b17e-6464cf849a51:\"default Name For Fpoly_leadimports]', '2023-05-17 12:59:02', '2023-05-17 12:59:02', '1', '1', NULL, 0, '1', 'Leads', '4979b343-0026-d607-b17e-6464cf849a51', NULL, NULL),
('5a6fd3eb-1af7-43e6-61bf-6464cfa1c9aa', '<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:56e2e7d1-41b0-447d-4a8f-6464cfcf6d40:\"default Name For Fpoly_leadimports]', '2023-05-17 12:59:02', '2023-05-17 12:59:02', '1', '1', NULL, 0, '1', 'Leads', '56e2e7d1-41b0-447d-4a8f-6464cfcf6d40', NULL, NULL),
('68387610-9a29-7242-0d4c-6464cfd816a6', '<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:64c84905-c8ae-3003-df1e-6464cf070ce9:\"default Name For Fpoly_leadimports]', '2023-05-17 12:59:02', '2023-05-17 12:59:02', '1', '1', NULL, 0, '1', 'Leads', '64c84905-c8ae-3003-df1e-6464cf070ce9', NULL, NULL),
('a166e1ae-2da1-fccd-8148-6464ea4028ab', '<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_CONTACT} [Contacts:8f22ce18-1324-5913-4d45-6464ea27963f: ]', '2023-05-17 14:55:49', '2023-05-17 14:55:49', '501ca596-4cc7-9be3-cd73-6464e9a61d59', '501ca596-4cc7-9be3-cd73-6464e9a61d59', NULL, 0, '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'Contacts', '8f22ce18-1324-5913-4d45-6464ea27963f', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestionoptions`
--

CREATE TABLE `surveyquestionoptions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `sort_order` int(255) DEFAULT NULL,
  `survey_question_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestionoptions_audit`
--

CREATE TABLE `surveyquestionoptions_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestionoptions_surveyquestionresponses`
--

CREATE TABLE `surveyquestionoptions_surveyquestionresponses` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `surveyq72c7options_ida` varchar(36) DEFAULT NULL,
  `surveyq10d4sponses_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestionresponses`
--

CREATE TABLE `surveyquestionresponses` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `answer` text,
  `answer_bool` tinyint(1) DEFAULT NULL,
  `answer_datetime` datetime DEFAULT NULL,
  `surveyquestion_id` char(36) DEFAULT NULL,
  `surveyresponse_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestionresponses_audit`
--

CREATE TABLE `surveyquestionresponses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestions`
--

CREATE TABLE `surveyquestions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `sort_order` int(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `happiness_question` tinyint(1) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestions_audit`
--

CREATE TABLE `surveyquestions_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyresponses`
--

CREATE TABLE `surveyresponses` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `happiness` int(11) DEFAULT NULL,
  `email_response_sent` tinyint(1) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyresponses_audit`
--

CREATE TABLE `surveyresponses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE `surveys` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `submit_text` varchar(255) DEFAULT 'Submit',
  `satisfied_text` varchar(255) DEFAULT 'Satisfied',
  `neither_text` varchar(255) DEFAULT 'Neither Satisfied nor Dissatisfied',
  `dissatisfied_text` varchar(255) DEFAULT 'Dissatisfied'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveys_audit`
--

CREATE TABLE `surveys_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatesectionline`
--

CREATE TABLE `templatesectionline` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `thumbnail` varchar(255) DEFAULT NULL,
  `grp` varchar(255) DEFAULT NULL,
  `ord` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE `tracker` (
  `id` int(11) NOT NULL,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tracker`
--

INSERT INTO `tracker` (`id`, `monitor_id`, `user_id`, `module_name`, `item_id`, `item_summary`, `date_modified`, `action`, `session_id`, `visible`, `deleted`) VALUES
(2, '5bae2f84-9eb5-f928-6cac-6464ce147175', '1', 'fpoly_LeadImports', '846b0d90-ecf2-92c4-9870-6464cebf0d3b', 'Nguyễn Duy Quang Vinh', '2023-05-17 12:56:12', 'editview', 'tdkcn64s58rvlgskcpbjk72ois', 1, 0),
(22, '17570762-f298-fecb-33d0-6464e9ef9529', '1', 'Users', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'Quang Vinh', '2023-05-17 14:49:57', 'detailview', 'ac9d64g439tf30la3r14u43pft', 1, 0),
(40, '62054365-35a0-225a-bb73-6464ebdbf281', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'Accounts', '7bb3db6f-ec1c-2ee1-a967-6464eafcb4ba', 'Nguyễn Duy Quang Vinh', '2023-05-17 14:56:54', 'detailview', 'o1akklb5nuq7f0oki51pkdas75', 1, 0),
(41, '8c060fb1-81ba-8f44-0d6b-6464edcd74ed', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'Leads', '3b640e05-181b-6b95-4d10-6464cf0e6382', 'Nguyễn Duy Quang Vinh', '2023-05-17 15:06:42', 'detailview', 'o1akklb5nuq7f0oki51pkdas75', 1, 0),
(60, '37714696-051e-dd49-8482-6465d502d2f7', '1', 'Users', '1', 'Administrator', '2023-05-18 07:36:16', 'detailview', 'e5ekrvtr4blbf48qulv5qd8lf9', 1, 0),
(61, '85af51a7-88fd-d2c3-93db-6465d59603ee', '1', 'fpoly_LeadImports', '45385871-7e20-8347-50a4-6465d47e7eb6', 'Tét', '2023-05-18 07:36:18', 'detailview', 'e5ekrvtr4blbf48qulv5qd8lf9', 1, 0),
(72, 'aaa37056-b21c-01ec-e078-6465d823aa02', '1', 'Calls', '982e460f-0575-2c8e-61af-6465d73b40be', NULL, '2023-05-18 07:47:46', 'editview', 'e5ekrvtr4blbf48qulv5qd8lf9', 1, 0),
(84, '1d469e43-3199-7ef5-388e-64664f06da38', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'Leads', '64c84905-c8ae-3003-df1e-6464cf070ce9', 'Quang Vinh 2', '2023-05-18 16:16:11', 'detailview', 'citkiitnosb4lt570cbbtsi6ad', 1, 0),
(85, '4cbc1bcf-c60c-d21d-3e0f-646651b2bdd1', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'fpoly_LeadImports', '822d0e21-97ea-4da9-3bcc-646651f2cbf1', 'Vinh vjp pro', '2023-05-18 16:24:04', 'detailview', 'citkiitnosb4lt570cbbtsi6ad', 1, 0),
(102, '4fc80c48-d981-e091-f937-6467b270f932', '1', 'Leads', '56e2e7d1-41b0-447d-4a8f-6464cfcf6d40', '\"default Name For Fpoly_leadimports', '2023-05-19 17:31:13', 'detailview', 'vu2mg0a251r44bfbvl9t01u1k2', 1, 0),
(104, 'ada0a8c2-b0b3-e40b-3cdb-6467b31dc37d', '1', 'Leads', '64c84905-c8ae-3003-df1e-6464cf070ce9', 'Quang Vinh 2', '2023-05-19 17:35:47', 'detailview', 'vu2mg0a251r44bfbvl9t01u1k2', 1, 0),
(110, '14280343-745c-5d32-17ee-6468b441139a', '1', 'fpoly_LeadImports', '7f21dcd2-8a5d-ad82-728e-6464cfeb28ff', 'Sách hóa khỉ khổng lồ 2', '2023-05-20 11:53:20', 'detailview', 'livvkakcl07e4ijsh0u8kdnam7', 1, 0),
(119, '28274312-1041-f307-93fd-6468f1b06bf5', '1', 'Leads', '3b640e05-181b-6b95-4d10-6464cf0e6382', 'Nguyễn Duy Quang Vinh', '2023-05-20 16:10:40', 'detailview', 'jq5nja30n097vu0gl1tijebfo5', 1, 0),
(123, 'b741c075-797a-2c6c-5335-6468f86a8d9b', '1', 'Leads', '4979b343-0026-d607-b17e-6464cf849a51', '\"default Name For Fpoly_leadimports', '2023-05-20 16:41:21', 'detailview', 'h8g002raaj983v4pc6d6uom08d', 1, 0),
(127, 'da7c036b-4621-f691-6e2e-6469a28a02fb', '1', 'Leads', '3cae6e4f-bc4d-81df-c343-6464cfdf40e5', '\"default Name For Fpoly_leadimports', '2023-05-21 04:48:32', 'detailview', 'etmb59assoho1qchd3m6dlp7tk', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `upgrade_history`
--

CREATE TABLE `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `external_auth_only` tinyint(1) DEFAULT '0',
  `receive_notifications` tinyint(1) DEFAULT '1',
  `description` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT '0',
  `show_on_employees` tinyint(1) DEFAULT '1',
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  `factor_auth` tinyint(1) DEFAULT NULL,
  `factor_auth_interface` varchar(255) DEFAULT NULL,
  `asteriskintegration_show_notification` tinyint(1) DEFAULT '0',
  `asteriskintegration_server_ip` varchar(30) DEFAULT NULL,
  `asteriskintegration_extension` varchar(10) DEFAULT NULL,
  `asteriskintegration_context` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_hash`, `system_generated_password`, `pwd_last_changed`, `authenticate_id`, `sugar_login`, `first_name`, `last_name`, `is_admin`, `external_auth_only`, `receive_notifications`, `description`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `title`, `photo`, `department`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `status`, `address_street`, `address_city`, `address_state`, `address_country`, `address_postalcode`, `deleted`, `portal_only`, `show_on_employees`, `employee_status`, `messenger_id`, `messenger_type`, `reports_to_id`, `is_group`, `factor_auth`, `factor_auth_interface`, `asteriskintegration_show_notification`, `asteriskintegration_server_ip`, `asteriskintegration_extension`, `asteriskintegration_context`) VALUES
('1', 'vinhndq', '$2y$10$9H.5i08.3D/9LVw59RQxwe05aEMA6Zzf9JXcpPjWmmHl68euqMjaO', 0, NULL, NULL, 1, NULL, 'Administrator', 1, 0, 1, NULL, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', '', 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'Active', NULL, NULL, NULL, 0, NULL, NULL, 0, '', '', ''),
('501ca596-4cc7-9be3-cd73-6464e9a61d59', 'vinhndqph26105', '$2y$10$KWKvPFcsNsd8C9DJeFi5s.uimQPkmcL/fVSjUcfwvKs.FD080QYom', 0, '2023-05-17 14:49:57', NULL, 1, '', 'Quang Vinh', 0, 0, 1, '', '2023-05-17 14:49:57', '2023-05-17 14:49:57', '1', '1', '', '', '', '', '0968739042', '0968739042', '', '', 'Active', '', '', '', '', '', 0, 0, 1, 'Active', '', '', '', 0, NULL, NULL, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_feeds`
--

CREATE TABLE `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_last_import`
--

CREATE TABLE `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_last_import`
--

INSERT INTO `users_last_import` (`id`, `assigned_user_id`, `import_module`, `bean_type`, `bean_id`, `deleted`) VALUES
('3a651804-6f18-7055-83d7-6464cf3ea0f8', '1', 'Leads', 'Lead', '3b640e05-181b-6b95-4d10-6464cf0e6382', 0),
('46b90588-f9e9-2c45-d3a1-6464cfd80f0e', '1', 'Leads', 'Lead', '3cae6e4f-bc4d-81df-c343-6464cfdf40e5', 0),
('53dcf655-3196-8efa-18d5-6464cffc8e89', '1', 'Leads', 'Lead', '4979b343-0026-d607-b17e-6464cf849a51', 0),
('61f2c89e-4b8c-d2a7-5cec-6464cfba2e62', '1', 'Leads', 'Lead', '56e2e7d1-41b0-447d-4a8f-6464cfcf6d40', 0),
('6f10ae9a-f1bc-5916-e40d-6464cf811e94', '1', 'Leads', 'Lead', '64c84905-c8ae-3003-df1e-6464cf070ce9', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_password_link`
--

CREATE TABLE `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_signatures`
--

CREATE TABLE `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text,
  `signature_html` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `category`, `deleted`, `date_entered`, `date_modified`, `assigned_user_id`, `contents`) VALUES
('1f84eb88-ba85-6e62-98e8-6464cf445469', 'Import2_LEAD', 0, '2023-05-17 12:59:03', '2023-05-17 12:59:03', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('21180983-ba5e-7592-0678-6466483cd649', 'Employees2_EMPLOYEE', 0, '2023-05-18 15:45:03', '2023-05-18 15:45:03', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('27627f27-db28-8a4d-367a-64666863b58b', 'Leads', 0, '2023-05-18 18:04:01', '2023-05-18 18:04:01', '1', 'YToxOntzOjIyOiJMaXN0Vmlld0Rpc3BsYXlDb2x1bW5zIjthOjA6e319'),
('545e23e6-bb4f-7fb3-38b8-6464cefac7f2', 'Import2_FPOLY_LEADIMPORTS', 0, '2023-05-17 12:54:59', '2023-05-17 12:54:59', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('7c124adc-982a-47c6-492a-6464cfbcc9f4', 'Leads2_LEAD', 0, '2023-05-17 12:57:08', '2023-05-19 09:47:42', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czo5OiJuZXdfZHVwX2MiO3M6OToic29ydE9yZGVyIjtzOjQ6IkRFU0MiO319'),
('7c6d6107-f1e4-f893-4944-6464ea3c6194', 'Users2_USER', 0, '2023-05-17 14:53:03', '2023-05-17 14:53:03', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('82e2da21-0429-4267-3c19-6464e9df3838', 'global', 0, '2023-05-17 14:49:57', '2023-05-18 16:35:56', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'YTo0NTp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MDoiIjtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mjoib24iO3M6MTY6InN3YXBfbGFzdF92aWV3ZWQiO3M6MDoiIjtzOjE0OiJzd2FwX3Nob3J0Y3V0cyI7czowOiIiO3M6MTk6Im5hdmlnYXRpb25fcGFyYWRpZ20iO3M6MjoiZ20iO3M6MjA6InNvcnRfbW9kdWxlc19ieV9uYW1lIjtzOjA6IiI7czoxMzoic3VicGFuZWxfdGFicyI7czoyOiJvbiI7czoyNToiY291bnRfY29sbGFwc2VkX3N1YnBhbmVscyI7czowOiIiO3M6MTQ6Im1vZHVsZV9mYXZpY29uIjtzOjA6IiI7czo5OiJoaWRlX3RhYnMiO2E6MDp7fXM6MTE6InJlbW92ZV90YWJzIjthOjA6e31zOjc6Im5vX29wcHMiO3M6Mzoib2ZmIjtzOjEzOiJyZW1pbmRlcl90aW1lIjtpOjE4MDA7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7aTozNjAwO3M6MTY6InJlbWluZGVyX2NoZWNrZWQiO3M6MToiMCI7czoyMjoiZW1haWxfcmVtaW5kZXJfY2hlY2tlZCI7czoxOiIwIjtzOjg6InRpbWV6b25lIjtzOjE2OiJBc2lhL0hvX0NoaV9NaW5oIjtzOjI6InV0IjtpOjE7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJkL20vWSI7czo1OiJ0aW1lZiI7czo1OiJoOmkgQSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToibCBmIHMiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjU6InN1Z2FyIjtzOjExOiJlZGl0b3JfdHlwZSI7czo2OiJtb3phaWsiO3M6MTc6ImVtYWlsX3Nob3dfY291bnRzIjtpOjA7czo4OiJzdWJ0aGVtZSI7czo0OiJEYXduIjtzOjE1OiJsb2dpbmV4cGlyYXRpb24iO3M6MToiMCI7czo3OiJsb2Nrb3V0IjtzOjA6IiI7czoxMToibG9naW5mYWlsZWQiO3M6MToiMCI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVAiO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MzoiQWxsIjtzOjY6IkxlYWRzUSI7YTo0MTp7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6NjoiYWN0aW9uIjtzOjU6ImluZGV4IjtzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjE1OiJhZHZhbmNlZF9zZWFyY2giO3M6NToicXVlcnkiO3M6NDoidHJ1ZSI7czoxNjoidG9waWNfY19hZHZhbmNlZCI7czowOiIiO3M6MTY6ImVtYWlsX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjI5OiJwcmltYXJ5X2FkZHJlc3NfY2l0eV9hZHZhbmNlZCI7czowOiIiO3M6MTc6InNjaG9vbF9jX2FkdmFuY2VkIjtzOjA6IiI7czoxNjoiY2xhc3NfY19hZHZhbmNlZCI7czowOiIiO3M6MzQ6ImRhdGVfZW50ZXJlZF9hZHZhbmNlZF9yYW5nZV9jaG9pY2UiO3M6MToiPSI7czoyNzoicmFuZ2VfZGF0ZV9lbnRlcmVkX2FkdmFuY2VkIjtzOjA6IiI7czozMzoic3RhcnRfcmFuZ2VfZGF0ZV9lbnRlcmVkX2FkdmFuY2VkIjtzOjA6IiI7czozMToiZW5kX3JhbmdlX2RhdGVfZW50ZXJlZF9hZHZhbmNlZCI7czowOiIiO3M6MjQ6InNjaGVkdWxlX2RhdGVfY19hZHZhbmNlZCI7czoxMDoiMTgvMDUvMjAyMyI7czoyNToiZGF0ZV9hY3RpdmF0ZWRfY19hZHZhbmNlZCI7czowOiIiO3M6MjQ6ImRhdGVfZW5yb2xsZWRfY19hZHZhbmNlZCI7czowOiIiO3M6MTQ6ImR1cF9jX2FkdmFuY2VkIjtzOjA6IiI7czoxOToibGFzdF9kdXBfY19hZHZhbmNlZCI7czowOiIiO3M6MTk6ImZhY2Vib29rX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE4OiJjb252ZXJ0ZWRfYWR2YW5jZWQiO3M6MDoiIjtzOjIwOiJjb250YWN0ZWRfY19hZHZhbmNlZCI7czowOiIiO3M6MTM6Im5lX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjI2OiJudW1iZXJfb2ZfY2FsbHNfY19hZHZhbmNlZCI7czowOiIiO3M6MjM6ImNvbnZlcnRfZGF0ZV9jX2FkdmFuY2VkIjtzOjA6IiI7czozNToiZGF0ZV9tb2RpZmllZF9hZHZhbmNlZF9yYW5nZV9jaG9pY2UiO3M6MToiPSI7czoyODoicmFuZ2VfZGF0ZV9tb2RpZmllZF9hZHZhbmNlZCI7czowOiIiO3M6MzQ6InN0YXJ0X3JhbmdlX2RhdGVfbW9kaWZpZWRfYWR2YW5jZWQiO3M6MDoiIjtzOjMyOiJlbmRfcmFuZ2VfZGF0ZV9tb2RpZmllZF9hZHZhbmNlZCI7czowOiIiO3M6MzE6ImJpcnRoZGF0ZV9hZHZhbmNlZF9yYW5nZV9jaG9pY2UiO3M6MToiPSI7czoyNDoicmFuZ2VfYmlydGhkYXRlX2FkdmFuY2VkIjtzOjA6IiI7czozMDoic3RhcnRfcmFuZ2VfYmlydGhkYXRlX2FkdmFuY2VkIjtzOjA6IiI7czoyODoiZW5kX3JhbmdlX2JpcnRoZGF0ZV9hZHZhbmNlZCI7czowOiIiO3M6MTg6ImNvbnRlbnRfY19hZHZhbmNlZCI7czowOiIiO3M6MTc6InNhdmVkX3NlYXJjaF9uYW1lIjtzOjA6IiI7czoxMzoic2VhcmNoX21vZHVsZSI7czowOiIiO3M6MTk6InNhdmVkX3NlYXJjaF9hY3Rpb24iO3M6MDoiIjtzOjE0OiJkaXNwbGF5Q29sdW1ucyI7czoyNTA6IkFSRUFfQ3xTT1VSQ0VfQ3xUT1BJQ19DfERPVF9OSEFQX0hPQ19DfExBU1RfTkFNRXxQSE9ORV9NT0JJTEV8UkFUSU5HX0N8U0NIT09MX0N8QVNTSUdORURfVVNFUl9OQU1FfENBTExfTE9HX0N8TEVBRF9TT1VSQ0V8U1RBVFVTfE5VTUJFUl9PRl9DQUxMU19DfERBVEVfRU5URVJFRHxEQVRFX01PRElGSUVEfEFTU0VTU09SX0N8RFVQX0N8Q1JFQVRFRF9CWV9OQU1FfENPTlZFUlRFRHxFWFBFQ1RFRF9NQUpPUl8yX0N8TkVfQ3xORVdfRFVQX0MiO3M6ODoiaGlkZVRhYnMiO3M6MzQ1OiJUSVRMRXxSRUZFUkVEX0JZfEVNQUlMMXxBQ0NPVU5UX05BTUV8UEhPTkVfV09SS3xERVBBUlRNRU5UfERPX05PVF9DQUxMfFBIT05FX0hPTUV8UFJJTUFSWV9BRERSRVNTX0NJVFl8UEhPTkVfT1RIRVJ8UEhPTkVfRkFYfFBSSU1BUllfQUREUkVTU19DT1VOVFJZfFBSSU1BUllfQUREUkVTU19TVFJFRVR8UFJJTUFSWV9BRERSRVNTX1NUQVRFfFBSSU1BUllfQUREUkVTU19QT1NUQUxDT0RFfEFMVF9BRERSRVNTX0NPVU5UUll8QUxUX0FERFJFU1NfU1RSRUVUfEFMVF9BRERSRVNTX0NJVFl8QUxUX0FERFJFU1NfU1RBVEV8QUxUX0FERFJFU1NfUE9TVEFMQ09ERXxDUkVBVEVEX0JZfE1PRElGSUVEX0JZX05BTUUiO3M6Nzoib3JkZXJCeSI7czo5OiJORVdfRFVQX0MiO3M6OToic29ydE9yZGVyIjtzOjM6IkFTQyI7czo2OiJidXR0b24iO3M6NjoiU2VhcmNoIjt9czo2OiJVc2Vyc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxNToiYWR2YW5jZWRfc2VhcmNoIjt9czo5OiJBY2NvdW50c1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9czo5OiJNZWV0aW5nc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9czoxMDoiRW1wbG95ZWVzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO319'),
('840f505d-96fa-6539-7e99-6464e99238d8', 'Leads2_LEAD', 0, '2023-05-17 14:50:53', '2023-05-18 16:35:56', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czo5OiJuZXdfZHVwX2MiO3M6OToic29ydE9yZGVyIjtzOjM6IkFTQyI7fX0='),
('86b71a31-c734-5b74-76de-6464e9b2b517', 'GoogleSync', 0, '2023-05-17 14:49:57', '2023-05-17 14:49:57', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'YToxOntzOjg6InN5bmNHQ2FsIjtpOjA7fQ=='),
('8f6dfd9e-e873-8a4e-5701-6464cec304f7', 'import', 0, '2023-05-17 12:54:24', '2023-05-17 12:58:20', '1', 'YToxOntzOjEyOiJmaWVsZF92YWx1ZXMiO3M6NDQyOiJ7ImN1c3RvbV9kZWxpbWl0ZXIiOiIsIiwiY3VzdG9tX2VuY2xvc3VyZSI6IiYjMDM5OyIsImltcG9ydF90eXBlIjoiaW1wb3J0Iiwic291cmNlIjoiY3N2Iiwic291cmNlX2lkIjoiIiwiaW1wb3J0X21vZHVsZSI6IkxlYWRzIiwiaW1wb3J0bG9jYWxlX2NoYXJzZXQiOiJVVEYtOCIsImltcG9ydGxvY2FsZV9kYXRlZm9ybWF0IjoibVwvZFwvWSIsImltcG9ydGxvY2FsZV90aW1lZm9ybWF0IjoiSDppIiwiaW1wb3J0bG9jYWxlX3RpbWV6b25lIjoiVVRDIiwiaW1wb3J0bG9jYWxlX2N1cnJlbmN5IjoiLTk5IiwiaW1wb3J0bG9jYWxlX2RlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjoiMiIsImltcG9ydGxvY2FsZV9udW1fZ3JwX3NlcCI6IiwiLCJpbXBvcnRsb2NhbGVfZGVjX3NlcCI6Ii4iLCJkaXNwbGF5X3RhYnNfZGVmIjoiIiwiaGFzX2hlYWRlciI6Im9mZiJ9Ijt9'),
('90269db7-8672-e4e6-f765-6464e87af729', 'Users2_USER', 0, '2023-05-17 14:47:03', '2023-05-17 14:47:03', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('978ae981-d327-e6df-c322-6464cdea2736', 'global', 0, '2023-05-17 12:51:10', '2023-05-19 09:48:46', '1', 'YTozMTp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6IjhmYTgzMDdiLWFiY2ItNWNhMS1hM2UzLTY0NjRjZGI3YzNiNCI7czoxMjoibWFpbG1lcmdlX29uIjtzOjM6Im9mZiI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoyMDoic29ydF9tb2R1bGVzX2J5X25hbWUiO3M6MDoiIjtzOjEzOiJzdWJwYW5lbF90YWJzIjtzOjA6IiI7czoyNToiY291bnRfY29sbGFwc2VkX3N1YnBhbmVscyI7czowOiIiO3M6MTQ6Im1vZHVsZV9mYXZpY29uIjtzOjA6IiI7czo5OiJoaWRlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6ODoidGltZXpvbmUiO3M6MzoiVVRDIjtzOjI6InV0IjtzOjE6IjEiO3M6MTU6Im1haWxfc210cHNlcnZlciI7czowOiIiO3M6MTM6Im1haWxfc210cHBvcnQiO3M6MjoiMjUiO3M6MTM6Im1haWxfc210cHVzZXIiO3M6MDoiIjtzOjEzOiJtYWlsX3NtdHBwYXNzIjtzOjA6IiI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mzoib2ZmIjtzOjE3OiJtYWlsX3NtdHBhdXRoX3JlcSI7czoxOiIxIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MTtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MTA6InVzZXJfdGhlbWUiO3M6NjoiU3VpdGVQIjtzOjE5OiJ0aGVtZV9jdXJyZW50X2dyb3VwIjtzOjM6IkFsbCI7czoxODoiZnBvbHlfTGVhZEltcG9ydHNRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTU6ImFkdmFuY2VkX3NlYXJjaCI7fXM6NjoiTGVhZHNRIjthOjI6e3M6MTQ6ImRpc3BsYXlDb2x1bW5zIjtzOjI1MDoiQVJFQV9DfFNPVVJDRV9DfFRPUElDX0N8RE9UX05IQVBfSE9DX0N8TEFTVF9OQU1FfFBIT05FX01PQklMRXxSQVRJTkdfQ3xTQ0hPT0xfQ3xBU1NJR05FRF9VU0VSX05BTUV8Q0FMTF9MT0dfQ3xMRUFEX1NPVVJDRXxTVEFUVVN8TlVNQkVSX09GX0NBTExTX0N8REFURV9FTlRFUkVEfERBVEVfTU9ESUZJRUR8QVNTRVNTT1JfQ3xEVVBfQ3xDUkVBVEVEX0JZX05BTUV8Q09OVkVSVEVEfEVYUEVDVEVEX01BSk9SXzJfQ3xORV9DfE5FV19EVVBfQyI7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxNToiYWR2YW5jZWRfc2VhcmNoIjt9czo2OiJVc2Vyc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxNToiYWR2YW5jZWRfc2VhcmNoIjt9czoxMToiZWRpdG9yX3R5cGUiO3M6NjoibW96YWlrIjtzOjk6Ik1lZXRpbmdzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO31zOjEwOiJGUF9ldmVudHNRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTU6ImFkdmFuY2VkX3NlYXJjaCI7fXM6NjoiQ2FzZXNRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTI6ImJhc2ljX3NlYXJjaCI7fXM6OToiQWNjb3VudHNRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTI6ImJhc2ljX3NlYXJjaCI7fX0='),
('97c0d1b9-290c-b73d-5be1-646702d4b437', 'Cases2_CASE', 0, '2023-05-19 05:01:24', '2023-05-19 05:01:24', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('994049de-79f9-eecf-a988-6464cd884665', 'GoogleSync', 0, '2023-05-17 12:51:10', '2023-05-17 12:51:10', '1', 'YToxOntzOjg6InN5bmNHQ2FsIjtpOjA7fQ=='),
('b91057d6-90dc-4e5d-1491-6464cf8b8250', 'fpoly_LeadImports2_FPOLY_LEADIMPORTS', 0, '2023-05-17 12:56:59', '2023-05-17 12:56:59', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('bddc9c21-4760-486d-fcbf-6465d739e693', 'FP_events2_FP_EVENTS', 0, '2023-05-18 07:45:49', '2023-05-18 07:45:49', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('c1b1d7ef-0417-e641-51c7-64671f77348b', 'Accounts2_ACCOUNT', 0, '2023-05-19 07:04:54', '2023-05-19 07:04:54', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('c46085b2-a3bf-c0d7-4112-646650965b35', 'Leads', 0, '2023-05-18 16:20:39', '2023-05-18 16:20:39', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'YToxOntzOjIyOiJMaXN0Vmlld0Rpc3BsYXlDb2x1bW5zIjthOjA6e319'),
('d3230220-6928-a86b-1022-6464eb0a7bde', 'Accounts2_ACCOUNT', 0, '2023-05-17 14:56:01', '2023-05-17 14:56:01', '501ca596-4cc7-9be3-cd73-6464e9a61d59', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');

-- --------------------------------------------------------

--
-- Table structure for table `vcals`
--

CREATE TABLE `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vcals`
--

INSERT INTO `vcals` (`id`, `deleted`, `date_entered`, `date_modified`, `user_id`, `type`, `source`, `content`) VALUES
('30f679d7-02ab-c6e1-2d00-6465d7931790', 0, '2023-05-18 07:45:00', '2023-05-21 04:48:32', '1', 'vfb', 'sugar', 'BEGIN:VCALENDAR\r\nVERSION:2.0\r\nPRODID:-//SugarCRM//SugarCRM Calendar//EN\r\nBEGIN:VFREEBUSY\r\nORGANIZER;CN=Administrator:VFREEBUSY\r\nDTSTART:2023-05-20 00:00:00\r\nDTEND:2023-07-20 00:00:00\r\nFREEBUSY:20230520T160000Z/20230520T160000Z\r\nX-FREEBUSY-ID:5f02a914-4e38-1057-0030-6468eea4052f\r\nX-FREEBUSY-TYPE:Call\r\nFREEBUSY:20230520T164500Z/20230520T164500Z\r\nX-FREEBUSY-ID:3e6179ca-9a0c-8009-68e0-6468f89a8ebb\r\nX-FREEBUSY-TYPE:Call\r\nFREEBUSY:20230521T050000Z/20230521T050000Z\r\nX-FREEBUSY-ID:3c2d7684-62c8-9bd7-aada-6469a2d34493\r\nX-FREEBUSY-TYPE:Call\r\nFREEBUSY:20230520T050000Z/20230520T050000Z\r\nX-FREEBUSY-ID:17b5d0c6-b099-8612-727c-6469a2a6f932\r\nX-FREEBUSY-TYPE:Call\r\nFREEBUSY:20230520T161500Z/20230520T161500Z\r\nX-FREEBUSY-ID:5d19994b-35ce-98cd-921f-6468f0a4de99\r\nX-FREEBUSY-TYPE:Call\r\nDTSTAMP:2023-05-21 04:48:32\r\nEND:VFREEBUSY\r\nEND:VCALENDAR\r\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_accnt_id_del` (`id`,`deleted`),
  ADD KEY `idx_accnt_name_del` (`name`,`deleted`),
  ADD KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  ADD KEY `idx_accnt_parent_id` (`parent_id`);

--
-- Indexes for table `accounts_audit`
--
ALTER TABLE `accounts_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_accounts_parent_id` (`parent_id`);

--
-- Indexes for table `accounts_bugs`
--
ALTER TABLE `accounts_bugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_acc_bug_acc` (`account_id`),
  ADD KEY `idx_acc_bug_bug` (`bug_id`),
  ADD KEY `idx_account_bug` (`account_id`,`bug_id`);

--
-- Indexes for table `accounts_cases`
--
ALTER TABLE `accounts_cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_acc_case_acc` (`account_id`),
  ADD KEY `idx_acc_acc_case` (`case_id`);

--
-- Indexes for table `accounts_cases_1_c`
--
ALTER TABLE `accounts_cases_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_cases_1_ida1` (`accounts_cases_1accounts_ida`),
  ADD KEY `accounts_cases_1_idb2` (`accounts_cases_1cases_idb`);

--
-- Indexes for table `accounts_contacts`
--
ALTER TABLE `accounts_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_account_contact` (`account_id`,`contact_id`),
  ADD KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`);

--
-- Indexes for table `accounts_cstm`
--
ALTER TABLE `accounts_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `accounts_leads_1_c`
--
ALTER TABLE `accounts_leads_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_leads_1_ida1` (`accounts_leads_1accounts_ida`),
  ADD KEY `accounts_leads_1_idb2` (`accounts_leads_1leads_idb`);

--
-- Indexes for table `accounts_opportunities`
--
ALTER TABLE `accounts_opportunities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  ADD KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`);

--
-- Indexes for table `acl_actions`
--
ALTER TABLE `acl_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aclaction_id_del` (`id`,`deleted`),
  ADD KEY `idx_category_name` (`category`,`name`);

--
-- Indexes for table `acl_roles`
--
ALTER TABLE `acl_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aclrole_id_del` (`id`,`deleted`);

--
-- Indexes for table `acl_roles_actions`
--
ALTER TABLE `acl_roles_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_acl_role_id` (`role_id`),
  ADD KEY `idx_acl_action_id` (`action_id`),
  ADD KEY `idx_aclrole_action` (`role_id`,`action_id`);

--
-- Indexes for table `acl_roles_users`
--
ALTER TABLE `acl_roles_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aclrole_id` (`role_id`),
  ADD KEY `idx_acluser_id` (`user_id`),
  ADD KEY `idx_aclrole_user` (`role_id`,`user_id`);

--
-- Indexes for table `address_book`
--
ALTER TABLE `address_book`
  ADD KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`);

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `am_projecttemplates`
--
ALTER TABLE `am_projecttemplates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `am_projecttemplates_audit`
--
ALTER TABLE `am_projecttemplates_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_am_projecttemplates_parent_id` (`parent_id`);

--
-- Indexes for table `am_projecttemplates_contacts_1_c`
--
ALTER TABLE `am_projecttemplates_contacts_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `am_projecttemplates_contacts_1_alt` (`am_projecttemplates_ida`,`contacts_idb`);

--
-- Indexes for table `am_projecttemplates_project_1_c`
--
ALTER TABLE `am_projecttemplates_project_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `am_projecttemplates_project_1_ida1` (`am_projecttemplates_project_1am_projecttemplates_ida`),
  ADD KEY `am_projecttemplates_project_1_alt` (`am_projecttemplates_project_1project_idb`);

--
-- Indexes for table `am_projecttemplates_users_1_c`
--
ALTER TABLE `am_projecttemplates_users_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `am_projecttemplates_users_1_alt` (`am_projecttemplates_ida`,`users_idb`);

--
-- Indexes for table `am_tasktemplates`
--
ALTER TABLE `am_tasktemplates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `am_tasktemplates_am_projecttemplates_c`
--
ALTER TABLE `am_tasktemplates_am_projecttemplates_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `am_tasktemplates_am_projecttemplates_ida1` (`am_tasktemplates_am_projecttemplatesam_projecttemplates_ida`),
  ADD KEY `am_tasktemplates_am_projecttemplates_alt` (`am_tasktemplates_am_projecttemplatesam_tasktemplates_idb`);

--
-- Indexes for table `am_tasktemplates_audit`
--
ALTER TABLE `am_tasktemplates_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_am_tasktemplates_parent_id` (`parent_id`);

--
-- Indexes for table `analytic_reporting`
--
ALTER TABLE `analytic_reporting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aobh_businesshours`
--
ALTER TABLE `aobh_businesshours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aod_index`
--
ALTER TABLE `aod_index`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aod_indexevent`
--
ALTER TABLE `aod_indexevent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_record_module` (`record_module`),
  ADD KEY `idx_record_id` (`record_id`);

--
-- Indexes for table `aod_indexevent_audit`
--
ALTER TABLE `aod_indexevent_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aod_indexevent_parent_id` (`parent_id`);

--
-- Indexes for table `aod_index_audit`
--
ALTER TABLE `aod_index_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aod_index_parent_id` (`parent_id`);

--
-- Indexes for table `aok_knowledgebase`
--
ALTER TABLE `aok_knowledgebase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aok_knowledgebase_audit`
--
ALTER TABLE `aok_knowledgebase_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aok_knowledgebase_parent_id` (`parent_id`);

--
-- Indexes for table `aok_knowledgebase_categories`
--
ALTER TABLE `aok_knowledgebase_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aok_knowledgebase_categories_alt` (`aok_knowledgebase_id`,`aok_knowledge_base_categories_id`);

--
-- Indexes for table `aok_knowledge_base_categories`
--
ALTER TABLE `aok_knowledge_base_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aok_knowledge_base_categories_audit`
--
ALTER TABLE `aok_knowledge_base_categories_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aok_knowledge_base_categories_parent_id` (`parent_id`);

--
-- Indexes for table `aop_case_events`
--
ALTER TABLE `aop_case_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aop_case_events_audit`
--
ALTER TABLE `aop_case_events_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aop_case_events_parent_id` (`parent_id`);

--
-- Indexes for table `aop_case_updates`
--
ALTER TABLE `aop_case_updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aop_case_updates_audit`
--
ALTER TABLE `aop_case_updates_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aop_case_updates_parent_id` (`parent_id`);

--
-- Indexes for table `aor_charts`
--
ALTER TABLE `aor_charts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aor_conditions`
--
ALTER TABLE `aor_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aor_conditions_index_report_id` (`aor_report_id`);

--
-- Indexes for table `aor_fields`
--
ALTER TABLE `aor_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aor_fields_index_report_id` (`aor_report_id`);

--
-- Indexes for table `aor_reports`
--
ALTER TABLE `aor_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aor_reports_audit`
--
ALTER TABLE `aor_reports_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aor_reports_parent_id` (`parent_id`);

--
-- Indexes for table `aor_scheduled_reports`
--
ALTER TABLE `aor_scheduled_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_contracts`
--
ALTER TABLE `aos_contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_contracts_audit`
--
ALTER TABLE `aos_contracts_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_contracts_parent_id` (`parent_id`);

--
-- Indexes for table `aos_contracts_documents`
--
ALTER TABLE `aos_contracts_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aos_contracts_documents_alt` (`aos_contracts_id`,`documents_id`);

--
-- Indexes for table `aos_invoices`
--
ALTER TABLE `aos_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_invoices_audit`
--
ALTER TABLE `aos_invoices_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_invoices_parent_id` (`parent_id`);

--
-- Indexes for table `aos_line_item_groups`
--
ALTER TABLE `aos_line_item_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_line_item_groups_audit`
--
ALTER TABLE `aos_line_item_groups_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_line_item_groups_parent_id` (`parent_id`);

--
-- Indexes for table `aos_pdf_templates`
--
ALTER TABLE `aos_pdf_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_pdf_templates_audit`
--
ALTER TABLE `aos_pdf_templates_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_pdf_templates_parent_id` (`parent_id`);

--
-- Indexes for table `aos_products`
--
ALTER TABLE `aos_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_products_audit`
--
ALTER TABLE `aos_products_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_products_parent_id` (`parent_id`);

--
-- Indexes for table `aos_products_quotes`
--
ALTER TABLE `aos_products_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aospq_par_del` (`parent_id`,`parent_type`,`deleted`);

--
-- Indexes for table `aos_products_quotes_audit`
--
ALTER TABLE `aos_products_quotes_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_products_quotes_parent_id` (`parent_id`);

--
-- Indexes for table `aos_product_categories`
--
ALTER TABLE `aos_product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_product_categories_audit`
--
ALTER TABLE `aos_product_categories_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_product_categories_parent_id` (`parent_id`);

--
-- Indexes for table `aos_quotes`
--
ALTER TABLE `aos_quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_quotes_aos_invoices_c`
--
ALTER TABLE `aos_quotes_aos_invoices_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aos_quotes_aos_invoices_alt` (`aos_quotes77d9_quotes_ida`,`aos_quotes6b83nvoices_idb`);

--
-- Indexes for table `aos_quotes_audit`
--
ALTER TABLE `aos_quotes_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_quotes_parent_id` (`parent_id`);

--
-- Indexes for table `aos_quotes_os_contracts_c`
--
ALTER TABLE `aos_quotes_os_contracts_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aos_quotes_aos_contracts_alt` (`aos_quotese81e_quotes_ida`,`aos_quotes4dc0ntracts_idb`);

--
-- Indexes for table `aos_quotes_project_c`
--
ALTER TABLE `aos_quotes_project_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aos_quotes_project_alt` (`aos_quotes1112_quotes_ida`,`aos_quotes7207project_idb`);

--
-- Indexes for table `aow_actions`
--
ALTER TABLE `aow_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aow_action_index_workflow_id` (`aow_workflow_id`);

--
-- Indexes for table `aow_conditions`
--
ALTER TABLE `aow_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aow_conditions_index_workflow_id` (`aow_workflow_id`);

--
-- Indexes for table `aow_processed`
--
ALTER TABLE `aow_processed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aow_processed_index_workflow` (`aow_workflow_id`,`status`,`parent_id`,`deleted`),
  ADD KEY `aow_processed_index_status` (`status`),
  ADD KEY `aow_processed_index_workflow_id` (`aow_workflow_id`);

--
-- Indexes for table `aow_processed_aow_actions`
--
ALTER TABLE `aow_processed_aow_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aow_processed_aow_actions` (`aow_processed_id`,`aow_action_id`),
  ADD KEY `idx_actid_del_freid` (`aow_action_id`,`deleted`,`aow_processed_id`);

--
-- Indexes for table `aow_workflow`
--
ALTER TABLE `aow_workflow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aow_workflow_index_status` (`status`);

--
-- Indexes for table `aow_workflow_audit`
--
ALTER TABLE `aow_workflow_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aow_workflow_parent_id` (`parent_id`);

--
-- Indexes for table `asteriskintegration`
--
ALTER TABLE `asteriskintegration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asteriskintegration_accounts`
--
ALTER TABLE `asteriskintegration_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asteriskintegration_accounts_ida1` (`asteriskintegration_accountsaccounts_ida`),
  ADD KEY `asteriskintegration_accounts_alt` (`asteriskintegration_accountsasteriskintegration_idb`);

--
-- Indexes for table `asteriskintegration_contacts`
--
ALTER TABLE `asteriskintegration_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asteriskintegration_contacts_ida1` (`asteriskintegration_contactscontacts_ida`),
  ADD KEY `asteriskintegration_contacts_alt` (`asteriskintegration_contactsasteriskintegration_idb`);

--
-- Indexes for table `asteriskintegration_leads`
--
ALTER TABLE `asteriskintegration_leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asteriskintegration_leads_ida1` (`asteriskintegration_leadsleads_ida`),
  ADD KEY `asteriskintegration_leads_alt` (`asteriskintegration_leadsasteriskintegration_idb`);

--
-- Indexes for table `asteriskintegration_servers`
--
ALTER TABLE `asteriskintegration_servers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bugs`
--
ALTER TABLE `bugs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bugsnumk` (`bug_number`),
  ADD KEY `bug_number` (`bug_number`),
  ADD KEY `idx_bug_name` (`name`),
  ADD KEY `idx_bugs_assigned_user` (`assigned_user_id`);

--
-- Indexes for table `bugs_audit`
--
ALTER TABLE `bugs_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bugs_parent_id` (`parent_id`);

--
-- Indexes for table `calls`
--
ALTER TABLE `calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_call_name` (`name`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_calls_date_start` (`date_start`),
  ADD KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  ADD KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`);

--
-- Indexes for table `calls_contacts`
--
ALTER TABLE `calls_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_con_call_call` (`call_id`),
  ADD KEY `idx_con_call_con` (`contact_id`),
  ADD KEY `idx_call_contact` (`call_id`,`contact_id`);

--
-- Indexes for table `calls_leads`
--
ALTER TABLE `calls_leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lead_call_call` (`call_id`),
  ADD KEY `idx_lead_call_lead` (`lead_id`),
  ADD KEY `idx_call_lead` (`call_id`,`lead_id`);

--
-- Indexes for table `calls_reschedule`
--
ALTER TABLE `calls_reschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calls_reschedule_audit`
--
ALTER TABLE `calls_reschedule_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_calls_reschedule_parent_id` (`parent_id`);

--
-- Indexes for table `calls_users`
--
ALTER TABLE `calls_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usr_call_call` (`call_id`),
  ADD KEY `idx_usr_call_usr` (`user_id`),
  ADD KEY `idx_call_users` (`call_id`,`user_id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camp_auto_tracker_key` (`tracker_key`),
  ADD KEY `idx_campaign_name` (`name`),
  ADD KEY `idx_survey_id` (`survey_id`);

--
-- Indexes for table `campaigns_audit`
--
ALTER TABLE `campaigns_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_campaigns_parent_id` (`parent_id`);

--
-- Indexes for table `campaign_log`
--
ALTER TABLE `campaign_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_camp_tracker` (`target_tracker_key`),
  ADD KEY `idx_camp_campaign_id` (`campaign_id`),
  ADD KEY `idx_camp_more_info` (`more_information`),
  ADD KEY `idx_target_id` (`target_id`),
  ADD KEY `idx_target_id_deleted` (`target_id`,`deleted`);

--
-- Indexes for table `campaign_trkrs`
--
ALTER TABLE `campaign_trkrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_tracker_key_idx` (`tracker_key`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `casesnumk` (`case_number`),
  ADD KEY `case_number` (`case_number`),
  ADD KEY `idx_case_name` (`name`),
  ADD KEY `idx_account_id` (`account_id`),
  ADD KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`);

--
-- Indexes for table `cases_audit`
--
ALTER TABLE `cases_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cases_parent_id` (`parent_id`);

--
-- Indexes for table `cases_bugs`
--
ALTER TABLE `cases_bugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cas_bug_cas` (`case_id`),
  ADD KEY `idx_cas_bug_bug` (`bug_id`),
  ADD KEY `idx_case_bug` (`case_id`,`bug_id`);

--
-- Indexes for table `cases_cstm`
--
ALTER TABLE `cases_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD KEY `idx_config_cat` (`category`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  ADD KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  ADD KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  ADD KEY `idx_reports_to_id` (`reports_to_id`),
  ADD KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  ADD KEY `idx_cont_assigned` (`assigned_user_id`);

--
-- Indexes for table `contacts_audit`
--
ALTER TABLE `contacts_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_contacts_parent_id` (`parent_id`);

--
-- Indexes for table `contacts_bugs`
--
ALTER TABLE `contacts_bugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_con_bug_con` (`contact_id`),
  ADD KEY `idx_con_bug_bug` (`bug_id`),
  ADD KEY `idx_contact_bug` (`contact_id`,`bug_id`);

--
-- Indexes for table `contacts_cases`
--
ALTER TABLE `contacts_cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_con_case_con` (`contact_id`),
  ADD KEY `idx_con_case_case` (`case_id`),
  ADD KEY `idx_contacts_cases` (`contact_id`,`case_id`);

--
-- Indexes for table `contacts_cstm`
--
ALTER TABLE `contacts_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `contacts_users`
--
ALTER TABLE `contacts_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_con_users_con` (`contact_id`),
  ADD KEY `idx_con_users_user` (`user_id`),
  ADD KEY `idx_contacts_users` (`contact_id`,`user_id`);

--
-- Indexes for table `cron_remove_documents`
--
ALTER TABLE `cron_remove_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  ADD KEY `idx_cron_remove_document_stamp` (`date_modified`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_currency_name` (`name`,`deleted`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD KEY `idx_beanid_set_num` (`bean_id`,`set_num`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_doc_cat` (`category_id`,`subcategory_id`);

--
-- Indexes for table `documents_accounts`
--
ALTER TABLE `documents_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  ADD KEY `documents_accounts_document_id` (`document_id`,`account_id`);

--
-- Indexes for table `documents_bugs`
--
ALTER TABLE `documents_bugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  ADD KEY `documents_bugs_document_id` (`document_id`,`bug_id`);

--
-- Indexes for table `documents_cases`
--
ALTER TABLE `documents_cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_cases_case_id` (`case_id`,`document_id`),
  ADD KEY `documents_cases_document_id` (`document_id`,`case_id`);

--
-- Indexes for table `documents_contacts`
--
ALTER TABLE `documents_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  ADD KEY `documents_contacts_document_id` (`document_id`,`contact_id`);

--
-- Indexes for table `documents_opportunities`
--
ALTER TABLE `documents_opportunities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  ADD KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`);

--
-- Indexes for table `document_revisions`
--
ALTER TABLE `document_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentrevision_mimetype` (`file_mime_type`);

--
-- Indexes for table `eapm`
--
ALTER TABLE `eapm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`);

--
-- Indexes for table `emailman`
--
ALTER TABLE `emailman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  ADD KEY `idx_eman_campaign_id` (`campaign_id`),
  ADD KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email_name` (`name`),
  ADD KEY `idx_message_id` (`message_id`),
  ADD KEY `idx_email_parent_id` (`parent_id`),
  ADD KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`),
  ADD KEY `idx_email_cat` (`category_id`);

--
-- Indexes for table `emails_beans`
--
ALTER TABLE `emails_beans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_emails_beans_bean_id` (`bean_id`),
  ADD KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`);

--
-- Indexes for table `emails_email_addr_rel`
--
ALTER TABLE `emails_email_addr_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  ADD KEY `idx_eearl_address_id` (`email_address_id`);

--
-- Indexes for table `emails_text`
--
ALTER TABLE `emails_text`
  ADD PRIMARY KEY (`email_id`),
  ADD KEY `emails_textfromaddr` (`from_addr`);

--
-- Indexes for table `email_addresses`
--
ALTER TABLE `email_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  ADD KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`);

--
-- Indexes for table `email_addresses_audit`
--
ALTER TABLE `email_addresses_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email_addresses_parent_id` (`parent_id`);

--
-- Indexes for table `email_addr_bean_rel`
--
ALTER TABLE `email_addr_bean_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email_address_id` (`email_address_id`),
  ADD KEY `idx_bean_id` (`bean_id`,`bean_module`);

--
-- Indexes for table `email_cache`
--
ALTER TABLE `email_cache`
  ADD KEY `idx_ie_id` (`ie_id`),
  ADD KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  ADD KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  ADD KEY `idx_mail_subj` (`subject`),
  ADD KEY `idx_mail_to` (`toaddr`);

--
-- Indexes for table `email_marketing`
--
ALTER TABLE `email_marketing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_emmkt_name` (`name`),
  ADD KEY `idx_emmkit_del` (`deleted`);

--
-- Indexes for table `email_marketing_prospect_lists`
--
ALTER TABLE `email_marketing_prospect_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email_template_name` (`name`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fields_meta_data`
--
ALTER TABLE `fields_meta_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_meta_id_del` (`id`,`deleted`),
  ADD KEY `idx_meta_cm_del` (`custom_module`,`deleted`);

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_folder` (`parent_folder`);

--
-- Indexes for table `folders_rel`
--
ALTER TABLE `folders_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  ADD KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`);

--
-- Indexes for table `folders_subscriptions`
--
ALTER TABLE `folders_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`);

--
-- Indexes for table `fpoly_leadimports`
--
ALTER TABLE `fpoly_leadimports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fpoly_leadimports_audit`
--
ALTER TABLE `fpoly_leadimports_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fpoly_leadimports_parent_id` (`parent_id`);

--
-- Indexes for table `fpoly_leadimports_leads_1_c`
--
ALTER TABLE `fpoly_leadimports_leads_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fpoly_leadimports_leads_1_alt` (`fpoly_leadimports_leads_1fpoly_leadimports_ida`,`fpoly_leadimports_leads_1leads_idb`);

--
-- Indexes for table `fpoly_schools`
--
ALTER TABLE `fpoly_schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fpoly_schools_audit`
--
ALTER TABLE `fpoly_schools_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fpoly_schools_parent_id` (`parent_id`);

--
-- Indexes for table `fp_events`
--
ALTER TABLE `fp_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fp_events_audit`
--
ALTER TABLE `fp_events_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fp_events_parent_id` (`parent_id`);

--
-- Indexes for table `fp_events_contacts_c`
--
ALTER TABLE `fp_events_contacts_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fp_events_contacts_alt` (`fp_events_contactsfp_events_ida`,`fp_events_contactscontacts_idb`);

--
-- Indexes for table `fp_events_fp_event_delegates_1_c`
--
ALTER TABLE `fp_events_fp_event_delegates_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fp_events_fp_event_delegates_1_ida1` (`fp_events_fp_event_delegates_1fp_events_ida`),
  ADD KEY `fp_events_fp_event_delegates_1_alt` (`fp_events_fp_event_delegates_1fp_event_delegates_idb`);

--
-- Indexes for table `fp_events_fp_event_locations_1_c`
--
ALTER TABLE `fp_events_fp_event_locations_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fp_events_fp_event_locations_1_alt` (`fp_events_fp_event_locations_1fp_events_ida`,`fp_events_fp_event_locations_1fp_event_locations_idb`);

--
-- Indexes for table `fp_events_leads_1_c`
--
ALTER TABLE `fp_events_leads_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fp_events_leads_1_alt` (`fp_events_leads_1fp_events_ida`,`fp_events_leads_1leads_idb`);

--
-- Indexes for table `fp_events_prospects_1_c`
--
ALTER TABLE `fp_events_prospects_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fp_events_prospects_1_alt` (`fp_events_prospects_1fp_events_ida`,`fp_events_prospects_1prospects_idb`);

--
-- Indexes for table `fp_event_locations`
--
ALTER TABLE `fp_event_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fp_event_locations_audit`
--
ALTER TABLE `fp_event_locations_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fp_event_locations_parent_id` (`parent_id`);

--
-- Indexes for table `fp_event_locations_fp_events_1_c`
--
ALTER TABLE `fp_event_locations_fp_events_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fp_event_locations_fp_events_1_ida1` (`fp_event_locations_fp_events_1fp_event_locations_ida`),
  ADD KEY `fp_event_locations_fp_events_1_alt` (`fp_event_locations_fp_events_1fp_events_idb`);

--
-- Indexes for table `import_maps`
--
ALTER TABLE `import_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`);

--
-- Indexes for table `inbound_email`
--
ALTER TABLE `inbound_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inbound_email_autoreply`
--
ALTER TABLE `inbound_email_autoreply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ie_autoreplied_to` (`autoreplied_to`);

--
-- Indexes for table `inbound_email_cache_ts`
--
ALTER TABLE `inbound_email_cache_ts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jjwg_address_cache`
--
ALTER TABLE `jjwg_address_cache`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jjwg_address_cache_audit`
--
ALTER TABLE `jjwg_address_cache_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jjwg_address_cache_parent_id` (`parent_id`);

--
-- Indexes for table `jjwg_areas`
--
ALTER TABLE `jjwg_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jjwg_areas_audit`
--
ALTER TABLE `jjwg_areas_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jjwg_areas_parent_id` (`parent_id`);

--
-- Indexes for table `jjwg_maps`
--
ALTER TABLE `jjwg_maps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jjwg_maps_audit`
--
ALTER TABLE `jjwg_maps_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jjwg_maps_parent_id` (`parent_id`);

--
-- Indexes for table `jjwg_maps_jjwg_areas_c`
--
ALTER TABLE `jjwg_maps_jjwg_areas_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jjwg_maps_jjwg_areas_alt` (`jjwg_maps_5304wg_maps_ida`,`jjwg_maps_41f2g_areas_idb`);

--
-- Indexes for table `jjwg_maps_jjwg_markers_c`
--
ALTER TABLE `jjwg_maps_jjwg_markers_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jjwg_maps_jjwg_markers_alt` (`jjwg_maps_b229wg_maps_ida`,`jjwg_maps_2e31markers_idb`);

--
-- Indexes for table `jjwg_markers`
--
ALTER TABLE `jjwg_markers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jjwg_markers_audit`
--
ALTER TABLE `jjwg_markers_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jjwg_markers_parent_id` (`parent_id`);

--
-- Indexes for table `job_queue`
--
ALTER TABLE `job_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  ADD KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  ADD KEY `idx_status_entered` (`status`,`date_entered`),
  ADD KEY `idx_status_modified` (`status`,`date_modified`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  ADD KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  ADD KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  ADD KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  ADD KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  ADD KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  ADD KEY `idx_lead_assigned` (`assigned_user_id`),
  ADD KEY `idx_lead_contact` (`contact_id`),
  ADD KEY `idx_reports_to` (`reports_to_id`),
  ADD KEY `idx_lead_phone_work` (`phone_work`),
  ADD KEY `idx_leads_id_del` (`id`,`deleted`);

--
-- Indexes for table `leads_accounts_1_c`
--
ALTER TABLE `leads_accounts_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_accounts_1_alt` (`leads_accounts_1leads_ida`,`leads_accounts_1accounts_idb`);

--
-- Indexes for table `leads_audit`
--
ALTER TABLE `leads_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_leads_parent_id` (`parent_id`);

--
-- Indexes for table `leads_cstm`
--
ALTER TABLE `leads_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `leads_opportunities_1_c`
--
ALTER TABLE `leads_opportunities_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_opportunities_1_alt` (`leads_opportunities_1leads_ida`,`leads_opportunities_1opportunities_idb`);

--
-- Indexes for table `linked_documents`
--
ALTER TABLE `linked_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mtg_name` (`name`),
  ADD KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  ADD KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  ADD KEY `idx_meet_date_start` (`date_start`);

--
-- Indexes for table `meetings_contacts`
--
ALTER TABLE `meetings_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_con_mtg_mtg` (`meeting_id`),
  ADD KEY `idx_con_mtg_con` (`contact_id`),
  ADD KEY `idx_meeting_contact` (`meeting_id`,`contact_id`);

--
-- Indexes for table `meetings_cstm`
--
ALTER TABLE `meetings_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `meetings_leads`
--
ALTER TABLE `meetings_leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lead_meeting_meeting` (`meeting_id`),
  ADD KEY `idx_lead_meeting_lead` (`lead_id`),
  ADD KEY `idx_meeting_lead` (`meeting_id`,`lead_id`);

--
-- Indexes for table `meetings_users`
--
ALTER TABLE `meetings_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usr_mtg_mtg` (`meeting_id`),
  ADD KEY `idx_usr_mtg_usr` (`user_id`),
  ADD KEY `idx_meeting_users` (`meeting_id`,`user_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_note_name` (`name`),
  ADD KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  ADD KEY `idx_note_contact` (`contact_id`),
  ADD KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`);

--
-- Indexes for table `oauth2clients`
--
ALTER TABLE `oauth2clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth2tokens`
--
ALTER TABLE `oauth2tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_consumer`
--
ALTER TABLE `oauth_consumer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ckey` (`c_key`);

--
-- Indexes for table `oauth_nonce`
--
ALTER TABLE `oauth_nonce`
  ADD PRIMARY KEY (`conskey`,`nonce`),
  ADD KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`);

--
-- Indexes for table `oauth_tokens`
--
ALTER TABLE `oauth_tokens`
  ADD PRIMARY KEY (`id`,`deleted`),
  ADD KEY `oauth_state_ts` (`tstate`,`token_ts`),
  ADD KEY `constoken_key` (`consumer`);

--
-- Indexes for table `opportunities`
--
ALTER TABLE `opportunities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_opp_name` (`name`),
  ADD KEY `idx_opp_assigned` (`assigned_user_id`),
  ADD KEY `idx_opp_id_deleted` (`id`,`deleted`);

--
-- Indexes for table `opportunities_audit`
--
ALTER TABLE `opportunities_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_opportunities_parent_id` (`parent_id`);

--
-- Indexes for table `opportunities_contacts`
--
ALTER TABLE `opportunities_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_con_opp_con` (`contact_id`),
  ADD KEY `idx_con_opp_opp` (`opportunity_id`),
  ADD KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`);

--
-- Indexes for table `opportunities_cstm`
--
ALTER TABLE `opportunities_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `opportunities_leads_1_c`
--
ALTER TABLE `opportunities_leads_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opportunities_leads_1_ida1` (`opportunities_leads_1opportunities_ida`),
  ADD KEY `opportunities_leads_1_alt` (`opportunities_leads_1leads_idb`);

--
-- Indexes for table `outbound_email`
--
ALTER TABLE `outbound_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outbound_email_audit`
--
ALTER TABLE `outbound_email_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_outbound_email_parent_id` (`parent_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects_accounts`
--
ALTER TABLE `projects_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proj_acct_proj` (`project_id`),
  ADD KEY `idx_proj_acct_acct` (`account_id`),
  ADD KEY `projects_accounts_alt` (`project_id`,`account_id`);

--
-- Indexes for table `projects_bugs`
--
ALTER TABLE `projects_bugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proj_bug_proj` (`project_id`),
  ADD KEY `idx_proj_bug_bug` (`bug_id`),
  ADD KEY `projects_bugs_alt` (`project_id`,`bug_id`);

--
-- Indexes for table `projects_cases`
--
ALTER TABLE `projects_cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proj_case_proj` (`project_id`),
  ADD KEY `idx_proj_case_case` (`case_id`),
  ADD KEY `projects_cases_alt` (`project_id`,`case_id`);

--
-- Indexes for table `projects_contacts`
--
ALTER TABLE `projects_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proj_con_proj` (`project_id`),
  ADD KEY `idx_proj_con_con` (`contact_id`),
  ADD KEY `projects_contacts_alt` (`project_id`,`contact_id`);

--
-- Indexes for table `projects_opportunities`
--
ALTER TABLE `projects_opportunities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proj_opp_proj` (`project_id`),
  ADD KEY `idx_proj_opp_opp` (`opportunity_id`),
  ADD KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`);

--
-- Indexes for table `projects_products`
--
ALTER TABLE `projects_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proj_prod_project` (`project_id`),
  ADD KEY `idx_proj_prod_product` (`product_id`),
  ADD KEY `projects_products_alt` (`project_id`,`product_id`);

--
-- Indexes for table `project_contacts_1_c`
--
ALTER TABLE `project_contacts_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_contacts_1_alt` (`project_contacts_1project_ida`,`project_contacts_1contacts_idb`);

--
-- Indexes for table `project_cstm`
--
ALTER TABLE `project_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `project_task`
--
ALTER TABLE `project_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_task_audit`
--
ALTER TABLE `project_task_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_project_task_parent_id` (`parent_id`);

--
-- Indexes for table `project_users_1_c`
--
ALTER TABLE `project_users_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_users_1_alt` (`project_users_1project_ida`,`project_users_1users_idb`);

--
-- Indexes for table `prospects`
--
ALTER TABLE `prospects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prospect_auto_tracker_key` (`tracker_key`),
  ADD KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  ADD KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  ADD KEY `idx_prospects_id_del` (`id`,`deleted`),
  ADD KEY `idx_prospects_assigned` (`assigned_user_id`);

--
-- Indexes for table `prospects_cstm`
--
ALTER TABLE `prospects_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `prospect_lists`
--
ALTER TABLE `prospect_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_prospect_list_name` (`name`);

--
-- Indexes for table `prospect_lists_prospects`
--
ALTER TABLE `prospect_lists_prospects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_plp_pro_id` (`prospect_list_id`),
  ADD KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`);

--
-- Indexes for table `prospect_list_campaigns`
--
ALTER TABLE `prospect_list_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pro_id` (`prospect_list_id`),
  ADD KEY `idx_cam_id` (`campaign_id`),
  ADD KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`);

--
-- Indexes for table `relationships`
--
ALTER TABLE `relationships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rel_name` (`relationship_name`);

--
-- Indexes for table `releases`
--
ALTER TABLE `releases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_releases` (`name`,`deleted`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reminder_name` (`name`),
  ADD KEY `idx_reminder_deleted` (`deleted`),
  ADD KEY `idx_reminder_related_event_module` (`related_event_module`),
  ADD KEY `idx_reminder_related_event_module_id` (`related_event_module_id`);

--
-- Indexes for table `reminders_invitees`
--
ALTER TABLE `reminders_invitees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reminder_invitee_name` (`name`),
  ADD KEY `idx_reminder_invitee_assigned_user_id` (`assigned_user_id`),
  ADD KEY `idx_reminder_invitee_reminder_id` (`reminder_id`),
  ADD KEY `idx_reminder_invitee_related_invitee_module` (`related_invitee_module`),
  ADD KEY `idx_reminder_invitee_related_invitee_module_id` (`related_invitee_module_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_role_id_del` (`id`,`deleted`);

--
-- Indexes for table `roles_modules`
--
ALTER TABLE `roles_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_role_id` (`role_id`),
  ADD KEY `idx_module_id` (`module_id`);

--
-- Indexes for table `roles_users`
--
ALTER TABLE `roles_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ru_role_id` (`role_id`),
  ADD KEY `idx_ru_user_id` (`user_id`);

--
-- Indexes for table `saved_search`
--
ALTER TABLE `saved_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_desc` (`name`,`deleted`);

--
-- Indexes for table `schedulers`
--
ALTER TABLE `schedulers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_schedule` (`date_time_start`,`deleted`);

--
-- Indexes for table `securitygroups`
--
ALTER TABLE `securitygroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `securitygroups_acl_roles`
--
ALTER TABLE `securitygroups_acl_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `securitygroups_audit`
--
ALTER TABLE `securitygroups_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_securitygroups_parent_id` (`parent_id`);

--
-- Indexes for table `securitygroups_default`
--
ALTER TABLE `securitygroups_default`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `securitygroups_records`
--
ALTER TABLE `securitygroups_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_securitygroups_records_mod` (`module`,`deleted`,`record_id`,`securitygroup_id`),
  ADD KEY `idx_securitygroups_records_del` (`deleted`,`record_id`,`module`,`securitygroup_id`);

--
-- Indexes for table `securitygroups_users`
--
ALTER TABLE `securitygroups_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `securitygroups_users_idxa` (`securitygroup_id`),
  ADD KEY `securitygroups_users_idxb` (`user_id`),
  ADD KEY `securitygroups_users_idxc` (`user_id`,`deleted`,`securitygroup_id`,`id`),
  ADD KEY `securitygroups_users_idxd` (`user_id`,`deleted`,`securitygroup_id`);

--
-- Indexes for table `spots`
--
ALTER TABLE `spots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sugarfeed`
--
ALTER TABLE `sugarfeed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sgrfeed_date` (`date_entered`,`deleted`);

--
-- Indexes for table `surveyquestionoptions`
--
ALTER TABLE `surveyquestionoptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveyquestionoptions_audit`
--
ALTER TABLE `surveyquestionoptions_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_surveyquestionoptions_parent_id` (`parent_id`);

--
-- Indexes for table `surveyquestionoptions_surveyquestionresponses`
--
ALTER TABLE `surveyquestionoptions_surveyquestionresponses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surveyquestionoptions_surveyquestionresponses_alt` (`surveyq72c7options_ida`,`surveyq10d4sponses_idb`);

--
-- Indexes for table `surveyquestionresponses`
--
ALTER TABLE `surveyquestionresponses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveyquestionresponses_audit`
--
ALTER TABLE `surveyquestionresponses_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_surveyquestionresponses_parent_id` (`parent_id`);

--
-- Indexes for table `surveyquestions`
--
ALTER TABLE `surveyquestions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveyquestions_audit`
--
ALTER TABLE `surveyquestions_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_surveyquestions_parent_id` (`parent_id`);

--
-- Indexes for table `surveyresponses`
--
ALTER TABLE `surveyresponses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveyresponses_audit`
--
ALTER TABLE `surveyresponses_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_surveyresponses_parent_id` (`parent_id`);

--
-- Indexes for table `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveys_audit`
--
ALTER TABLE `surveys_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_surveys_parent_id` (`parent_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tsk_name` (`name`),
  ADD KEY `idx_task_con_del` (`contact_id`,`deleted`),
  ADD KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  ADD KEY `idx_task_assigned` (`assigned_user_id`),
  ADD KEY `idx_task_status` (`status`);

--
-- Indexes for table `templatesectionline`
--
ALTER TABLE `templatesectionline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tracker`
--
ALTER TABLE `tracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tracker_iid` (`item_id`),
  ADD KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  ADD KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  ADD KEY `idx_tracker_monitor_id` (`monitor_id`),
  ADD KEY `idx_tracker_date_modified` (`date_modified`);

--
-- Indexes for table `upgrade_history`
--
ALTER TABLE `upgrade_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`(30),`first_name`(30),`id`);

--
-- Indexes for table `users_feeds`
--
ALTER TABLE `users_feeds`
  ADD KEY `idx_ud_user_id` (`user_id`,`feed_id`);

--
-- Indexes for table `users_last_import`
--
ALTER TABLE `users_last_import`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`assigned_user_id`);

--
-- Indexes for table `users_password_link`
--
ALTER TABLE `users_password_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_username` (`username`);

--
-- Indexes for table `users_signatures`
--
ALTER TABLE `users_signatures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usersig_uid` (`user_id`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_userprefnamecat` (`assigned_user_id`,`category`);

--
-- Indexes for table `vcals`
--
ALTER TABLE `vcals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vcal` (`type`,`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asteriskintegration_servers`
--
ALTER TABLE `asteriskintegration_servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bugs`
--
ALTER TABLE `bugs`
  MODIFY `bug_number` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `tracker_key` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_trkrs`
--
ALTER TABLE `campaign_trkrs`
  MODIFY `tracker_key` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `case_number` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emailman`
--
ALTER TABLE `emailman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prospects`
--
ALTER TABLE `prospects`
  MODIFY `tracker_key` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tracker`
--
ALTER TABLE `tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
