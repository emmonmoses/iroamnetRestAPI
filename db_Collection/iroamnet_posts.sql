CREATE TABLE `active_emails` (
`total` bigint(21)
);

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `categories` (`id`, `name`) VALUES
(9, 'Government'),
(10, 'Technology'),
(11, 'Telecommunication');

CREATE TABLE `mailbox` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `message` text NOT NULL,
  `email` varchar(128) NOT NULL,
  `response` text,
  `status` varchar(10) DEFAULT NULL,
  `date_sent` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_replied` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `name` text,
  `image` varchar(200) NOT NULL,
  `discount` int(20) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_number` text,
  `name` text,
  `quantity` int(20) DEFAULT NULL,
  `total` int(20) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `paymentmethod` (
  `id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `title` text,
  `description` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `category` text,
  `description` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `posts` (`id`, `image`, `category`, `description`, `date_created`, `date_modified`) VALUES
(46, 'ett.jpg', 'Telecommunication', 'Rejoice Your Employees, Customers & Business Partners with Bulk Mobile Package Gift!', '2021-01-20 23:20:03', '2021-01-20 12:20:03');

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `title` text,
  `description` text,
  `currency` varchar(15) DEFAULT NULL,
  `price` int(50) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `roles` (`id`, `name`) VALUES
(5, 'Contributor'),
(6, 'Administrator'),
(7, 'Editor');

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `title` text,
  `description` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `services` (`id`, `image`, `title`, `description`, `date_created`, `date_modified`) VALUES
(46, '21.png', 'Enterprise Help Desk Service', 'Enterprise help desks focus on practical and tactical approaches for handling tech tickets and fulfilling client requests for assistance. The assistance provided by an enterprise help desk is specific to the product or service offered by the larger enterprise', '2021-01-20 23:04:05', '2021-01-20 12:04:05'),
(47, '20.png', 'Supply of Computer accessories and Networking device', 'Networking hardware, also known as network equipment or computer networking devices, are electronic devices which are required for communication and interaction between devices on a computer network', '2021-01-20 23:05:05', '2021-01-20 12:05:05'),
(48, '19.png', 'Telecommunication Consultancy', 'Are you looking to invest in the telecommunication business in Ethiopia ? iRoamNET is equipped with young and talented professionals having 15+ years of experience in the local teleco market on various service sectors. Either you plan to invest as a VAS partner, VISP or Enterprise  grade solution provider, we will be your reliable partner for the end to end communication and service integration processes', '2021-01-20 23:05:59', '2021-01-20 12:05:59'),
(49, '15.png', 'Web Site Design', 'Today,  in the digital world, having a company website is as crucial as having a shop, office or telephone number.. Why wait any longer while your customers are looking for you! If you own or operate a business which hasn\\\'t taken that step into the online world, here are few reasons that will leave you wondering why you hadn\\\'t done it sooner, Online Presence 24/7, Information Exchange, Credibility, Market Expansion, Consumer Insight, Advertising â€¦.etc', '2021-01-20 23:06:58', '2021-01-20 12:06:58'),
(50, '14.png', 'IT / Data Migration', 'In definition, Data migration is the process of moving data from one location to another, one format to another, or one application to another. Generally, this is the result of introducing a new system or location for the data or data center relocation, However, Today,  we consider data migration as a move from on-premises infrastructure and applications to cloud-based storage and applications platforms. Let us work together on that', '2021-01-20 23:07:50', '2021-01-20 12:07:50'),
(51, '13.png', 'International Air-Time Top-up', 'This service will allow you to easily top up Â your loved onesâ€™ prepaid mobile account or settling his/her telecom service monthly bills in Ethiopia just from wherever you currently are, using ethio International Airtime Top Up options.Â Are you looking forward to partner with ethio telecom for this service ? them our more than decades of experience on the local telecom market will allow us to be your reliable local partner for all the engagement processes.', '2021-01-20 23:08:52', '2021-01-20 12:08:52'),
(52, '12.png', 'Technology Consulting Service', 'Technology will never stop evolving, itâ€™s the nature of the beast. So having an innovation advisor on your side is vital: to tailor a strategy that fits and to uncover the right tech for your toughest business problems no matter the industry is.Our technology consulting services help you steer yourÂ transformation with the latest technology, design thinking and agility, while also energizing your legacy systems. Together we can navigate this technology landscape to solve', '2021-01-20 23:09:50', '2021-01-20 12:09:50'),
(53, '11.png', 'Computing Solution', 'Computing is a dynamic provisioning of IT capabilities (hardware, software, or services) from third parties over a network, this network is a cloud network. In this model of computing, all the servers, networks, applications and other elements related to data centers are made available to IT and users via the Internet, in a way that allows you  to buy only the type and amount of computing services that you need.', '2021-01-20 23:11:05', '2021-01-20 12:11:05'),
(54, '10.png', 'Unified Communication / Collaboration Service', 'This is a cloud based communicationsÂ model that supports sixÂ communicationsÂ functions: Enterprise telephony. Meetings (audio/video/web conferencing) makes life easier and facilitates the overall business processes which will bring operational excellence.', '2021-01-20 23:11:52', '2021-01-20 12:11:52'),
(55, '9.png', 'Network Infrastructure Security', 'Typically enterprise IT environments should be protected by installing or deploying preventative measures to deny unauthorized access, modification, deletion, and theft of resources and data. These security measures can include access control,Â application security, firewalls, virtual private networks (VPN), Â intrusion prevention systems, and wireless security.', '2021-01-20 23:12:36', '2021-01-20 12:12:36'),
(56, '8.png', 'IT Project Management', 'IT Project management (ITPM) is the process ofÂ managingÂ the plan, organization, and accountabilities to achieve information technology goals. Are you planning to outsource all or part of your ICT projects management, then our experience in telecom and IT sector will be a great asset to work in partnership with your organization and avoid all your time consuming project management headaches and let you worry on the active business continuity.', '2021-01-20 23:13:15', '2021-01-20 12:13:15'),
(57, '7.png', 'Technology Solutions', 'We believe technology implementations are essential ingredient to drive operational activities of enterprises successfully; our technology packages present some of the main solutions; security and surveillance system (CCTV, access controlâ€¦), wireless access point, Video conferencing system, Fire alarm system, access control â€¦etc', '2021-01-20 23:14:01', '2021-01-20 12:14:01'),
(58, '6.png', 'IT Support and Maintenance Services', 'Our IT Support solution may consist of Installation, Inspection, virus protection, repair, restoration or replacement of equipment\\\'s. In short, our corrective and preventive maintenance packages is all about delivering the highest quality services right to your doorstep.', '2021-01-20 23:14:42', '2021-01-20 12:14:42'),
(59, '5.png', 'Telecom Solutions', 'Our PABX and telephone line installation is a tailored solution for businesses of all shapes and sizes from small to medium and large enterprises (schools, hotels, Guestrooms ). All are professionally installed and maintained with full support. Our objective is to meet all your requirements in good shape.', '2021-01-20 23:15:14', '2021-01-20 12:15:14'),
(60, '4.png', 'Enterprise Networking and Structured Cabling', 'We believe a well-built ICT network infrastructure is key factor for mission critical systems; the backbone of this is a robust and adaptable structured cabling system. By installing your network with careful planning and the highest quality standards, we help you to avoid periodic maintenance costs so as to assure your business run smoothly.', '2021-01-20 23:15:43', '2021-01-20 12:15:43');

CREATE TABLE `total_categories` (
`total` bigint(21)
);

CREATE TABLE `total_emails` (
`total` bigint(21)
);

CREATE TABLE `total_offers` (
`total` bigint(21)
);

CREATE TABLE `total_orders` (
`total` bigint(21)
);

CREATE TABLE `total_paymentmethods` (
`total` bigint(21)
);

CREATE TABLE `total_posts` (
`total` bigint(21)
);

CREATE TABLE `total_products` (
`total` bigint(21)
);

CREATE TABLE `total_roles` (
`total` bigint(21)
);

CREATE TABLE `total_services` (
`total` bigint(21)
);

CREATE TABLE `total_users` (
`total` bigint(21)
);

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(85) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `role` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`) VALUES
(22, 'Usman Umer', 'usmanu@gmail.com', 'cGFzczEyMw==', 'Editor'),
(81, 'Emmon Moses', 'emmonm@yahoo.com', 'cGFzczEyMw==', 'Administrator');

DROP TABLE IF EXISTS `active_emails`;

CREATE VIEW `active_emails`  AS  select count(0) AS `total` from `mailbox` where (`mailbox`.`status` = 'Unread');

DROP TABLE IF EXISTS `total_categories`;

CREATE VIEW `total_categories`  AS  select count(0) AS `total` from `categories`;

DROP TABLE IF EXISTS `total_emails`;

CREATE VIEW `total_emails`  AS  select count(0) AS `total` from `mailbox` ;

DROP TABLE IF EXISTS `total_offers`;

CREATE VIEW `total_offers`  AS  select count(0) AS `total` from `offers` ;

DROP TABLE IF EXISTS `total_orders`;

CREATE VIEW `total_orders`  AS  select count(0) AS `total` from `orders` ;

DROP TABLE IF EXISTS `total_paymentmethods`;

CREATE VIEW `total_paymentmethods`  AS  select count(0) AS `total` from `paymentmethod` ;

DROP TABLE IF EXISTS `total_posts`;

CREATE VIEW `total_posts`  AS  select count(0) AS `total` from `posts` ;

DROP TABLE IF EXISTS `total_products`;

CREATE VIEW `total_products`  AS  select count(0) AS `total` from `products` ;

DROP TABLE IF EXISTS `total_roles`;

CREATE VIEW `total_roles`  AS  select count(0) AS `total` from `roles` ;

DROP TABLE IF EXISTS `total_services`;

CREATE VIEW `total_services`  AS  select count(0) AS `total` from `services` ;

DROP TABLE IF EXISTS `total_users`;

CREATE VIEW `total_users`  AS  select count(0) AS `total` from `users` ;


ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `mailbox`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `paymentmethod`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `mailbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `paymentmethod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
