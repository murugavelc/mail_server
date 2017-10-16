-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 22, 2017 at 02:38 PM
-- Server version: 5.5.30
-- PHP Version: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vekonect`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE IF NOT EXISTS `cache` (
  `user_id` int(10) unsigned NOT NULL,
  `cache_key` varchar(128) CHARACTER SET ascii NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`user_id`,`cache_key`),
  KEY `expires_index` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_index`
--

CREATE TABLE IF NOT EXISTS `cache_index` (
  `user_id` int(10) unsigned NOT NULL,
  `mailbox` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expires` datetime DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  PRIMARY KEY (`user_id`,`mailbox`),
  KEY `expires_index` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_messages`
--

CREATE TABLE IF NOT EXISTS `cache_messages` (
  `user_id` int(10) unsigned NOT NULL,
  `mailbox` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `expires` datetime DEFAULT NULL,
  `data` longtext NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`mailbox`,`uid`),
  KEY `expires_index` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_shared`
--

CREATE TABLE IF NOT EXISTS `cache_shared` (
  `cache_key` varchar(255) CHARACTER SET ascii NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`cache_key`),
  KEY `expires_index` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cache_thread`
--

CREATE TABLE IF NOT EXISTS `cache_thread` (
  `user_id` int(10) unsigned NOT NULL,
  `mailbox` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`user_id`,`mailbox`),
  KEY `expires_index` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contactgroupmembers`
--

CREATE TABLE IF NOT EXISTS `contactgroupmembers` (
  `contactgroup_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`contactgroup_id`,`contact_id`),
  KEY `contactgroupmembers_contact_index` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contactgroups`
--

CREATE TABLE IF NOT EXISTS `contactgroups` (
  `contactgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `changed` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`contactgroup_id`),
  KEY `contactgroups_user_index` (`user_id`,`del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changed` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `email` text NOT NULL,
  `firstname` varchar(128) NOT NULL DEFAULT '',
  `surname` varchar(128) NOT NULL DEFAULT '',
  `vcard` longtext,
  `words` text,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `user_contacts_index` (`user_id`,`del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dictionary`
--

CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `language` varchar(5) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueness` (`user_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `identities`
--

CREATE TABLE IF NOT EXISTS `identities` (
  `identity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `changed` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `standard` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `organization` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL,
  `reply-to` varchar(128) NOT NULL DEFAULT '',
  `bcc` varchar(128) NOT NULL DEFAULT '',
  `signature` longtext,
  `html_signature` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`identity_id`),
  KEY `user_identities_index` (`user_id`,`del`),
  KEY `email_identities_index` (`email`,`del`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `identities`
--

INSERT INTO `identities` (`identity_id`, `user_id`, `changed`, `del`, `standard`, `name`, `organization`, `email`, `reply-to`, `bcc`, `signature`, `html_signature`) VALUES
(1, 1, '2017-08-19 19:08:47', 0, 1, 'murugavel', '', 'murugavel@localhost', '', '', NULL, 0),
(2, 2, '2017-08-19 19:22:24', 0, 1, 'sathish', '', 'sathish@localhost', '', '', NULL, 0),
(3, 3, '2017-08-21 11:35:57', 0, 1, 'kabilan', '', 'kabilan@localhost', '', '', NULL, 0),
(4, 4, '2017-08-21 12:24:54', 0, 1, '', '', 'murugavel.kcmr@gmail.com', '', '', NULL, 0),
(5, 5, '2017-08-21 12:40:37', 0, 1, '', '', 'murugavel.jst@gmail.com', '', '', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE IF NOT EXISTS `searches` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` int(3) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `data` text,
  PRIMARY KEY (`search_id`),
  UNIQUE KEY `uniqueness` (`user_id`,`type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `sess_id` varchar(128) NOT NULL,
  `changed` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `ip` varchar(40) NOT NULL,
  `vars` mediumtext NOT NULL,
  PRIMARY KEY (`sess_id`),
  KEY `changed_index` (`changed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`sess_id`, `changed`, `ip`, `vars`) VALUES
('6s3cg869omov9mi2qdcvm6njh0', '2017-08-21 12:41:43', '127.0.0.1', 'bGFuZ3VhZ2V8czo1OiJlbl9VUyI7c2tpbnxzOjU6ImxhcnJ5IjtpbWFwX25hbWVzcGFjZXxhOjQ6e3M6ODoicGVyc29uYWwiO2E6MTp7aTowO2E6Mjp7aTowO3M6MDoiIjtpOjE7czoxOiIvIjt9fXM6NToib3RoZXIiO047czo2OiJzaGFyZWQiO047czoxMDoicHJlZml4X291dCI7czowOiIiO31pbWFwX2RlbGltaXRlcnxzOjE6Ii8iO3VzZXJfaWR8czoxOiI1Ijt1c2VybmFtZXxzOjIzOiJtdXJ1Z2F2ZWwuanN0QGdtYWlsLmNvbSI7c3RvcmFnZV9ob3N0fHM6MTQ6ImltYXAuZ21haWwuY29tIjtzdG9yYWdlX3BvcnR8aTo5OTM7c3RvcmFnZV9zc2x8czozOiJzc2wiO3Bhc3N3b3JkfHM6MzI6IkRhczVTSGtwTUU5aGZOQkpyM0xVbmtFYjczSXFPdjhNIjtsb2dpbl90aW1lfGk6MTUwMzI5OTQzNzt0aW1lem9uZXxzOjEyOiJBc2lhL0tvbGthdGEiO1NUT1JBR0VfU1BFQ0lBTC1VU0V8YjoxO2F1dGhfc2VjcmV0fHM6MjY6ImNWRFVCTjdheXZwNFBtYm8wUllNMjR0MjhVIjtyZXF1ZXN0X3Rva2VufHM6MzI6IjZUVkVhNFVyWVNuRlZDT2phWFdCMTJZUDc3Umduck5yIjt0YXNrfHM6NDoibWFpbCI7aW1hcF9ob3N0fHM6MTQ6ImltYXAuZ21haWwuY29tIjttYm94fHM6NToiSU5CT1giO3NvcnRfY29sfHM6MDoiIjtzb3J0X29yZGVyfHM6NDoiREVTQyI7U1RPUkFHRV9USFJFQUR8YjowO1NUT1JBR0VfUVVPVEF8YjoxO1NUT1JBR0VfTElTVC1FWFRFTkRFRHxiOjE7cXVvdGFfZGlzcGxheXxzOjQ6InRleHQiO2xpc3RfYXR0cmlifGE6NTp7czo0OiJuYW1lIjtzOjg6Im1lc3NhZ2VzIjtzOjI6ImlkIjtzOjExOiJtZXNzYWdlbGlzdCI7czo1OiJjbGFzcyI7czo0ODoicmVjb3Jkcy10YWJsZSBtZXNzYWdlbGlzdCBzb3J0aGVhZGVyIGZpeGVkaGVhZGVyIjtzOjE1OiJvcHRpb25zbWVudWljb24iO3M6NDoidHJ1ZSI7czoxNToiYXJpYS1sYWJlbGxlZGJ5IjtzOjIyOiJhcmlhLWxhYmVsLW1lc3NhZ2VsaXN0Ijt9cGFnZXxpOjE7dW5zZWVuX2NvdW50fGE6ODp7czo1OiJJTkJPWCI7aToxMDtzOjE0OiJbR21haWxdL0RyYWZ0cyI7aTowO3M6MTc6IltHbWFpbF0vU2VudCBNYWlsIjtpOjA7czoxMjoiW0dtYWlsXS9TcGFtIjtpOjA7czoxMToiW0dtYWlsXS9CaW4iO2k6MDtzOjE2OiJbR21haWxdL0FsbCBNYWlsIjtpOjEwO3M6MTc6IltHbWFpbF0vSW1wb3J0YW50IjtpOjE7czoxNToiW0dtYWlsXS9TdGFycmVkIjtpOjA7fWZvbGRlcnN8YToxOntzOjU6IklOQk9YIjthOjI6e3M6MzoiY250IjtpOjE2O3M6NjoibWF4dWlkIjtpOjE2O319bGlzdF9tb2Rfc2VxfHM6NToiMTM2ODkiOw=='),
('lptcis6r3kqpia8nr4rk2901p2', '2017-08-21 12:35:06', '::1', 'bGFuZ3VhZ2V8czo1OiJlbl9VUyI7dGVtcHxiOjE7c2tpbnxzOjU6ImxhcnJ5IjtyZXF1ZXN0X3Rva2VufHM6MzI6IkZaYzNjTEN1YWZxZ3BUZ0NsZUJyZXZzTE8yb2xsTkYxIjs='),
('qkeun5cs9h2bfj7kicjjee6nk4', '2017-08-21 12:41:26', '127.0.0.1', 'bGFuZ3VhZ2V8czo1OiJlbl9VUyI7c2tpbnxzOjU6ImxhcnJ5IjtpbWFwX25hbWVzcGFjZXxhOjM6e3M6ODoicGVyc29uYWwiO047czo1OiJvdGhlciI7TjtzOjY6InNoYXJlZCI7Tjt9aW1hcF9kZWxpbWl0ZXJ8czoxOiIvIjt1c2VyX2lkfHM6MToiMyI7dXNlcm5hbWV8czo3OiJrYWJpbGFuIjtzdG9yYWdlX2hvc3R8czo5OiJsb2NhbGhvc3QiO3N0b3JhZ2VfcG9ydHxpOjE0MztzdG9yYWdlX3NzbHxOO3Bhc3N3b3JkfHM6MzI6IjZZUWxhUVlicGRUYWdSM2pHSkxjS0hjNitTcjNKUXFrIjtsb2dpbl90aW1lfGk6MTUwMzI5NTU1Nzt0aW1lem9uZXxzOjEyOiJBc2lhL0tvbGthdGEiO1NUT1JBR0VfU1BFQ0lBTC1VU0V8YjowO2F1dGhfc2VjcmV0fHM6MjY6IjJGZHJGTmZDdXVua1Z3YjZQeFV3UHJjWWNjIjtyZXF1ZXN0X3Rva2VufHM6MzI6ImpaUVpybFMwbk4wZldEd2ViOFBlZjJTMXh3dHg1THJXIjt0YXNrfHM6NToibG9naW4iO2ltYXBfaG9zdHxzOjk6ImxvY2FsaG9zdCI7bWJveHxzOjU6IklOQk9YIjtzb3J0X2NvbHxzOjA6IiI7c29ydF9vcmRlcnxzOjQ6IkRFU0MiO1NUT1JBR0VfVEhSRUFEfGI6MDtTVE9SQUdFX1FVT1RBfGI6MDtTVE9SQUdFX0xJU1QtRVhURU5ERUR8YjowO2xpc3RfYXR0cmlifGE6Njp7czo0OiJuYW1lIjtzOjg6Im1lc3NhZ2VzIjtzOjI6ImlkIjtzOjExOiJtZXNzYWdlbGlzdCI7czo1OiJjbGFzcyI7czo0ODoicmVjb3Jkcy10YWJsZSBtZXNzYWdlbGlzdCBzb3J0aGVhZGVyIGZpeGVkaGVhZGVyIjtzOjE1OiJvcHRpb25zbWVudWljb24iO3M6NDoidHJ1ZSI7czoxNToiYXJpYS1sYWJlbGxlZGJ5IjtzOjIyOiJhcmlhLWxhYmVsLW1lc3NhZ2VsaXN0IjtzOjc6ImNvbHVtbnMiO2E6ODp7aTowO3M6NzoidGhyZWFkcyI7aToxO3M6Nzoic3ViamVjdCI7aToyO3M6Njoic3RhdHVzIjtpOjM7czo2OiJmcm9tdG8iO2k6NDtzOjQ6ImRhdGUiO2k6NTtzOjQ6InNpemUiO2k6NjtzOjQ6ImZsYWciO2k6NztzOjEwOiJhdHRhY2htZW50Ijt9fWZvbGRlcnN8YToxOntzOjU6IklOQk9YIjthOjI6e3M6MzoiY250IjtpOjI7czo2OiJtYXh1aWQiO2k6Mjt9fXVuc2Vlbl9jb3VudHxhOjE6e3M6NToiSU5CT1giO2k6MTt9dGVtcHxiOjE7');

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE IF NOT EXISTS `system` (
  `name` varchar(64) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`name`, `value`) VALUES
('roundcube-version', '2016112200');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mail_host` varchar(128) NOT NULL,
  `created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_login` datetime DEFAULT NULL,
  `failed_login` datetime DEFAULT NULL,
  `failed_login_counter` int(10) unsigned DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `preferences` longtext,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`,`mail_host`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `mail_host`, `created`, `last_login`, `failed_login`, `failed_login_counter`, `language`, `preferences`) VALUES
(1, 'murugavel', 'localhost', '2017-08-19 19:08:46', '2017-08-21 10:44:23', '2017-08-21 07:13:33', 2, 'en_US', 'a:1:{s:11:"client_hash";s:16:"8o2P24XPfjxJQhVs";}'),
(2, 'sathish', 'localhost', '2017-08-19 19:22:24', '2017-08-21 11:36:59', NULL, NULL, 'en_US', 'a:5:{s:8:"timezone";s:12:"Asia/Kolkata";s:4:"skin";s:5:"larry";s:16:"message_sort_col";s:7:"arrival";s:18:"message_sort_order";s:4:"DESC";s:11:"client_hash";s:16:"ID9fMJ75UhMpXAi4";}'),
(3, 'kabilan', 'localhost', '2017-08-21 11:35:56', '2017-08-21 11:35:56', NULL, NULL, 'en_US', 'a:1:{s:11:"client_hash";s:16:"85QAksbu15ciM4BU";}'),
(4, 'murugavel.kcmr@gmail.com', 'imap.gmail.com', '2017-08-21 12:24:54', '2017-08-21 12:24:54', NULL, NULL, 'en_US', 'a:5:{s:11:"client_hash";s:16:"q3N6j1R9cZjqjN9K";s:11:"drafts_mbox";s:14:"[Gmail]/Drafts";s:9:"sent_mbox";s:17:"[Gmail]/Sent Mail";s:9:"junk_mbox";s:12:"[Gmail]/Spam";s:10:"trash_mbox";s:13:"[Gmail]/Trash";}'),
(5, 'murugavel.jst@gmail.com', 'imap.gmail.com', '2017-08-21 12:40:37', '2017-08-21 12:40:37', NULL, NULL, 'en_US', 'a:5:{s:11:"client_hash";s:16:"Sl1AFzOKAc57EkDN";s:11:"drafts_mbox";s:14:"[Gmail]/Drafts";s:9:"sent_mbox";s:17:"[Gmail]/Sent Mail";s:9:"junk_mbox";s:12:"[Gmail]/Spam";s:10:"trash_mbox";s:11:"[Gmail]/Bin";}');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cache`
--
ALTER TABLE `cache`
  ADD CONSTRAINT `user_id_fk_cache` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cache_index`
--
ALTER TABLE `cache_index`
  ADD CONSTRAINT `user_id_fk_cache_index` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cache_messages`
--
ALTER TABLE `cache_messages`
  ADD CONSTRAINT `user_id_fk_cache_messages` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cache_thread`
--
ALTER TABLE `cache_thread`
  ADD CONSTRAINT `user_id_fk_cache_thread` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contactgroupmembers`
--
ALTER TABLE `contactgroupmembers`
  ADD CONSTRAINT `contact_id_fk_contacts` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`contact_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contactgroup_id_fk_contactgroups` FOREIGN KEY (`contactgroup_id`) REFERENCES `contactgroups` (`contactgroup_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contactgroups`
--
ALTER TABLE `contactgroups`
  ADD CONSTRAINT `user_id_fk_contactgroups` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `user_id_fk_contacts` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dictionary`
--
ALTER TABLE `dictionary`
  ADD CONSTRAINT `user_id_fk_dictionary` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `identities`
--
ALTER TABLE `identities`
  ADD CONSTRAINT `user_id_fk_identities` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `searches`
--
ALTER TABLE `searches`
  ADD CONSTRAINT `user_id_fk_searches` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
