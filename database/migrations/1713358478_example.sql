-- up
CREATE TABLE `categories` (
  `id` varchar(200) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `parent` varchar(200) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `categories` (`id`, `name`, `description`, `parent`, `modified`, `created`) VALUES
('0c1d2e3f-4a5b-6c7d-8e9f-0a1b2c3d4e5f', 'Destinations', '-', '9b0c1d2e-3f4a-5b6c-7d8e-9f0a1b2c3d4e', NULL, '2024-11-30 06:29:40'),
('0e1f2a3b-4c5d-6e7f-8a9b-0c1d2e3f4a5b', 'Arts & Entertainment', '-', NULL, NULL, '2024-11-30 06:29:40'),
('1c2a3b4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'Technology', '-', NULL, NULL, '2024-11-30 06:29:40'),
('1d2e3f4a-5b6c-7d8e-9f0a-1b2c3d4e5f6a', 'Travel Tips', '-', '9b0c1d2e-3f4a-5b6c-7d8e-9f0a1b2c3d4e', NULL, '2024-11-30 06:29:40'),
('1f2a3b4c-5d6e-7f8a-9b0c-1d2e3f4a5b6c', 'Visual Arts', '-', '0e1f2a3b-4c5d-6e7f-8a9b-0c1d2e3f4a5b', NULL, '2024-11-30 06:29:40'),
('2a3b4c5d-6e7f-8a9b-0c1d-2e3f4a5b6c7d', 'Performing Arts', '-', '0e1f2a3b-4c5d-6e7f-8a9b-0c1d2e3f4a5b', NULL, '2024-11-30 06:29:40'),
('2c3d4e5f-6a7b-8c9d-0e1f-2a3b4c5d6e7f', 'Software Development', '-', '1c2a3b4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', NULL, '2024-11-30 06:29:40'),
('3b4c5d6e-7f8a-9b0c-1d2e-3f4a5b6c7d8e', 'Science & Nature', '-', NULL, NULL, '2024-11-30 06:29:40'),
('3d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f82', 'Hardware Engineering 3', '-', '3d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f8a', NULL, '2024-11-30 06:29:40'),
('3d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f8a', 'Hardware Engineering 2', '-', '2c3d4e5f-6a7b-8c9d-0e1f-2a3b4c5d6e7f', NULL, '2024-11-30 06:29:40'),
('4c5d6e7f-8a9b-0c1d-2e3f-4a5b6c7d8e9f', 'Biology', '-', '3b4c5d6e-7f8a-9b0c-1d2e-3f4a5b6c7d8e', NULL, '2024-11-30 06:29:40'),
('4e5f6a7b-8c9d-0e1f-2a3b-4c5d6e7f8a9b', 'Education', '-', NULL, NULL, '2024-11-30 06:29:40'),
('5d6e7f8a-9b0c-1d2e-3f4a-5b6c7d8e9f0a', 'Physics', '-', '3b4c5d6e-7f8a-9b0c-1d2e-3f4a5b6c7d8e', NULL, '2024-11-30 06:29:40'),
('5f6a7b8c-9d0e-1f2a-3b4c-5d6e7f8a9b0c', 'Higher Education', '-', '4e5f6a7b-8c9d-0e1f-2a3b-4c5d6e7f8a9b', NULL, '2024-11-30 06:29:40'),
('6a7b8c9d-0e1f-2a3b-4c5d-6e7f8a9b0c1d', 'K-12 Education', '-', '4e5f6a7b-8c9d-0e1f-2a3b-4c5d6e7f8a9b', NULL, '2024-11-30 06:29:40'),
('6e7f8a9b-0c1d-2e3f-4a5b-6c7d8e9f0a1b', 'Food & Cooking', '-', NULL, NULL, '2024-11-30 06:29:40'),
('7b8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d2e', 'Health & Wellness', '-', NULL, NULL, '2024-11-30 06:29:40'),
('7f8a9b0c-1d2e-3f4a-5b6c-7d8e9f0a1b2c', 'Recipes', '-', '6e7f8a9b-0c1d-2e3f-4a5b-6c7d8e9f0a1b', NULL, '2024-11-30 06:29:40'),
('8a9b0c1d-2e3f-4a5b-6c7d-8e9f0a1b2c3d', 'Culinary Techniques', '-', '6e7f8a9b-0c1d-2e3f-4a5b-6c7d8e9f0a1b', NULL, '2024-11-30 06:29:40'),
('8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e3f', 'Fitness & Nutrition', '-', '7b8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d2e', NULL, '2024-11-30 06:29:40'),
('9b0c1d2e-3f4a-5b6c-7d8e-9f0a1b2c3d4e', 'Travel & Tourism', '-', NULL, NULL, '2024-11-30 06:29:40'),
('9d0e1f2a-3b4c-5d6e-7f8a-9b0c1d2e3f4a', 'Mental Health', '-', '7b8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d2e', NULL, '2024-11-30 06:29:40');

CREATE TABLE `courses` (
  `id` varchar(200) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `category_id` varchar(200) NOT NULL,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creadted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `courses` (`id`, `title`, `description`, `image`, `category_id`, `modified`, `creadted`) VALUES
('L373312762', 'Finance and Accounting Basics for Nonfinancial Executives', 'Financial knowledge is vital to an executive’s role in a business, but the systems within a business can be extremely complex. Without a strong foundation of financial analytics, it can be difficult to interpret, report, or even understand a business’s financial standing. A lack of understanding can impede your ability to make educated decisions. By understanding where the data comes from and how accounting operates, you can manage your business with greater efficiency and interpret business systems more accurately. ', 'https://cdn0.knowledgecity.com/opencontent/courses/previews/L373312762/800--v112243.jpg', '4e5f6a7b-8c9d-0e1f-2a3b-4c5d6e7f8a9b', NULL, '2024-11-30 06:32:43'),
('L373319845', 'Financial Statements and Reporting for Nonfinancial Executives', 'Financial statements are a critical part of attracting investors. Financial reports like income statements are the hard proof of how your business is doing. Properly interpreting these statements can provide a stronger understanding of your business’s performance. This can also assist your company when acquiring new investments and making strategic business decisions. Your reliable and precise numbers may encourage shareholders and investors to feel more confident when working with you. ', 'https://cdn0.knowledgecity.com/opencontent/courses/previews/L373319845/800--v112244.jpg', '5f6a7b8c-9d0e-1f2a-3b4c-5d6e7f8a9b0c', NULL, '2024-11-30 06:32:43'),
('L373324687', 'Applying Yourself to Diverse and Inclusive Leadership', 'Improving diversity in the workplace requires strategic planning and mindful consideration from everyone involved because inclusion in the workplace is a team effort. When a leader is a participant in change rather than a director, the culture is able to transform with them. Strategies such as improved communication, modeling positivity and adaptability, and building relationships can help make the transition smoother. Effectively changing the culture of a business requires commitment and determination, which is why it’s important to know of leadership strategies that you can use to help you build and maintain a sustainable culture of diversity and equity.\n\n', 'https://cdn0.knowledgecity.com/opencontent/courses/previews/L373324687/800--v112241.jpg', '3d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f82', NULL, '2024-11-30 06:32:43'),
('L373327593', 'Financial Planning and Analysis for Nonfinancial Executives', 'With constant market fluctuation and an unpredictable supply chain, sometimes it can be difficult to project where your business will be tomorrow. That’s where financial forecasting comes in. The data you have today can be used in various ratios and equations to create helpful financial estimates for your business. You can also use different aspects of financial and managerial accounting to better present your finances to potential and existing stakeholders. Streamlined financial reporting, planning, and analysis techniques can improve your business’s competitive strategy. ', 'https://cdn0.knowledgecity.com/opencontent/courses/previews/L373327593/800--v112246.jpg', '7b8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d2e', NULL, '2024-11-30 06:32:43'),
('L373337574', 'Defining Cross-Cultural Leadership', 'The modern business landscape is noticeably globalized. People from many countries and cultures work together, whether in-person or remotely. You might work in an environment like this yourself, or you likely will in the future. That’s why it’s critical for you, as a leader, to have the necessary skills to navigate cultural differences within your company. Otherwise, you might not know how best to leverage your employees’ skills. So how can you do this? How can you become a cross-cultural leader?', 'https://cdn0.knowledgecity.com/opencontent/courses/previews/L373337574/800--v112262.jpg', '8a9b0c1d-2e3f-4a5b-6c7d-8e9f0a1b2c3d', NULL, '2024-11-30 06:32:43'),
('L373349028', 'Diversity and Inclusion for a Better Business', 'Diversity can seem like a difficult concept to incorporate into the culture of a business. Leaders often view diversity initiatives as important but see them as secondary to the day-to-day operations of a successful business. You may ask yourself, where and how do I start? In this course, we’ll look at many strategies that can help jumpstart diversity and inclusion initiatives. Through these initiatives, we can build stronger relationships that improve the overall business environment and how it functions. These relationships can drive stability, sustainability, and profitability for years to come.  ', 'https://cdn0.knowledgecity.com/opencontent/courses/previews/L373349028/800--v112240.jpg', '3d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f8a', NULL, '2024-11-30 06:32:43'),
('L373371072', 'Leadership for Identity Diversity', 'As a leader, people of many different backgrounds will look to you for guidance and security in the workplace. The individual identities within a workplace can include individuals from different racial and ethnic backgrounds, individuals with different gender and sexual identities, and individuals with different disabilities.  One of the goals of a leader is to create a safe and inclusive environment for all employees. When creating an inclusive environment, it’s important to be aware of who you\'re creating it for and what their individual needs are. Recognizing individuality and implementing inclusion practices benefit everyone and improve your business’s culture.', 'https://cdn0.knowledgecity.com/opencontent/courses/previews/L373371072/800--v112239.jpg', '3d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f8a', NULL, '2024-11-30 06:32:43'),
('L373395597', 'Valuation for Nonfinancial Executives', 'Investments always involve a bit of risk, but you can lower that risk by analyzing your company’s current and future value. There are many options when it comes to funding a business or a project. Funding can be acquired through both debt and equity, as well as working capital. Learning the inner workings of project and relative valuation can help improve your investment decision-making skills and understand which projects will bring the best results.', 'https://cdn0.knowledgecity.com/opencontent/courses/previews/L373395597/800--v112241.jpg', '1f2a3b4c-5d6e-7f8a-9b0c-1d2e3f4a5b6c', NULL, '2024-11-30 06:32:43');

ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);
COMMIT;

-- down
DROP TABLE `categories`;
DROP TABLE `courses`;