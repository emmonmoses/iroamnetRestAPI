
CREATE VIEW `total_emails`  AS  select count(0) AS `total` from `mailbox` ;
CREATE VIEW `active_emails`  AS  select count(0) AS `total` from `mailbox`WHERE status='Unread';
