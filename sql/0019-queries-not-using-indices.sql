-- Report queries that do not use indices
--
-- https://github.com/macbre/index-digest/issues/19
DROP TABLE IF EXISTS `0019_queries_not_using_indices`;
CREATE TABLE `0019_queries_not_using_indices` (
	`id` int(9) NOT NULL AUTO_INCREMENT,
	`foo` varchar(16) NOT NULL DEFAULT '',
	`bar` varchar(16) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`),
	KEY `bar_idx` (`bar`)
);

INSERT INTO 0019_queries_not_using_indices VALUES
    (1, 'test', ''),
    (2, 'foo', 'test'),
    (3, 'foo', 'check');
