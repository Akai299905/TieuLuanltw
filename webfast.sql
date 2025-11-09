-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 28, 2023 lúc 06:31 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webfast`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` char(15) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `level` tinyint(4) DEFAULT 1,
  `avatar` varchar(100) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `address`, `email`, `password`, `phone`, `status`, `level`, `avatar`, `create_at`, `update_at`) VALUES
(12, 'Admin', 'K123/14 Đỗ Thúc Tịnh, Cẩm Lệ, Đà Nẵng', 'admin@gmail.com', 'c8837b23ff8aaa8a2dde915473ce0991', '0778960401', 1, 2, NULL, '2022-06-12 09:55:53', '2022-06-12 09:55:53'),
(13, 'Organic Water', 'K123/14 Đà Nẵng', 'admin2@gmail.com', 'c8837b23ff8aaa8a2dde915473ce0991', '0778960403', 1, 1, NULL, '2023-05-19 08:02:59', '2023-05-19 08:02:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `images` varchar(100) DEFAULT NULL,
  `banner` varchar(100) NOT NULL,
  `home` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `level` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `images`, `banner`, `home`, `status`, `level`, `created_at`, `updated_at`) VALUES
(48, 'Áo nam', 'ao-nam', 'product-1.jpg', '', 0, 0, 0, '2023-06-01 09:37:25', '2025-11-09 13:12:20'),
(49, 'Quần nam', 'quan-nam', 'product-2.jpg', '', 0, 0, 0, '2023-06-01 09:41:13', '2025-11-09 13:12:43'),
(50, 'Áo nữ', 'ao-nu', 'product-3.jpg', '', 0, 0, 0, '2023-06-01 09:41:39', '2025-11-09 13:12:55'),
(51, 'Quần nữ', 'quan-nu', 'product-4.jpg', '', 0, 0, 0, '2023-06-01 09:42:19', '2025-11-09 13:13:08'),
(52, 'Trẻ em', 'tre-em', 'product-5.jpg', '', 0, 0, 0, '2023-06-01 09:42:56', '2025-11-09 13:13:26'),
(54, 'Dụng cụ nhà bếp', 'dung-cu-nha-bep', 'kitchen.jpg', 'kitchen_banner.jpg', 0, 1, 0, '2025-11-09 13:15:04', '2025-11-09 13:15:04'),
(55, 'Đồ dùng phòng ngủ', 'do-dung-phong-ngu', 'bedroom.jpg', 'bedroom_banner.jpg', 0, 1, 0, '2025-11-09 13:15:04', '2025-11-09 13:15:04'),
(56, 'Trang trí nhà cửa', 'trang-tri-nha-cua', 'decor.jpg', 'decor_banner.jpg', 0, 1, 0, '2025-11-09 13:15:04', '2025-11-09 13:15:04');


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` tinyint(4) DEFAULT NULL,
  `size` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `transaction_id`, `product_id`, `qty`, `size`, `color`, `price`, `created_at`, `updated_at`) VALUES
(148, 83, 222, 1, 'XXL', 'Đen', 305000, '2023-06-08 11:13:17', '2023-06-08 11:13:17'),
(149, 83, 222, 1, 'XXL', 'Xanh', 305000, '2023-06-08 11:13:17', '2023-06-08 11:13:17'),
(150, 83, 222, 1, 'XXL', 'Vàng', 305000, '2023-06-08 11:13:17', '2023-06-08 11:13:17'),
(151, 84, 223, 1, 'XXL', 'Đen', 270750, '2023-06-08 11:14:18', '2023-06-08 11:14:18'),
(152, 85, 223, 1, 'XXL', 'Đen', 270750, '2023-06-08 11:14:29', '2023-06-08 11:14:29'),
(153, 87, 222, 1, 'XXL', 'Đen', 305000, '2023-06-12 01:51:13', '2023-06-12 01:51:13'),
(154, 87, 222, 1, 'XXL', 'Xanh', 305000, '2023-06-12 01:51:13', '2023-06-12 01:51:13'),
(155, 88, 222, 1, 'XXL', 'Đen', 305000, '2023-06-18 18:15:57', '2023-06-18 18:15:57'),
(156, 91, 223, 1, 'XXL', 'Đen', 270750, '2023-07-15 12:02:32', '2023-07-15 12:02:32'),
(157, 91, 226, 2, 'XL', 'Đen', 590000, '2023-07-15 12:02:32', '2023-07-15 12:02:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `sale` tinyint(4) DEFAULT 0,
  `thundar` varchar(200) DEFAULT NULL,
  `rated` int(11) NOT NULL DEFAULT 0,
  `comment` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `head` int(11) DEFAULT 0,
  `view` int(11) DEFAULT 0,
  `hot` tinyint(4) DEFAULT 0,
  `number` int(11) NOT NULL DEFAULT 0,
  `status` int(10) NOT NULL DEFAULT 1,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `slug`, `price`, `sale`, `thundar`, `rated`, `comment`, `category_id`, `content`, `head`, `view`, `hot`, `number`, `status`, `create_at`, `update_at`) VALUES
(222, 'Áo Sơ Mi Nam Trơn Tay Dài Mac Fm', 'ao-so-mi-nam-tron-tay-dai-mac-fm', 305000, 0, NULL, 0, 0, 48, '- Tên sản phẩm: Áo Sơ Mi Nam Trơn Mac FM\r\n\r\n- Độ tuổi: > 13 tuổi\r\n\r\n- Phù hợp: Mặc đi làm, đi học, đi chơi.\r\n\r\n- Chất liệu: Vải kate\r\n\r\n- Màu sắc: Đen/ Trắng/ Xám nhạt/ Xám đậm\r\n\r\n- Họa tiết: Trơn\r\n\r\n- Xuất xứ: Tự thiết kế và sản xuất bởi FM Style tại Việt Nam \r\n\r\n- Cam kết 100% chất lượng từ chất vải đến đường chỉ, phát hiện lỗi được hoàn trả miễn phí.\r\n\r\n- Size L: Chiều cao 160 - 167cm, nặng <65kg\r\n\r\n- Size XL: Chiều cao 167 - 175cm, nặng 65 - 69kg\r\n\r\n- Size 2XL: Chiều cao 167 - 180cm, nặng 65 - 70kg\r\n\r\nHướng dẫn chọn size ở trên chỉ mang tính chất tham khảo tương đối, tuỳ vào chiều cao và số đo cơ thể mà bạn có thể thay đổi để chọn đúng size sản phẩm phù hợp.\r\n\r\nHàng có size L, XL, 2XL, khách hàng vui lòng ghi rõ size cần chọn vào ghi chú đơn hàng.', 0, 0, 0, 89, 1, '2023-06-01 09:45:44', '2023-06-01 09:45:44'),
(223, 'Áo Sơ Mi Nam Kaki Mac Fm', 'ao-so-mi-nam-kaki-mac-fm', 285000, 5, NULL, 0, 0, 48, '- Tên sản phẩm: Áo Sơ Mi Nam Kaki Mac FM\r\n\r\n- Độ tuổi: > 13 tuổi\r\n\r\n- Phù hợp: Mặc đi làm, đi học, đi chơi.\r\n\r\n- Chất liệu: Vải kate\r\n\r\n- Màu sắc: Đen/ Trắng/ Be\r\n\r\n- Họa tiết: Trơn\r\n\r\n- Xuất xứ: Tự thiết kế và sản xuất bởi FM Style tại Việt Nam \r\n\r\n- Cam kết 100% chất lượng từ chất vải đến đường chỉ, phát hiện lỗi được hoàn trả miễn phí.', 0, 0, 0, 99, 1, '2023-06-01 09:48:00', '2023-06-01 09:48:00'),
(224, '2303kka8881601', '2303kka8881601', 399000, 0, NULL, 5, 1, 48, '- Tên sản phẩm: Áo Sơ Mi Nam Kaki Mac FM\r\n\r\n- Độ tuổi: > 13 tuổi\r\n\r\n- Phù hợp: Mặc đi làm, đi học, đi chơi.\r\n\r\n- Chất liệu: Vải kate\r\n\r\n- Màu sắc: Đen/ Trắng/ Be\r\n\r\n- Họa tiết: Trơn\r\n\r\n- Xuất xứ: Tự thiết kế và sản xuất bởi FM Style tại Việt Nam \r\n\r\n- Cam kết 100% chất lượng từ chất vải đến đường chỉ, phát hiện lỗi được hoàn trả miễn phí.', 0, 0, 0, 40, 1, '2023-06-01 09:50:15', '2023-06-01 09:50:15'),
(225, 'Quần Kaki Nam Dài Mac Fm', 'quan-kaki-nam-dai-mac-fm', 355000, 0, NULL, 0, 0, 49, '- Tên sản phẩm: Quần Kaki Nam Dài Mac FM\r\n\r\n- Độ tuổi: > 13 tuổi\r\n\r\n- Phù hợp: Mặc đi chơi, tập thể thao, ở nhà.\r\n\r\n- Chất liệu: Vải kaki\r\n\r\n- Màu sắc: Đen/ Be/ Xám\r\n\r\n- Họa tiết: Trơn\r\n\r\n- Xuất xứ: Tự thiết kế và sản xuất bởi FM Style tại Việt Nam \r\n\r\n- Cam kết 100% chất lượng từ chất vải đến đường chỉ, phát hiện lỗi được hoàn trả miễn phí.', 0, 0, 0, 93, 1, '2023-06-01 10:02:46', '2023-06-01 10:02:46'),
(226, 'Quần Kaki Nam Dài', 'quan-kaki-nam-dai', 295000, 0, NULL, 0, 0, 49, '- Tên sản phẩm: Quần Kaki Nam Dài Mac FM  - Độ tuổi: > 13 tuổi  - Phù hợp: Mặc đi chơi, tập thể thao, ở nhà.  - Chất liệu: Vải kaki  - Màu sắc: Đen/ Be/ Xám  - Họa tiết: Trơn  - Xuất xứ: Tự thiết kế và sản xuất bởi FM Style tại Việt Nam   - Cam kết 100% chất lượng từ chất vải đến đường chỉ, phát hiện lỗi được hoàn trả miễn phí.', 0, 0, 0, 58, 1, '2023-06-01 10:06:06', '2023-06-01 10:06:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_details`
--

CREATE TABLE `product_details` (
  `id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `color` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `qty` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(21, 222, 'pro-1.jpg', NULL, NULL),
(22, 222, 'pro-2.jpg', NULL, NULL),
(23, 222, 'pro-3.jpg', NULL, NULL),
(24, 222, 'pro-4.jpg', NULL, NULL),
(25, 223, 'pro-8.jpg', NULL, NULL),
(26, 223, 'pro-7.jpg', NULL, NULL),
(27, 223, 'pro-6.jpg', NULL, NULL),
(28, 223, 'pro-5.jpg', NULL, NULL),
(29, 224, 'pro-12.jpg', NULL, NULL),
(30, 224, 'pro-11.jpg', NULL, NULL),
(31, 224, 'pro-10.jpg', NULL, NULL),
(32, 224, 'pro-9.jpg', NULL, NULL),
(33, 225, 'pro-16.jpg', NULL, NULL),
(34, 225, 'pro-15.jpg', NULL, NULL),
(35, 225, 'pro-14.jpg', NULL, NULL),
(36, 225, 'pro-13.jpg', NULL, NULL),
(37, 226, 'pro-20.jpg', NULL, NULL),
(38, 226, 'pro-19.jpg', NULL, NULL),
(39, 226, 'pro-18.jpg', NULL, NULL),
(40, 226, 'pro-17.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rated`
--

CREATE TABLE `rated` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_users` int(11) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `rated` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `rated`
--

INSERT INTO `rated` (`id`, `id_product`, `id_users`, `comment`, `rated`, `created_at`, `updated_at`) VALUES
(61, 224, 33, 'Áo đẹp', 5, '2023-06-01 09:50:43', '2023-06-01 09:50:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhtoan`
--

CREATE TABLE `thanhtoan` (
  `id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `thanh_vien` varchar(100) NOT NULL COMMENT 'thành viên thanh toán',
  `money` float NOT NULL COMMENT 'số tiền thanh toán',
  `note` varchar(255) DEFAULT NULL COMMENT 'ghi chú thanh toán',
  `vnp_response_code` varchar(255) NOT NULL COMMENT 'mã phản hồi',
  `code_vnpay` varchar(255) NOT NULL COMMENT 'mã giao dịch vnpay',
  `code_bank` varchar(255) NOT NULL COMMENT 'mã ngân hàng',
  `time` datetime NOT NULL COMMENT 'thời gian chuyển khoản'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `payment_method` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `transaction`
--

INSERT INTO `transaction` (`id`, `amount`, `users_id`, `name`, `email`, `phone`, `address`, `status`, `payment_method`, `created_at`, `updated_at`) VALUES
(83, 915000, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 0, 2, '2023-06-08 11:13:17', '2023-07-15 15:57:20'),
(84, 270750, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 0, 2, '2023-06-08 11:14:18', '2023-07-15 15:57:22'),
(85, 270750, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 2, 2, '2023-06-08 11:14:29', '2023-07-15 15:57:59'),
(86, 0, 33, 'Organic Water', 'admin1@gmail.com', '0778960422', 'Hà Nội', 2, 1, '2023-06-12 01:50:50', '2023-07-15 15:57:30'),
(87, 610000, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 1, 1, '2023-06-12 01:51:13', '2023-06-12 01:51:27'),
(88, 305000, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 1, 1, '2023-05-22 18:15:57', '2023-07-15 11:20:32'),
(89, 0, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 2, 1, '2023-06-30 15:28:50', '2023-07-15 15:41:26'),
(90, 0, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 1, 1, '2023-06-30 15:28:52', '2023-07-15 15:38:44'),
(91, 860750, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 2, 1, '2023-07-15 12:02:32', '2023-07-15 15:35:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` char(15) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `password`, `avatar`, `status`, `created_at`, `update_at`) VALUES
(33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 'c8837b23ff8aaa8a2dde915473ce0991', '', 1, '2023-05-23 03:32:42', '2023-05-23 03:32:42'),
(37, 'Organic Water', 'thongit109@gmail.com', '0778960403', 'K123/14 Đỗ Thúc Tịnh', 'c8837b23ff8aaa8a2dde915473ce0991', NULL, 1, '2023-06-09 06:57:26', '2023-06-09 06:57:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `rated`
--
ALTER TABLE `rated`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_users` (`id_users`);

--
-- Chỉ mục cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT cho bảng `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `rated`
--
ALTER TABLE `rated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `rated`
--
ALTER TABLE `rated`
  ADD CONSTRAINT `rated_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `rated_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
