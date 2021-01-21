CREATE TABLE `paymentmethod` (
  `id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `paymentmethod` (`image`, `name`, `description`) VALUES
('advert.jpeg', 'Visa/Master Card', 'Card Payment'),
('banner.jpg', 'Paypal', 'Online Payment'),
('advert.jpeg', 'MPESA', 'Paybill Number 880880'),
('banner.jpg', 'Western Union', 'Wire Transfer'),
('advert.jpeg', 'Bank Transfer', 'Account to Account');

ALTER TABLE `paymentmethod`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `paymentmethod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
