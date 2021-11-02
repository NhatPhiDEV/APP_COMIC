-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2021 at 05:30 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testmanga`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `ID` int(11) NOT NULL,
  `Link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`ID`, `Link`) VALUES
(1, 'http://10.0.2.2:3000/dragonball.png'),
(2, 'http://10.0.2.2:3000/doreamon.png'),
(3, 'http://10.0.2.2:3000/adventuretime.png');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `Name`) VALUES
(47, 'Cổ Trang'),
(48, 'Trinh Thám'),
(49, 'Phiêu lưu'),
(50, 'Khoa Học Viễn Tưởng'),
(51, 'Marvel'),
(52, 'Tiên Hiệp'),
(53, 'Chính Sử'),
(54, 'Chiến Tranh'),
(55, 'Tứ đại danh tác'),
(56, 'Siêu nhân');

-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
  `ID` int(11) NOT NULL,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `MangaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`ID`, `Name`, `MangaID`) VALUES
(13, 'Chapter 1', 1),
(14, 'Chapter 2', 1),
(37, 'Chapter 3', 1),
(38, 'Chapter 1: Thăm công viên khủng long', 3),
(39, 'Chapter 2: Bí mật hành tinh màu tím', 3),
(40, 'Chapter 3: Pho tượng thần khổng lồ', 3),
(41, 'Chapter 4: Lâu đài dưới đáy biển', 3),
(42, 'Chapter 5: Nobita lạc vào xứ quỷ', 3),
(43, 'Chapter 6: Nobita và cuộc chiến vũ trụ', 3),
(44, 'Chapter 7: Cuộc xăm lăng của binh đoàn Robot', 3),
(45, 'Chapter 8: Cuộc phiêu lưu vào lòng đất', 3),
(46, 'Chapter 9: Chiến thắng quỷ Kamat', 3),
(47, 'Chapter 10: Ngôi sao cảm', 3),
(48, 'Chapter 11: Vương quốc trên mây', 3),
(49, 'Chapter 12: Ba chàng hiệp sĩ mộng mơ', 3),
(50, 'Chapter 13: Hành trình qua dãy ngân hà', 3),
(51, 'Chapter 1: Thám tử bị teo nhỏ', 2),
(52, 'Chapter 2: Thám tử bị cô lập', 2),
(53, 'Chapter 3: Óng khói thứ 6', 2),
(54, 'Chapter 4: Thêm một trọng tội', 2),
(55, 'Chapter 5: Thám tử gà mờ thành thám tử tài ba', 2),
(56, 'Chapter 6: Người giống người', 2),
(57, 'Chapter 7: Sự hiểu lầm đáng tiếc', 2),
(58, 'Chapter 8: Bằng chứng ngoại phạm hoàn hảo', 2);

-- --------------------------------------------------------

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `ID` int(11) NOT NULL,
  `Link` text NOT NULL,
  `ChapterID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `link`
--

INSERT INTO `link` (`ID`, `Link`, `ChapterID`) VALUES
(1, 'https://upload.dragonballwiki.net/manga/dbrise/01/01.jpg', 13),
(2, 'https://upload.dragonballwiki.net/manga/dbrise/01/02.png', 13),
(3, 'https://upload.dragonballwiki.net/manga/dbrise/01/03.png', 13),
(4, 'https://upload.dragonballwiki.net/manga/dbrise/01/04.png', 13),
(5, 'https://upload.dragonballwiki.net/manga/dbrise/01/05.png', 13),
(6, 'https://upload.dragonballwiki.net/manga/dbrise/01/06.png', 13),
(7, 'https://upload.dragonballwiki.net/manga/dbrise/01/07.png', 13),
(8, 'https://upload.dragonballwiki.net/manga/dbrise/01/08.png', 13),
(9, 'https://upload.dragonballwiki.net/manga/dbrise/01/09.png', 13),
(10, 'https://upload.dragonballwiki.net/manga/dbrise/01/10.png', 13),
(11, 'https://upload.dragonballwiki.net/manga/dbrise/01/11.png', 13),
(12, 'https://upload.dragonballwiki.net/manga/dbrise/02/01.jpg', 14),
(13, 'https://upload.dragonballwiki.net/manga/dbrise/02/02.jpg', 14),
(14, 'https://upload.dragonballwiki.net/manga/dbrise/02/03.png', 14),
(15, 'https://upload.dragonballwiki.net/manga/dbrise/02/04.png', 14),
(16, 'https://upload.dragonballwiki.net/manga/dbrise/02/05.png', 14),
(17, 'https://upload.dragonballwiki.net/manga/dbrise/02/06.jpg', 14),
(18, 'https://upload.dragonballwiki.net/manga/dbrise/02/07.jpg', 14),
(19, 'https://upload.dragonballwiki.net/manga/dbrise/02/08.png', 14),
(21, 'https://upload.dragonballwiki.net/manga/dbrise/02/09.png', 14),
(22, 'https://upload.dragonballwiki.net/manga/dbrise/02/10.jpg', 14),
(23, 'https://upload.dragonballwiki.net/manga/dbrise/02/11.jpg', 14),
(24, 'https://upload.dragonballwiki.net/manga/dbrise/02/11.jpg', 14),
(25, 'https://upload.dragonballwiki.net/manga/dbrise/03/00.jpg', 37),
(26, 'https://upload.dragonballwiki.net/manga/dbrise/03/01.jpg', 37),
(27, 'https://upload.dragonballwiki.net/manga/dbrise/03/02.jpg', 37),
(28, 'https://upload.dragonballwiki.net/manga/dbrise/03/03.jpg', 37),
(29, 'https://upload.dragonballwiki.net/manga/dbrise/03/04.jpg', 37),
(30, 'https://upload.dragonballwiki.net/manga/dbrise/03/05.jpg', 37),
(33, 'https://upload.dragonballwiki.net/manga/dbrise/03/06.jpg', 37),
(34, 'https://upload.dragonballwiki.net/manga/dbrise/03/07.jpg', 37),
(37, 'https://upload.dragonballwiki.net/manga/dbrise/03/08.jpg', 37),
(38, 'https://upload.dragonballwiki.net/manga/dbrise/03/09.jpg', 37),
(41, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_3.jpg', 38),
(42, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_4.jpg', 38),
(43, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_5.jpg', 38),
(44, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_6.jpg', 38),
(47, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_7.jpg', 38),
(48, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_8.jpg', 38),
(51, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_9.jpg', 38),
(52, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_10.jpg', 38),
(53, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_11.jpg', 38),
(54, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_12.jpg', 38),
(55, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_13.jpg', 38),
(56, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_14.jpg', 38),
(57, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_15.jpg', 38),
(58, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_16.jpg', 38),
(59, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_17.jpg', 38),
(60, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_18.jpg', 38),
(61, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_19.jpg', 38),
(62, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_20.jpg', 38),
(63, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_21.jpg', 38),
(64, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_22.jpg', 38),
(65, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_23.jpg', 38),
(66, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_24.jpg', 38),
(67, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_25.jpg', 38),
(68, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_26.jpg', 38),
(69, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_27.jpg', 38),
(70, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_28.jpg', 38),
(71, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_29.jpg', 38),
(72, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_30.jpg', 38),
(73, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_31.jpg', 38),
(74, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_32.jpg', 38),
(75, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_33.jpg', 38),
(76, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_34.jpg', 38),
(77, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_35.jpg', 38),
(78, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_36.jpg', 38),
(79, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_37.jpg', 38),
(80, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_38.jpg', 38),
(81, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_39.jpg', 38),
(82, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_40.jpg', 38),
(83, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_41.jpg', 38),
(84, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_42.jpg', 38),
(85, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_43.jpg', 38),
(86, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_44.jpg', 38),
(87, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_45.jpg', 38),
(88, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_46.jpg', 38),
(89, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_47.jpg', 38),
(90, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_48.jpg', 38),
(91, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_49.jpg', 38),
(92, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_1_tham_cong_vien_khung_long_50.jpg', 38),
(93, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_2_bi_mat_hanh_tinh_mau_tim_1.JPG', 39),
(94, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_2_bi_mat_hanh_tinh_mau_tim_2.JPG', 39),
(95, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_2_bi_mat_hanh_tinh_mau_tim_3.JPG', 39),
(96, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_2_bi_mat_hanh_tinh_mau_tim_4.JPG', 39),
(97, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_2_bi_mat_hanh_tinh_mau_tim_5.JPG', 39),
(98, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_2_bi_mat_hanh_tinh_mau_tim_6.JPG', 39),
(99, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_2_bi_mat_hanh_tinh_mau_tim_7.JPG', 39),
(100, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_2_bi_mat_hanh_tinh_mau_tim_8.JPG', 39),
(101, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_2_bi_mat_hanh_tinh_mau_tim_9.JPG', 39),
(102, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_2_bi_mat_hanh_tinh_mau_tim_10.JPG', 39),
(103, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_3.jpg', 40),
(104, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_4.jpg', 40),
(105, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_5.jpg', 40),
(106, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_6.jpg', 40),
(107, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_7.jpg', 40),
(108, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_8.jpg', 40),
(109, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_9.jpg', 40),
(110, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_10.jpg', 40),
(111, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_11.jpg', 40),
(112, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_12.jpg', 40),
(113, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_13.jpg', 40),
(114, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_14.jpg', 40),
(115, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_15.jpg', 40),
(116, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_16.jpg', 40),
(117, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_17.jpg', 40),
(118, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_18.jpg', 40),
(119, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_19.jpg', 40),
(120, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_3_pho_tuong_than_khong_lo_20.jpg', 40),
(121, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_4_lau_dai_duoi_day_bien_1.jpg', 41),
(122, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_4_lau_dai_duoi_day_bien_2.jpg', 41),
(123, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_4_lau_dai_duoi_day_bien_3.jpg', 41),
(124, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_4_lau_dai_duoi_day_bien_4.jpg', 41),
(125, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_5_nobita_lac_vao_xu_quy_3.jpg', 42),
(126, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_5_nobita_lac_vao_xu_quy_4.jpg', 42),
(127, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_5_nobita_lac_vao_xu_quy_5.jpg', 42),
(128, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_5_nobita_lac_vao_xu_quy_6.jpg', 42),
(129, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_6_ten_doc_tai_vu_tru_1.jpg', 43),
(130, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_6_ten_doc_tai_vu_tru_2.jpg', 43),
(131, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_6_ten_doc_tai_vu_tru_3.jpg', 43),
(132, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_6_ten_doc_tai_vu_tru_4.jpg', 43),
(133, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_7_cuoc_xam_lang_cua_binh_doan_robot_2.jpg', 44),
(134, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_7_cuoc_xam_lang_cua_binh_doan_robot_4.jpg', 44),
(135, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_7_cuoc_xam_lang_cua_binh_doan_robot_5.jpg', 44),
(136, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_7_cuoc_xam_lang_cua_binh_doan_robot_6.jpg', 44),
(137, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_7_cuoc_xam_lang_cua_binh_doan_robot_7.jpg', 44),
(138, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_7_cuoc_xam_lang_cua_binh_doan_robot_8.jpg', 44),
(139, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_8_cuoc_phieu_luu_vao_long_dat_1.jpg', 45),
(140, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_8_cuoc_phieu_luu_vao_long_dat_2.jpg', 45),
(141, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_8_cuoc_phieu_luu_vao_long_dat_3.jpg', 45),
(142, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_8_cuoc_phieu_luu_vao_long_dat_4.jpg', 45),
(143, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_8_cuoc_phieu_luu_vao_long_dat_5.jpg', 45),
(144, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_8_cuoc_phieu_luu_vao_long_dat_6.jpg', 45),
(145, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_9_chien_thang_quy_kamat_2.jpg', 46),
(146, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_9_chien_thang_quy_kamat_3.jpg', 46),
(147, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_9_chien_thang_quy_kamat_4.jpg', 46),
(148, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_9_chien_thang_quy_kamat_5.jpg', 46),
(149, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_9_chien_thang_quy_kamat_6.jpg', 46),
(150, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_9_chien_thang_quy_kamat_7.jpg', 46),
(151, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_9_chien_thang_quy_kamat_8.jpg', 46),
(152, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_9_chien_thang_quy_kamat_9.jpg', 46),
(153, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_9_chien_thang_quy_kamat_10.jpg', 46),
(154, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doraemon_truyen_dai_tap_9_chien_thang_quy_kamat_11.jpg', 46),
(155, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doc_truyen_tranh_conan_chap_2_1.jpg', 51),
(156, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doc_truyen_tranh_conan_chap_2_2.jpg', 51),
(157, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doc_truyen_tranh_conan_chap_3_1.jpg', 52),
(158, 'http://doctruyentranh.net.vn/ckfinder/userfiles/images/doc_truyen_tranh_conan_chap_3_2.jpg', 52);

-- --------------------------------------------------------

--
-- Table structure for table `manga`
--

DROP TABLE IF EXISTS `manga`;
CREATE TABLE `manga` (
  `ID` int(11) NOT NULL,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manga`
--

INSERT INTO `manga` (`ID`, `Name`, `Image`) VALUES
(1, 'Dragon Ball', 'https://dragonballwiki.net/doctruyen/wp-content/themes/truyenfull/timthumb.php?src=https://dragonballwiki.net/doctruyen/wp-content/uploads/2021/04/rrise.jpg&h=324&w=221&q=80'),
(2, 'Conan', 'https://tuoitho.mobi/upload/doc-truyen/conan-bo-dac-biet/anh-dai-dien.jpg'),
(3, 'Doraemon', 'https://images-na.ssl-images-amazon.com/images/I/51NYhOsPSSL._SX365_BO1,204,203,200_.jpg'),
(4, 'OnePiece', 'https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/2/5/photo-1-16124920381911238607906.png'),
(5, 'Iron Man', 'https://cdn.shopify.com/s/files/1/0882/5118/products/Invincible-Iron-Man-Number-1-2137789_1024x1024.jpeg?v=1442250415'),
(6, 'Ant-Man', 'https://i.pinimg.com/originals/66/41/b1/6641b10b731f0140a90c5a7fa641daf9.jpg'),
(7, 'Marvel Zombies', 'http://1.bp.blogspot.com/-vNUqD-HUcdQ/Vp5GXqrP7fI/AAAAAAAAIEE/OSIFYvS3D7k/s1600/0.jpg'),
(8, 'Adventures', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKWBY9fuCKhnDI-wwoXwJ6zF1O6x9ELBaE7Y4YwAK1LahojieB'),
(9, 'Cable', 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/494347/494347._SX1280_QL80_TTD_.jpg'),
(10, 'Cốt cách mỹ nhân', 'https://doctruyenonline.club/wp-content/uploads/2020/09/cot-cach-my-nhan-cover-193x278.jpg'),
(11, 'Avengers', 'https://www.librairiezbookstore.com/40046-large_default/marvel-comics-digest-7-ant-man.jpg'),
(12, 'Naruto', 'https://upload.wikimedia.org/wikipedia/vi/thumb/c/c7/Naruto_Volume_1_manga_cover.jpg/330px-Naruto_Volume_1_manga_cover.jpg'),
(13, 'X-men', 'https://darksidecomics.s3.us-east-2.amazonaws.com/previews/AUG181583.jpg?lastmod=1533154926'),
(14, 'DC Essential', 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/332255/332255._SX1280_QL80_TTD_.jpg'),
(15, 'Aqua Man', 'https://d1466nnw0ex81e.cloudfront.net/n_iv/600/3723215.jpg'),
(16, 'Tam Quốc Chí', 'http://3.bp.blogspot.com/-VuIBWef2yZI/Uw3kOxd23WI/AAAAAAAAWmk/5B0DwoOWGX8/s0/1.jpg1.jpg'),
(17, 'Batman', 'http://4.bp.blogspot.com/-UVWO6oyjJqU/U_3jLJzL3MI/AAAAAAAEnhQ/_SyLqkLRvVo/s1600/-000.jpg'),
(18, 'Tây Du Ký', 'https://salt.tikicdn.com/ts/product/aa/15/f1/3d46eee0fd26ab818aeb25d77cb26ffa.jpg'),
(19, 'Hồng Lâu Mộng', 'https://product.hstatic.net/200000122283/product/h-hong-lau-mong-quyen-ha-tu-dai-danh-tac-trung-hoa-lien-hoan-hoa-gknoy_fcaf9dd956574956af9f8b620990526c_master.gif'),
(20, 'Thủy hử', 'https://product.hstatic.net/200000122283/product/n-tranh-thuy-hu-quyen-ha-tu-dai-danh-tac-trung-hoa-lien-hoan-hoa-g2b09_d181d094bcb54474b178a28913579c55_master.gif');

-- --------------------------------------------------------

--
-- Table structure for table `mangacategory`
--

DROP TABLE IF EXISTS `mangacategory`;
CREATE TABLE `mangacategory` (
  `MangaID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mangacategory`
--

INSERT INTO `mangacategory` (`MangaID`, `CategoryID`) VALUES
(1, 49),
(2, 48),
(3, 49),
(4, 49),
(5, 50),
(5, 51),
(6, 56),
(7, 51),
(10, 47),
(16, 47),
(16, 53),
(16, 54),
(16, 55),
(18, 55),
(19, 47),
(19, 53),
(19, 55),
(20, 47),
(20, 53),
(20, 54),
(20, 55);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MangaID` (`MangaID`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ChapterID` (`ChapterID`);

--
-- Indexes for table `manga`
--
ALTER TABLE `manga`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mangacategory`
--
ALTER TABLE `mangacategory`
  ADD PRIMARY KEY (`MangaID`,`CategoryID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `chapter`
--
ALTER TABLE `chapter`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `manga`
--
ALTER TABLE `manga`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chapter`
--
ALTER TABLE `chapter`
  ADD CONSTRAINT `chapter_ibfk_1` FOREIGN KEY (`MangaID`) REFERENCES `manga` (`ID`);

--
-- Constraints for table `link`
--
ALTER TABLE `link`
  ADD CONSTRAINT `link_ibfk_1` FOREIGN KEY (`ChapterID`) REFERENCES `chapter` (`ID`);

--
-- Constraints for table `mangacategory`
--
ALTER TABLE `mangacategory`
  ADD CONSTRAINT `mangacategory_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`),
  ADD CONSTRAINT `mangacategory_ibfk_2` FOREIGN KEY (`MangaID`) REFERENCES `manga` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
