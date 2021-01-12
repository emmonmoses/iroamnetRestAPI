--
-- Database creation `iroamnet_posts`
--

STEP 1: RUN THE COMMAND BELOW

CREATE DATABASE iroamnet_posts;

STEP 2: RUN THE COMMAND BELOW

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
);

INSERT INTO `categories` (`id`, `name`) VALUES
(2, 'Application Development'),
(1, 'Telecommunication'),
(3, 'Video Conferencing');

STEP 3: RUN THE COMMAND BELOW

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `category` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO `posts` (`id`, `image`, `category`, `description`, `date_created`, `date_modified`) VALUES
(37, 'IMG20201222131545.jpg', 'Emmon Vacation', 'Xmass holiday at Arba Minch\'s Paradise Lodge', '2020-12-29 13:52:45', '2020-12-29 10:52:45'),
(38, 'IMG20201223082804.jpg', 'Paradise Lodge', 'Xmass holiday at Arba Minch\'s Paradise Lodge', '2020-12-29 13:53:33', '2020-12-29 10:53:33'),
(39, 'IMG20201223083107.jpg', 'Arba Minch', '2021 Vacation for Dawit', '2020-12-29 13:54:18', '2020-12-29 17:43:33'),
(44, 'IMG20201223092425.jpg', 'Usman Dessie', 'Xmass holiday at Arba Minch\'s Paradise Lodge', '2020-12-29 20:40:17', '2020-12-29 17:40:17');

STEP 4: RUN THE COMMAND BELOW

CREATE TABLE `products` (
  `p_id` int(11) NOT NULL,
  `p_category` varchar(128) NOT NULL,
  `p_description` text NOT NULL,
  `p_price` double NOT NULL,
  `p_created` datetime NOT NULL DEFAULT current_timestamp(),
  `p_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

INSERT INTO `products` (`p_id`, `p_category`, `p_description`, `p_price`, `p_created`, `p_modified`) VALUES
(3, 'Eye Glasses', 'It will make you read better.', 6, '2020-12-29 13:44:32', '2020-12-29 18:04:51'),
(4, 'Trash Can', 'It will help you maintain cleanliness.', 3.95, '2020-12-29 13:44:32', '2020-12-29 10:44:32'),
(5, 'Mouse', 'Very useful if you love your computer.', 11.35, '2020-12-29 13:44:32', '2020-12-29 10:44:32'),
(9, 'Laptop', 'For coding', 1000, '2020-12-30 15:31:03', '2020-12-30 12:31:03');

STEP 5: RUN THE COMMAND BELOW

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(85) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(9, 'moses', 'moses@gmail.com', 'cGFzczEyMw=='),
(10, 'emmon', 'emmon@gmail.com', 'cGFzczEyMw=='),
(11, 'emmon', 'emmon@gmails.com', 'cGFzczEyMw==');

STEP 6: RUN ALL THE COMMANDS BELOW

ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

ALTER TABLE `products`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

