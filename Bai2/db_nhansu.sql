-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 02, 2019 lúc 11:37 AM
-- Phiên bản máy phục vụ: 10.4.8-MariaDB
-- Phiên bản PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_nhansu`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dean`
--

CREATE TABLE `dean` (
  `tenda` varchar(255) NOT NULL,
  `mada` int(11) NOT NULL,
  `ddiem_da` varchar(255) NOT NULL,
  `phg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `dean`
--

INSERT INTO `dean` (`tenda`, `mada`, `ddiem_da`, `phg`) VALUES
('Sản phẩm X', 1, 'Quy Nhơn', 5),
('Sản phẩm Y', 2, 'Nha Trang', 5),
('Sản phẩm Z', 3, 'TP HCM', 5),
('Tin học hóa', 10, 'Bình Dương', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `honv` varchar(50) NOT NULL,
  `tenlot` varchar(50) NOT NULL,
  `tennv` varchar(50) NOT NULL,
  `phai` varchar(20) NOT NULL,
  `luong` int(11) NOT NULL,
  `manv` int(11) NOT NULL,
  `ngsinh` date NOT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `phg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`honv`, `tenlot`, `tennv`, `phai`, `luong`, `manv`, `ngsinh`, `diachi`, `phg`) VALUES
('Đinh', 'Lê', 'Tiên', 'Nam', 4000, 123456789, '1965-09-01', 'Nguyễn Trãi, Q5', 1),
('Nguyễn', 'Thị', 'Loan', 'Nữ', 2500, 333445555, '1955-12-08', 'Nguyễn Huệ, Q1', 5),
('Trần', 'Thanh', 'Tâm', 'Nam', 3800, 453453453, '1972-07-31', 'Trần Não, Q2', 2),
('Nguyễn', 'Lan', 'Anh', 'Nữ', 4300, 666884444, '1962-09-15', 'Lê Lợi, Q1', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phancong`
--

CREATE TABLE `phancong` (
  `manv` int(11) NOT NULL,
  `mada` int(11) NOT NULL,
  `sogio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `phancong`
--

INSERT INTO `phancong` (`manv`, `mada`, `sogio`) VALUES
(123456789, 1, 32),
(123456789, 2, 8),
(453453453, 1, 20),
(666884444, 3, 40);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phongban`
--

CREATE TABLE `phongban` (
  `phg` int(11) NOT NULL,
  `tenphg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `phongban`
--

INSERT INTO `phongban` (`phg`, `tenphg`) VALUES
(1, 'Nhân sự'),
(2, 'Kế hoạch'),
(3, 'Kinh doanh'),
(4, 'Marketing'),
(5, 'Kế toán');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `dean`
--
ALTER TABLE `dean`
  ADD PRIMARY KEY (`mada`),
  ADD KEY `phg` (`phg`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`manv`),
  ADD KEY `phg` (`phg`);

--
-- Chỉ mục cho bảng `phancong`
--
ALTER TABLE `phancong`
  ADD PRIMARY KEY (`manv`,`mada`),
  ADD KEY `mada` (`mada`);

--
-- Chỉ mục cho bảng `phongban`
--
ALTER TABLE `phongban`
  ADD PRIMARY KEY (`phg`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `dean`
--
ALTER TABLE `dean`
  MODIFY `mada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `phongban`
--
ALTER TABLE `phongban`
  MODIFY `phg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `dean`
--
ALTER TABLE `dean`
  ADD CONSTRAINT `dean_ibfk_1` FOREIGN KEY (`phg`) REFERENCES `phongban` (`phg`);

--
-- Các ràng buộc cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`phg`) REFERENCES `phongban` (`phg`);

--
-- Các ràng buộc cho bảng `phancong`
--
ALTER TABLE `phancong`
  ADD CONSTRAINT `phancong_ibfk_1` FOREIGN KEY (`manv`) REFERENCES `nhanvien` (`manv`),
  ADD CONSTRAINT `phancong_ibfk_2` FOREIGN KEY (`mada`) REFERENCES `dean` (`mada`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
