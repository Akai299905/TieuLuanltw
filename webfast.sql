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
(1, 'Dụng cụ nhà bếp', 'dung-cu-nha-bep', 'kitchen.jpg', 'kitchen_banner.jpg', 0, 1, 0, NOW(), NOW()),
(2, 'Thiết bị điện gia đình', 'thiet-bi-dien-gia-dinh', 'electronics.jpg', 'electronics_banner.jpg', 0, 1, 0, NOW(), NOW()),
(3, 'Đồ dùng phòng tắm', 'do-dung-phong-tam', 'bathroom.jpg', 'bathroom_banner.jpg', 0, 1, 0, NOW(), NOW()),
(4, 'Đồ dùng phòng ngủ','do-dung-phong-ngu', 'bedroom.jpg', 'bedroom_banner.jpg', 0, 1, 0, NOW(), NOW()),
(5, 'Trang trí nhà cửa', 'trang-tri-nha-cua', 'decor.jpg', 'decor_banner.jpg', 0, 1, 0, NOW(), NOW()),
(6, 'Vệ sinh – Giặt ủi', 've-sinh-giat-ui', 'cleaning.jpg', 'cleaning_banner.jpg', 0, 1, 0, NOW(), NOW());

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
  `size` varchar(100) NULL,
  `color` varchar(100) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--



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

INSERT INTO product (id, name, slug, price, sale, thundar, rated, comment, category_id, content, head, view, hot, number, status, create_at, update_at) VALUES
(1, 'Nồi cơm điện Sunhouse 1.8L', 'noi-com-sunhouse', 720000, 0, 'pro-1.jpg', 0, 0, 1, 'Nồi cơm điện dung tích 1.8L, chống dính, giữ ấm lâu.', 0, 0, 0, 20, 1, NOW(), NOW()),
(2, 'Chảo chống dính Elmich 26cm', 'chao-elmich-26cm', 420000, 0, 'pro-2.jpg', 0, 0, 1, 'Chảo chống dính cao cấp, đáy từ, dùng cho mọi loại bếp.', 0, 0, 0, 25, 1, NOW(), NOW()),
(3, 'Máy xay sinh tố Sharp 400W', 'may-xay-sharp', 650000, 0, 'pro-4.jpg', 0, 0, 1, 'Lưỡi dao inox 4 cánh, cối thủy tinh, xay được đá.', 0, 0, 0, 15, 1, NOW(), NOW()),
(4, 'Bộ nồi inox 5 món Elmich', 'bo-noi-inox-5-mon', 1200000, 10, 'pro-6.jpg', 0, 0, 1, 'Bộ nồi inox 5 món, bền bỉ, dùng được cho mọi loại bếp.', 0, 0, 0, 12, 1, NOW(), NOW()),
(5, 'Bình đun siêu tốc Philips 1.7L', 'binh-dun-philips', 490000, 0, 'pro-3.jpg', 0, 0, 1, 'Công suất 2000W, tự ngắt khi sôi, vỏ inox.', 0, 0, 0, 18, 1, NOW(), NOW()),

-- Thiết bị điện gia đình (category_id = 2)
(6, 'Lò vi sóng Toshiba 20L', 'lo-vi-song-toshiba', 1750000, 0, 'pro-5.jpg', 0, 0, 2, 'Có chế độ nướng và hẹn giờ tiện dụng.', 0, 0, 0, 10, 1, NOW(), NOW()),
(7, 'Quạt điện Mitsubishi 45W', 'quat-dien-mitsubishi', 350000, 0, 'pro-7.jpg', 0, 0, 2, 'Quạt đứng 3 tốc độ, hoạt động êm ái.', 0, 0, 0, 20, 1, NOW(), NOW()),
(8, 'Máy hút bụi Electrolux 1200W', 'may-hut-bui-electrolux', 2100000, 0, 'pro-8.jpg', 0, 0, 2, 'Công suất 1200W, hút sạch bụi và lông thú.', 0, 0, 0, 8, 1, NOW(), NOW()),
(9, 'Bình nóng lạnh Ariston 15L', 'binh-nong-lanh-ariston', 3200000, 0, 'pro-9.jpg', 0, 0, 2, 'Dung tích 15L, an toàn, tiết kiệm điện.', 0, 0, 0, 5, 1, NOW(), NOW()),
(10, 'Tủ lạnh mini Aqua 90L', 'tu-lanh-mini-aqua', 2850000, 0, 'pro-10.jpg', 0, 0, 2, 'Tủ lạnh mini, phù hợp gia đình nhỏ.', 0, 0, 0, 7, 1, NOW(), NOW()),

-- Đồ dùng phòng tắm (category_id = 3)
(11, 'Bồn cầu Inax 2 khối', 'bon-cau-inax', 2200000, 0, 'pro-11.jpg', 0, 0, 3, 'Bồn cầu Inax, tiết kiệm nước, dễ vệ sinh.', 0, 0, 0, 10, 1, NOW(), NOW()),
(12, 'Bộ vòi sen Grohe', 'voi-sen-grohe', 950000, 0, 'pro-12.jpg', 0, 0, 3, 'Vòi sen Grohe cao cấp, chống gỉ sét.', 0, 0, 0, 15, 1, NOW(), NOW()),
(13, 'Gương phòng tắm 50x70', 'guong-phong-tam', 350000, 0, 'pro-13.jpg', 0, 0, 3, 'Gương treo tường, khung inox sáng bóng.', 0, 0, 0, 20, 1, NOW(), NOW()),
(14, 'Kệ để đồ nhà tắm 3 tầng', 'ke-de-do-nha-tam', 420000, 0, 'pro-14.jpg', 0, 0, 3, 'Kệ nhựa 3 tầng, chịu lực tốt, chống nước.', 0, 0, 0, 18, 1, NOW(), NOW()),
(15, 'Bàn chải điện Oral-B', 'ban-chai-dien-oralb', 780000, 0, 'pro-15.jpg', 0, 0, 3, 'Bàn chải điện, làm sạch răng hiệu quả.', 0, 0, 0, 12, 1, NOW(), NOW()),

-- Đồ dùng phòng ngủ (category_id = 4)
(16, 'Chăn lông vũ 2m x 2.2m', 'chan-long-vu', 800000, 5, 'pro-16.jpg', 0, 0, 4, 'Chăn mềm mại, giữ ấm tốt, phù hợp mọi mùa.', 0, 0, 0, 10, 1, NOW(), NOW()),
(17, 'Gối cao su non Everon', 'goi-cao-su-non', 350000, 0, 'pro-17.jpg', 0, 0, 4, 'Gối ôm, nâng đỡ cổ, giảm đau vai gáy.', 0, 0, 0, 20, 1, NOW(), NOW()),
(18, 'Bộ drap giường cotton 1.6m', 'drap-giuong-cotton', 500000, 0, 'pro-18.jpg', 0, 0, 4, 'Drap giường mềm mại, thấm hút tốt.', 0, 0, 0, 15, 1, NOW(), NOW()),
(19, 'Tủ đầu giường 2 ngăn', 'tu-dau-giuong', 1200000, 0, 'pro-19.jpg', 0, 0, 4, 'Tủ đầu giường gỗ MDF, màu sáng, tiện dụng.', 0, 0, 0, 8, 1, NOW(), NOW()),
(20, 'Đèn ngủ LED cảm ứng', 'den-ngu-led', 250000, 0, 'pro-20.jpg', 0, 0, 4, 'Đèn ngủ LED tiết kiệm điện, ánh sáng dịu.', 0, 0, 0, 25, 1, NOW(), NOW()),

-- Trang trí nhà cửa (category_id = 5)
(21, 'Tranh treo tường phong cảnh', 'tranh-treo-tuong', 550000, 0, 'pro-21.jpg', 0, 0, 5, 'Tranh phong cảnh in trên canvas, khung gỗ tự nhiên.', 0, 0, 0, 15, 1, NOW(), NOW()),
(22, 'Bình hoa sứ cao 30cm', 'binh-hoa-su', 320000, 0, 'pro-22.jpg', 0, 0, 5, 'Bình hoa sứ trơn, họa tiết nhẹ nhàng.', 0, 0, 0, 20, 1, NOW(), NOW()),
(23, 'Đèn bàn trang trí', 'den-ban-trang-tri', 450000, 0, 'pro-23.jpg', 0, 0, 5, 'Đèn bàn ánh sáng vàng, tạo không gian ấm áp.', 0, 0, 0, 12, 1, NOW(), NOW()),
(24, 'Kệ sách treo tường', 'ke-sach-treo-tuong', 600000, 0, 'pro-24.jpg', 0, 0, 5, 'Kệ sách treo tường bằng gỗ MDF, tiện dụng.', 0, 0, 0, 10, 1, NOW(), NOW()),
(25, 'Thảm trải sàn phòng khách', 'tham-trai-san', 700000, 0, 'pro-25.jpg', 0, 0, 5, 'Thảm trải sàn chất liệu mềm mại, chống trượt.', 0, 0, 0, 8, 1, NOW(), NOW()),

-- Vệ sinh – Giặt ủi (category_id = 6)
(26, 'Bộ lau nhà 360 độ', 'bo-lau-nha-360', 350000, 0, 'pro-26.jpg', 0, 0, 6, 'Bộ lau nhà xoay 360 độ, tiện lợi và nhanh khô.', 0, 0, 0, 25, 1, NOW(), NOW()),
(27, 'Máy giặt mini 7kg', 'may-giat-mini', 4500000, 0, 'pro-27.jpg', 0, 0, 6, 'Máy giặt mini 7kg, phù hợp gia đình nhỏ.', 0, 0, 0, 8, 1, NOW(), NOW()),
(28, 'Bàn ủi hơi nước Philips', 'ban-ui-hoi-nuoc', 650000, 0, 'pro-28.jpg', 0, 0, 6, 'Bàn ủi hơi nước, ủi quần áo nhanh và mượt.', 0, 0, 0, 12, 1, NOW(), NOW()),
(29, 'Giẻ lau đa năng', 'gie-lau-da-nang', 120000, 0, 'pro-29.jpg', 0, 0, 6, 'Giẻ lau sợi microfiber, hút nước tốt.', 0, 0, 0, 30, 1, NOW(), NOW()),
(30, 'Xô đựng nước 10L', 'xo-dung-nuoc', 150000, 0, 'pro-30.jpg', 0, 0, 6, 'Xô nhựa chịu lực, dung tích 10L.', 0, 0, 0, 20, 1, NOW(), NOW());
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
(1, 1, 'pro-1.jpg', NOW(), NOW()),
(2, 2, 'pro-2.jpg', NOW(), NOW()),
(3, 3, 'pro-3.jpg', NOW(), NOW()),
(4, 4, 'pro-4.jpg', NOW(), NOW()),
(5, 5, 'pro-5.jpg', NOW(), NOW()),
(6, 6, 'pro-6.jpg', NOW(), NOW()),
(7, 7, 'pro-7.jpg', NOW(), NOW()),
(8, 8, 'pro-8.jpg', NOW(), NOW()),
(9, 9, 'pro-9.jpg', NOW(), NOW()),
(10, 10, 'pro-10.jpg', NOW(), NOW()),
(11, 11, 'pro-11.jpg', NOW(), NOW()),
(12, 12, 'pro-12.jpg', NOW(), NOW()),
(13, 13, 'pro-13.jpg', NOW(), NOW()),
(14, 14, 'pro-14.jpg', NOW(), NOW()),
(15, 15, 'pro-15.jpg', NOW(), NOW()),
(16, 16, 'pro-16.jpg', NOW(), NOW()),
(17, 17, 'pro-17.jpg', NOW(), NOW()),
(18, 18, 'pro-18.jpg', NOW(), NOW()),
(19, 19, 'pro-19.jpg', NOW(), NOW()),
(20, 20, 'pro-20.jpg', NOW(), NOW()),
(21, 21, 'pro-21.jpg', NOW(), NOW()),
(22, 22, 'pro-22.jpg', NOW(), NOW()),
(23, 23, 'pro-23.jpg', NOW(), NOW()),
(24, 24, 'pro-24.jpg', NOW(), NOW()),
(25, 25, 'pro-25.jpg', NOW(), NOW()),
(26, 26, 'pro-26.jpg', NOW(), NOW()),
(27, 27, 'pro-27.jpg', NOW(), NOW()),
(28, 28, 'pro-28.jpg', NOW(), NOW()),
(29, 29, 'pro-29.jpg', NOW(), NOW()),
(30, 30, 'pro-30.jpg', NOW(), NOW());

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
(1, 3, 33, 'Xịn xứng đáng giá tiền', 5, '2025-06-01 09:50:43', '2025-06-01 09:50:43');

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
(83, 915000, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 0, 2, '2025-06-08 11:13:17', '2025-07-15 15:57:20'),
(84, 270750, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 0, 2, '2025-06-08 11:14:18', '2025-07-15 15:57:22'),
(85, 270750, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 2, 2, '2025-06-08 11:14:29', '2025-07-15 15:57:59'),
(86, 0, 33, 'Organic Water', 'admin1@gmail.com', '0778960422', 'Hà Nội', 2, 1, '2023-06-12 01:50:50', '2025-07-15 15:57:30'),
(87, 610000, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 1, 1, '2025-06-12 01:51:13', '2025-06-12 01:51:27'),
(88, 305000, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 1, 1, '2025-05-22 18:15:57', '2025-07-15 11:20:32'),
(89, 0, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 2, 1, '2025-06-30 15:28:50', '2025-07-15 15:41:26'),
(90, 0, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 1, 1, '2025-06-30 15:28:52', '2025-07-15 15:38:44'),
(91, 860750, 33, 'Organic Water', 'thong.phan109@gmail.com', '0778960401', 'K123/14 Đỗ Thúc Tịnh', 2, 1, '2025-07-15 12:02:32', '2025-07-15 15:35:30');

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



