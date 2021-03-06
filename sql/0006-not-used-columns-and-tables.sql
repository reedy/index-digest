-- Report not used columns and tables
--
-- https://github.com/macbre/index-digest/issues/6
DROP TABLE IF EXISTS `0006_not_used_columns`;
CREATE TABLE `0006_not_used_columns` (
	`id` int(9) NOT NULL AUTO_INCREMENT,
	`foo` varchar(16) NOT NULL DEFAULT '',
	`bar` varchar(16) NOT NULL DEFAULT '',
	`test` varchar(16) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`)
);

INSERT INTO 0006_not_used_columns VALUES
    (1, 'test', '', ''),
    (42, 'foo', 'test', ''),
    (3, 'foo', '', 'check');

DROP TABLE IF EXISTS `0006_not_used_tables`;
CREATE TABLE `0006_not_used_tables` (
	`id` int(9) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

INSERT INTO 0006_not_used_tables VALUES(1);
