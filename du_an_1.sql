-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 11, 2023 lúc 10:14 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duan1`
--
CREATE DATABASE IF NOT EXISTS `duan1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `duan1`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bienthe`
--

CREATE TABLE `bienthe` (
  `id` int(10) NOT NULL,
  `tenbienthe` varchar(10) NOT NULL,
  `giatribienthe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bienthe`
--

INSERT INTO `bienthe` (`id`, `tenbienthe`, `giatribienthe`) VALUES
(1, 'size', 'l'),
(2, 'color', 'red'),
(3, 'size', 's'),
(4, 'color', 'blue');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bienthesanpham`
--

CREATE TABLE `bienthesanpham` (
  `idsanpham` int(10) NOT NULL,
  `idbienthe` int(10) NOT NULL,
  `soluong` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bienthesanpham`
--

INSERT INTO `bienthesanpham` (`idsanpham`, `idbienthe`, `soluong`) VALUES
(1, 1, 5),
(1, 2, 5),
(3, 3, 3),
(3, 2, 3),
(2, 3, 1),
(2, 4, 1),
(4, 3, 8),
(4, 4, 8),
(5, 3, 1),
(5, 4, 1),
(6, 3, 5),
(6, 4, 5),
(7, 3, 7),
(7, 4, 7),
(8, 3, 7),
(8, 4, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(10) NOT NULL,
  `noidung` text NOT NULL,
  `idtaikhoan` int(10) NOT NULL,
  `idsanpham` int(10) NOT NULL,
  `ngaybinhluan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(10) NOT NULL,
  `ten_danh_muc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `ten_danh_muc`) VALUES
(1, 'ao bong da 1'),
(2, 'ao bong da 2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` int(10) NOT NULL,
  `tentaikhoan` varchar(50) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `sdt` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pttt` tinyint(1) NOT NULL DEFAULT 1,
  `ngaydathang` varchar(30) NOT NULL,
  `tongtien` int(10) NOT NULL,
  `trangthai` tinyint(1) NOT NULL DEFAULT 1,
  `idtaikhoan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `id` int(10) NOT NULL,
  `idtaikhoan` int(10) NOT NULL,
  `idsanpham` int(10) NOT NULL,
  `anhsanpham` varchar(255) NOT NULL,
  `tensanpham` varchar(50) NOT NULL,
  `giasanpham` int(10) NOT NULL,
  `giasale` int(10) NOT NULL,
  `soluong` int(10) NOT NULL,
  `thanhtien` int(10) NOT NULL,
  `iddonhang` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(10) NOT NULL,
  `tensanpham` varchar(50) NOT NULL,
  `giasanpham` int(10) NOT NULL,
  `giasale` int(10) DEFAULT NULL,
  `anhsanpham` varchar(255) NOT NULL,
  `motasanpham` varchar(255) NOT NULL,
  `luotxem` int(10) NOT NULL,
  `iddanhmuc` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensanpham`, `giasanpham`, `giasale`, `anhsanpham`, `motasanpham`, `luotxem`, `iddanhmuc`) VALUES
(1, 'ao ronanlo', 4444, 5555555, 'áo đá bóng (1).jpg', 'binh le', 0, 1),
(2, 'ao huu thuc', 600000, 8000000, 'áo đá bóng (2).jpg', 'ok ok', 0, 2),
(3, 'ao messsis', 88888, 90000000, 'áo MC xanh.jpg', 'eeeeeeeeeeee', 0, 1),
(4, 'bing le', 222222, 2147483647, 'áo Mu đỏ.jpg', '8888', 0, 1),
(5, 'anh dep', 222222, 9999999, 'anh 03a.jpg', '0uu', 0, 2),
(6, 'may tinh 3', 333, 55555, 'suplo.jpg', '555', 0, 2),
(7, 'Khanh', 222222, 7777, 'songo.png', '77', 0, 1),
(8, 'Binh le', 444, 777777777, 'backgroud phong canh.jpg', '77', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(10) NOT NULL,
  `tentaikhoan` varchar(50) NOT NULL,
  `matkhau` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `sdt` varchar(20) DEFAULT NULL,
  `chucvu` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bienthe`
--
ALTER TABLE `bienthe`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bienthesanpham`
--
ALTER TABLE `bienthesanpham`
  ADD KEY `idbienthe` (`idbienthe`),
  ADD KEY `idsanpham` (`idsanpham`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idsanpham` (`idsanpham`),
  ADD KEY `idtaikhoan` (`idtaikhoan`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtaikhoan` (`idtaikhoan`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iddonhang` (`iddonhang`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iddanhmuc` (`iddanhmuc`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bienthe`
--
ALTER TABLE `bienthe`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bienthesanpham`
--
ALTER TABLE `bienthesanpham`
  ADD CONSTRAINT `bienthesanpham_ibfk_1` FOREIGN KEY (`idbienthe`) REFERENCES `bienthe` (`id`),
  ADD CONSTRAINT `bienthesanpham_ibfk_2` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `binhluan_ibfk_1` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`),
  ADD CONSTRAINT `binhluan_ibfk_2` FOREIGN KEY (`idtaikhoan`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`idtaikhoan`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`iddonhang`) REFERENCES `donhang` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`iddanhmuc`) REFERENCES `danhmuc` (`id`);
--
-- Cơ sở dữ liệu: `duanmau1`
--
CREATE DATABASE IF NOT EXISTS `duanmau1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `duanmau1`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `namedm` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `namedm`) VALUES
(3, 'KAWASAKI'),
(5, 'AUDI1'),
(15, 'ssssss11333'),
(17, 'AUDI444'),
(18, 'cviec');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `productsid` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `noidungcmt` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `productsid`, `time`, `noidungcmt`) VALUES
(1, 11, '2023-06-08 02:09:47', 'binh le đã đánh giá 5 sao cho sản phẩm này \r\n'),
(3, 12, '2023-06-08 02:33:44', 'Hữu Thức Đã Đánh Giá sản phảm rất tốt giá cả phải chăng'),
(4, 9, '2023-06-15 02:51:33', 'khuyến nghị các đơn vị sử dụng kết quả bài thi HSA cho các mục đích khác nhau trong thời gian hai năm kể từ ngày thi được ghi trên Phiếu báo điểm HSA');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `namesp` varchar(255) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `img` text NOT NULL,
  `mota` text NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `idcategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `namesp`, `price`, `img`, `mota`, `view`, `idcategory`) VALUES
(9, 'ZX25r', 33333, 'xe7.png', 'TỔNG QUAN\r\nMột ví dụ điển hình về Hiệu suất Huyền thoại từ các cỗ máy dòng Ninja ZX của Kawasaki, Siêu phẩm supersport 250 phân khối này chính là hiện thực của một giấc mơ được mong đợi từ lâu. Chính sự chính xác cao của khối động cơ 250 cm³ 4 xi-lanh thẳng hàng đã mang đến sức mạnh ở vòng tua cao, dẫn đầu phân khúc. Được trang bị hàng loạt các tính năng điện tử hiện đại cùng hệ thống khung gầm mới, Ninja ZX-25R mang lại hiệu suất vượt trội cho bất kỳ hành trình nào.', 164, 3),
(11, 'vip boy', 300000, 'xe8.png', 'see', 51, 5),
(12, 'NinjaH25', 4444, 'xe1.png', 'Xử lý yêu cầu bình luận: Khi người dùng gửi bình luận, bạn cần xử lý yêu cầu này trên phía máy chủ. Tạo một API để nhận bình luận mới, xác thực người dùng (nếu cần), và lưu trữ bình luận vào cơ sở dữ liệu', 54, 3),
(23, 'bing le', 33333, 'xe3.png', 'dd', 5, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `user`, `password`, `email`, `address`, `tel`, `role`) VALUES
(7, 'binhle', 'ffff', 'hianh1868@gmail.com', NULL, NULL, 1),
(9, 'binhle1', 'ffff', 'binhlexxxx1@gmail.com', NULL, NULL, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productsid` (`productsid`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`productsid`) REFERENCES `products` (`id`);
--
-- Cơ sở dữ liệu: `duanmau2023`
--
CREATE DATABASE IF NOT EXISTS `duanmau2023` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `duanmau2023`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(10) NOT NULL,
  `iduser` int(10) NOT NULL,
  `idpro` int(10) NOT NULL,
  `ngay_bl` varchar(40) NOT NULL,
  `noidung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `iduser`, `idpro`, `ngay_bl`, `noidung`) VALUES
(26, 0, 21, '01:18:18pm 12/06/2023', 'ddd'),
(27, 0, 22, '04:40:41am 16/06/2023', 'eeeee');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `name`) VALUES
(12, 'KAW'),
(13, 'BMV'),
(14, 'AUDI'),
(15, 'DUCATI'),
(16, 'binh le nha');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double(10,2) DEFAULT 0.00,
  `img` varchar(255) DEFAULT NULL,
  `mota` text DEFAULT NULL,
  `luotxem` int(11) NOT NULL DEFAULT 0,
  `iddm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `name`, `price`, `img`, `mota`, `luotxem`, `iddm`) VALUES
(23, 'ninja H2', 333333.00, 'xe5.png', 'san pham mang itnh dot pha moi', 33, 12),
(24, 'vvvvv', 44444.00, 'xe4.png', 'fffffffffffffffffff', 1, 15),
(25, 'Z1000', 44444444.00, 'xe8.png', 'Kawasaki Z1000 và Z1000 R Edition 2022 về Việt Nam, giá từ 425 triệu đồng\r\nVisit\r\nImages may be subject to copyright. Learn mo', 5, 15),
(26, 'zx25R', 5667474.00, 'xe7.png', 'Kawasaki Z1000 và Z1000 R Edition 2022 về Việt Nam, giá từ 425 triệu đồng\r\nVisit\r\nImages may be subject to copyright. Learn mo', 10, 13),
(27, 'ninja 333', 665474.00, 'xe2.png', 'Kawasaki Z1000 và Z1000 R Edition 2022 về Việt Nam, giá từ 425 triệu đồng\r\nVisit\r\nImages may be subject to copyright. Learn mo', 1, 12),
(28, 'zx25Rooo', 3422222.00, 'xe1.png', 'Kawasaki Z1000 và Z1000 R Edition 2022 về Việt Nam, giá từ 425 triệu đồng\r\nVisit\r\nImages may be subject to copyright. Learn mo', 1, 15),
(29, 'ninja H555', 444444.00, 'xe8.png', 'Kawasaki Z1000 và Z1000 R Edition 2022 về Việt Nam, giá từ 425 triệu đồng\r\nVisit\r\nImages may be subject to copyright. Learn mo', 4, 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `user`, `password`, `email`, `address`, `tel`, `role`) VALUES
(7, 'binhle', 'ffff', 'hianh1868@gmail.com', NULL, NULL, 1),
(9, 'binhle1', 'ffff', 'binhlexxxx1@gmail.com', NULL, NULL, 0),
(10, 'binhle2504', '2504', 'hianh1868@gmail.com', NULL, NULL, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pro_id` (`idpro`),
  ADD KEY `user_id` (`iduser`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `LK_iddm_` (`iddm`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `LK_iddm_` FOREIGN KEY (`iddm`) REFERENCES `danhmuc` (`id`);
--
-- Cơ sở dữ liệu: `du_an_1`
--
CREATE DATABASE IF NOT EXISTS `du_an_1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `du_an_1`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(10) NOT NULL,
  `noidung` text NOT NULL,
  `idtaikhoan` int(10) NOT NULL,
  `idsanpham` int(10) NOT NULL,
  `ngaybinhluan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `noidung`, `idtaikhoan`, `idsanpham`, `ngaybinhluan`) VALUES
(1, 'hhh', 1, 6, '10:45:35am 07/08/2023');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(10) NOT NULL,
  `tendanhmuc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `tendanhmuc`) VALUES
(1, 'ao bong da 1'),
(2, 'ao bong da 2'),
(3, 'ao bong da 3'),
(4, 'ao bong da 3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` int(10) NOT NULL,
  `tentaikhoan` varchar(50) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `sdt` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pttt` tinyint(1) NOT NULL DEFAULT 1,
  `ngaydathang` varchar(30) NOT NULL,
  `tongtien` int(10) NOT NULL,
  `trangthai` tinyint(1) NOT NULL DEFAULT 1,
  `idtaikhoan` int(10) NOT NULL,
  `tongsoluongsanpham` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`id`, `tentaikhoan`, `diachi`, `sdt`, `email`, `pttt`, `ngaydathang`, `tongtien`, `trangthai`, `idtaikhoan`, `tongsoluongsanpham`) VALUES
(1, 'binhle', 'dee', '0392040873', 'hianh1868@gmail.com', 1, '11:38:59am 07/08/2023', 1649997, 1, 1, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `id` int(10) NOT NULL,
  `idtaikhoan` int(10) NOT NULL,
  `idsanpham` int(10) NOT NULL,
  `anhsanpham` varchar(255) NOT NULL,
  `tensanpham` varchar(255) NOT NULL,
  `giagoc` int(10) NOT NULL,
  `giasale` int(10) NOT NULL,
  `soluong` int(10) NOT NULL,
  `thanhtien` int(10) NOT NULL,
  `size` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `iddonhang` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`id`, `idtaikhoan`, `idsanpham`, `anhsanpham`, `tensanpham`, `giagoc`, `giasale`, `soluong`, `thanhtien`, `size`, `color`, `iddonhang`) VALUES
(1, 1, 18, 'áo đá bóng (7).jpg', '55', 555555, 55555, 3, 166665, 'S', 'Đỏ', 1),
(2, 1, 13, 'áo đá bóng (6).jpg', '40000', 4444444, 494444, 3, 1483332, 'XL', 'Đỏ', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(10) NOT NULL,
  `tensanpham` varchar(50) NOT NULL,
  `giagoc` varchar(50) NOT NULL,
  `giasale` varchar(50) NOT NULL,
  `anhsanpham` varchar(255) NOT NULL,
  `size` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `soluong` int(10) NOT NULL,
  `mota` varchar(255) NOT NULL,
  `luotxem` int(10) NOT NULL,
  `iddanhmuc` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensanpham`, `giagoc`, `giasale`, `anhsanpham`, `size`, `color`, `soluong`, `mota`, `luotxem`, `iddanhmuc`) VALUES
(6, 'Khánh Dep Trai', '700.000', '500.000', 'áo đá bóng (10).jpg', 'S', 'Xanh dương', 6, 'Nhạc Trẻ 8X 9X Đời Đầu Hay Bất Hủ - 30 Bản Nhạc Xưa Chill 8X 9X Nhạc Nhẹ Thư Giãn Cho Quán CafeNhạc Trẻ 8X 9X Đời Đầu Hay Bất Hủ - 30 Bản Nhạc Xưa Chill 8X 9X Nhạc Nhẹ Thư Giãn Cho Quán Cafe', 63, 2),
(19, 'áo số 4', '200000', '100000', 'áo đá bóng (1).jpg', '44', 'Xanh dương', 100, 'jfrj', 0, 2),
(20, 'tes nha', '300000', '200000', 'áo đá bóng (2).jpg', 'M', 'Xanh lá', 6, '0', 0, 1),
(21, 'binhle', '600000', '500000', 'áo MC xanh.jpg', 'S', 'Vàng', 7, '77', 0, 1),
(22, 'tes nha', '9', '100000', 'áo Mu đỏ.jpg', 'S', 'Xanh lá,Xanh dương,Đen', 89, 'yyyyyy', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(10) NOT NULL,
  `tentaikhoan` varchar(50) NOT NULL,
  `matkhau` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `sdt` varchar(20) NOT NULL,
  `chucvu` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `tentaikhoan`, `matkhau`, `email`, `diachi`, `sdt`, `chucvu`) VALUES
(1, 'binhle', 'thanhbinh', 'hianh1868@gmail.com', '', '', 1),
(2, 'zxcvbnmlkjhgfdsaqwertyuiopzxc', 'gg', 'accfreefire2504@gmail.com', '', '', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtaikhoan` (`idtaikhoan`),
  ADD KEY `idsanpham` (`idsanpham`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iddonhang` (`iddonhang`),
  ADD KEY `idtaikhoan` (`idtaikhoan`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idanhmuc` (`iddanhmuc`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `binhluan_ibfk_1` FOREIGN KEY (`idtaikhoan`) REFERENCES `taikhoan` (`id`),
  ADD CONSTRAINT `binhluan_ibfk_2` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`iddonhang`) REFERENCES `donhang` (`id`),
  ADD CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`idtaikhoan`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`iddanhmuc`) REFERENCES `danhmuc` (`id`);
--
-- Cơ sở dữ liệu: `ontap1`
--
CREATE DATABASE IF NOT EXISTS `ontap1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci;
USE `ontap1`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id_cate` int(11) NOT NULL,
  `name_categoryname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id_cate`, `name_categoryname`) VALUES
(1, 'danh muc 1'),
(2, 'danh muc 2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `foods`
--

CREATE TABLE `foods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `foods`
--

INSERT INTO `foods` (`id`, `name`, `image`, `categoryId`) VALUES
(1, 'bing le', 'ỉonam.jpg', 1),
(2, 'bing le', 'ỉonam.jpg', 1),
(3, 'bing le', 'ỉonam.jpg', 1),
(10, 'vien nho 2', 'image 46.jpg', 2),
(11, 'hong hone gagaa', 'ỉonam.jpg', 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_cate`);

--
-- Chỉ mục cho bảng `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_foods_category` (`categoryId`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id_cate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `fk_foods_category` FOREIGN KEY (`categoryId`) REFERENCES `foods` (`id`);
--
-- Cơ sở dữ liệu: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Đang đổ dữ liệu cho bảng `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"side_menu\":\"true\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Đang đổ dữ liệu cho bảng `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'du_an_1', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"duan1\",\"duanmau1\",\"duanmau2023\",\"du_an_1\",\"ontap1\",\"phpmyadmin\",\"shop_x\",\"test\",\"thibl2\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Cấu trúc của bảng @TABLE@\",\"latex_structure_continued_caption\":\"Cấu trúc của bảng @TABLE@ (còn nữa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Nội dung của bảng @TABLE@\",\"latex_data_continued_caption\":\"Nội dung của bảng @TABLE@ (còn nữa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Đang đổ dữ liệu cho bảng `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"du_an_1\",\"table\":\"taikhoan\"},{\"db\":\"du_an_1\",\"table\":\"giohang\"},{\"db\":\"du_an_1\",\"table\":\"binhluan\"},{\"db\":\"du_an_1\",\"table\":\"sanpham\"},{\"db\":\"du_an_1\",\"table\":\"donhang\"},{\"db\":\"du_an_1\",\"table\":\"danhmuc\"},{\"db\":\"duan1\",\"table\":\"sanpham\"},{\"db\":\"duan1\",\"table\":\"donhang\"},{\"db\":\"duan1\",\"table\":\"danhmuc\"},{\"db\":\"duanmau1\",\"table\":\"category\"}]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Đang đổ dữ liệu cho bảng `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('du_an_1', 'binhluan', 'noidung'),
('du_an_1', 'giohang', 'anhsanpham'),
('du_an_1', 'sanpham', 'tensanpham'),
('duan1', 'binhluan', 'noidung'),
('duan1', 'donhang', 'tentaikhoan'),
('duan1', 'giohang', 'anhsanpham'),
('duan1', 'sanpham', 'tensanpham'),
('duanmau1', 'comment', 'noidungcmt'),
('ontap1', 'foods', 'name'),
('thibl2', 'car', 'name');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Đang đổ dữ liệu cho bảng `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'du_an_1', 'sanpham', '{\"sorted_col\":\"`sanpham`.`size` DESC\"}', '2023-08-07 03:00:40'),
('root', 'duanmau1', 'products', '{\"sorted_col\":\"`products`.`name` ASC\"}', '2023-06-10 19:26:22'),
('root', 'thibl2', 'category', '{\"sorted_col\":\"`category`.`name_category` ASC\"}', '2022-12-17 03:21:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Đang đổ dữ liệu cho bảng `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-08-11 08:14:11', '{\"Console\\/Mode\":\"show\",\"lang\":\"vi\",\"SendErrorReports\":\"always\",\"Console\\/Height\":-9.000603}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Chỉ mục cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Chỉ mục cho bảng `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Chỉ mục cho bảng `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Chỉ mục cho bảng `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Chỉ mục cho bảng `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Chỉ mục cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Chỉ mục cho bảng `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Chỉ mục cho bảng `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Chỉ mục cho bảng `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Chỉ mục cho bảng `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Cơ sở dữ liệu: `shop_x`
--
CREATE DATABASE IF NOT EXISTS `shop_x` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop_x`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(2) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(29, 'Điện Thoại'),
(30, 'Đồng Hồ'),
(31, 'Máy In'),
(32, 'Laptop'),
(33, 'Máy Tính Bảng'),
(43, 'Ốp lưng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `commnets`
--

CREATE TABLE `commnets` (
  `id` int(5) NOT NULL,
  `content` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `duyet` int(3) NOT NULL DEFAULT 0,
  `id_user` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `commnets`
--

INSERT INTO `commnets` (`id`, `content`, `img`, `date`, `duyet`, `id_user`, `id_prod`) VALUES
(43, 'TEST THU BINH LUAN\r\n', '', '2023-02-24 23:58:00', 1, 15, 74),
(44, 'test binh luan\r\n', '', '2023-02-25 12:10:00', 1, 18, 73),
(45, 'test nhieu binh luan', '', '2023-02-25 12:10:00', 1, 18, 73);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(5) NOT NULL,
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `img` text NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `sale` int(11) NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `tag` varchar(255) NOT NULL,
  `total_price_sale` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category`, `name`, `price`, `img`, `content`, `status`, `sale`, `view`, `tag`, `total_price_sale`) VALUES
(41, '29', 'Iphone 14 pro max', 28500000, 'iphone 14 pro max.jpg', 'Iphone 14 sang trong doc dao xin xao ,ai cung muon mua , dang  cap nhat the gioi', 'private', 5, 12, 'điện thoại , iphone , iphone 14', 30000000),
(42, '29', 'Iphone 14 pro ', 27075000, 'Iphone 14.jpg', 'Iphone 14 sang trong doc dao xin xao ,ai cung muon mua , dang  cap nhat the gioi  ', 'private', 0, 0, 'điện thoại , iphone , iphone 14', 27075000),
(43, '29', 'Iphone 14 ', 20000000, 'iphone 14 plus.jpg', 'Iphone 14 sang trong doc dao xin xao ,ai cung muon mua , dang  cap nhat the gioi ', 'private', 0, 0, 'điện thoại , iphone , iphone 14', 20000000),
(44, '29', 'Iphone 13 pro max', 16150000, 'Iphone 13 pro 1tb.jpg', 'iphone 13 cu te sang chanh ', 'private', 5, 0, 'điện thoại , iphone , iphone 13', 17000000),
(45, '29', 'Iphone 11', 15000000, 'iphong11.jpg', 'Iphone 11 sang trong doc dao xin xao ,ai cung muon mua , dang  cap nhat the gioi ', 'private', 0, 6, 'điện thoại , iphone , iphone 11', 15000000),
(46, '29', 'Iphone 12 tim ', 28500000, 'iphone-12-tim-1-600x600.jpg', 'iPhone 12 Series Chính Hãng ', 'private', 0, 2, 'iphone 12 , iphone xịn , điện thoại', 28500000),
(49, '29', 'Samsung-Galaxy-S21-FE-trang', 25000000, 'Samsung-Galaxy-S21-FE-trang-1-2-600x600.jpg', 'Samsung-Galaxy-S21-FE-trang', 'private', 0, 0, 'samsung , dien thoai , điện thoại  ', 25000000),
(50, '29', 'samsung-galaxy-s20-fan', 20250000, 'samsung-galaxy-s20-fan-edition-xanh-la-thumbnew-600x600.jpeg', 'samsung-galaxy-s20-fan-edition-xanh-la-thumbnew ', 'private', 10, 0, 'samsung , dien thoai , điện thoại  ', 22500000),
(51, '29', 'samsung-galaxy-a73-5g-xanh-thumb', 27000000, 'samsung-galaxy-a73-5g-xanh-thumb-600x600.jpg', 'samsung-galaxy-a73-5g-xanh-thumb', 'private', 10, 0, 'samsung , dien thoai , điện thoại  ', 30000000),
(52, '29', 'samsung-galaxy-a33', 17850000, 'samsung-galaxy-a33-5g-thumb-new-1-600x600.jpg', 'samsung-galaxy-a33-5g-thumb-new-1-600x600', 'private', 15, 0, 'samsung , dien thoai , điện thoại  ', 21000000),
(53, '29', 'samsung-galaxy-a23', 20000000, 'samsung-galaxy-a23-den-thumb-600x600.jpg', 'samsung-galaxy-a23-den-thumb- Sieu chat  luong', 'private', 0, 0, 'galaxy , samsung ', 20000000),
(54, '29', 'samsung-galaxy-a13', 1870000, 'samsung-galaxy-a13-xanh-thumb-1-600x600.jpg', 'Day la dien thoai xin nhat the gioi\r\n', 'private', 15, 3, 'samsung , dien thoai , điện thoại  ', 2200000),
(55, '29', 'samsung-galaxy-a04', 1870000, 'samsung-galaxy-a04-thumb-nau-600x600.jpg', 'Day la dien thoai xin nhat the gioi\r\n ', 'private', 0, 0, 'samsung , dien thoai , điện thoại  ', 1870000),
(56, '29', 'samsung-galaxy-a04s', 20000000, 'samsung-galaxy-a04s-den-thumb-1-600x600.jpg', 'samsung-galaxy-a23-den-thumb- Sieu chat  luong ', 'private', 0, 1, 'galaxy , samsung , dien thoai , điện thoại', 20000000),
(57, '29', 'Samsung galaxy z fold ', 25000000, 'Samsung galaxy z fold 3 5g.jpg', 'Samsung galaxy z fold 3 5g dang cap nhat cua dien thoai sam sung\r\n', 'private', 0, 3, 'samsung , dien thoai , điện thoại  , z fold , fold', 25000000),
(58, '33', 'Samsung galaxy tab', 28500000, 'Samsung galaxy tab.jpg', 'samsung galaxy tab vip dinh cao ', 'private', 5, 0, 'may tinh bang  , tab , samsung tab', 30000000),
(59, '33', 'Samsung Galaxy Tab A8', 28500000, 'Samsung galaxy tab s8.jpg', 'Samsung Galaxy Tab A8', 'private', 0, 0, 'Samsung Galaxy Tab A8 , tab , máy tính bảng', 28500000),
(60, '29', ' Samsung galaxy s22 + 56', 19000000, 'Samsung galaxy s22 + 56.jpg', ' Samsung galaxy s22 + 56', 'private', 0, 0, ' Samsung galaxy s22 + 56', 19000000),
(61, '32', 'MSI Gaming pulse', 35000000, 'MSI Gaming pulse.jpg', 'Đây là dòng gaming xịn hot nhất thời điểm hiện tại ', 'private', 0, 0, 'gaming , may tinh , máy tính  , gaming xịn', 35000000),
(62, '31', 'Máy in phun canon', 60000000, 'may-in-phun-mau-canon-pixma-g1010-thumb-600x600.jpg', 'may in được  tất cả mọi thứ ', 'private', 0, 0, 'máy in , in , lazer  , sieu xịn', 60000000),
(63, '31', 'Máy in lazer', 54000000, 'mayin laser.jpg', 'may in được  tất cả mọi thứ  ', 'private', 10, 0, 'máy in , in , lazer  , sieu xịn', 60000000),
(64, '31', 'MSI Gaming pulse plus', 70000000, 'mayin laser trang.jpg', 'Không có gì để nói về chất lượng của sản phẩm này , siêu đỉnh !!', 'private', 0, 0, 'máy in , in , lazer  , sieu xịn', 70000000),
(65, '31', 'Máy in lazer trắng đen', 80000000, 'may in laser trang den.jpg', 'Không có gì để nói về chất lượng của sản phẩm này , siêu đỉnh !! ', 'private', 0, 0, 'máy in , in , lazer  , sieu xịn', 80000000),
(66, '32', 'macbook pro m1', 35000000, 'Macbook Pro 14 m1.jpg', 'Không cần nội dung ', 'private', 0, 0, 'mac , apple , may tinh bang', 35000000),
(67, '32', 'HP 240', 25000000, 'HP 240 G8.jpg', 'Máy tính văn phòng, hp , hp 240  ', 'private', 0, 2, 'Máy tính văn phòng, hp , hp 240 ', 25000000),
(68, '33', 'Nokia tab', 19000000, 'Nokiao tab 20.jpeg', 'nokia tab , máy tính bảng ', 'private', 0, 17, 'nokia tab , máy tính bảng ', 19000000),
(69, '29', 'Oppo find 5', 13600000, 'OPPO FIND X5 Pro 5g.jpg', 'oppo , dien thoai , điện thoại', 'private', 20, 1, 'oppo , dien thoai , điện thoại', 17000000),
(70, '43', 'Ốp iphone trắng 11 , 12 , 13', 100000, 'Ốp lưng iphone 13 pro.jpg', 'ỐP LƯNG IPHONE CHÍNH HÃNG ', 'private', 0, 4, 'ốp lưng , phụ kiện', 100000),
(71, '33', 'Ipad pro m2', 35000000, 'Ipad pro m2.jpg', 'ipad , apple, may tinh bang , máy tính bảng', 'private', 0, 0, 'ipad , apple, may tinh bang , máy tính bảng', 35000000),
(72, '33', 'Ipad pro m1', 32000000, 'Ipad pro m1.jpeg', 'm1, ipad , apple, may tinh bang , máy tính bảng ', 'private', 0, 2, 'ipad , apple, may tinh bang , máy tính bảng , m1', 32000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `requests_admin`
--

CREATE TABLE `requests_admin` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `date_request` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `requests_admin`
--

INSERT INTO `requests_admin` (`id`, `user_id`, `reason`, `date_request`) VALUES
(11, 17, 'thao123thao123thao123thao123thao123thao123thao123', '2023-02-24 20:48:00'),
(12, 19, 'Toi muon duoc nhan lam quan tri  vien co duoc khong\r\n', '2023-02-25 12:18:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(3) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` text NOT NULL,
  `role` int(4) NOT NULL DEFAULT 0,
  `user_fullName` varchar(255) NOT NULL,
  `date_register` datetime NOT NULL DEFAULT current_timestamp(),
  `avt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `user_name`, `email`, `password`, `phone`, `role`, `user_fullName`, `date_register`, `avt`) VALUES
(15, 'thanh_pro', 'mikte2nthanh@gmail.com', '$2y$12$l.QZyJ/5UWvSbkl4j7fHqO0gYFJ5Kjg1mE1xhYrdKBJ5CTx3l3PBi', '0948909702', 2, 'Bùi Chí Thanh', '2023-02-23 18:39:00', 'jeff.jpg'),
(16, 'linh_pro', 'LINH@GMAIL.COM', '$2y$12$GAcDImY19bXKpKCl7N0p6urfk39oaDlQA1ESSocGiF3IHmQhTqJn6', '0948909702', 0, 'linh cu te', '2023-02-23 20:04:00', ''),
(17, 'thao123', 'miktenthanh@gmail.com', '$2y$12$2DTS8i1tTlbsnt7b2ptcteOO0kq2j1YgCODWdNmnvweLKpBGorIOi', '0948909702', 1, 'Bùi Chí Thanh', '2023-02-24 20:47:00', '301867982_1157606518486482_537950245607863681_n.jpg'),
(19, 'buichithanh', 'thah@gmail.com', '$2y$12$q8RyG4CI/Sq0bTpiwFgACeL68FgiaVRN7k60GAnb5goRzyKIzcLrS', '0938489800', 0, 'THANH BUI CHI ', '2023-02-25 12:12:00', '326924109_2005552846315296_8390281618384227188_n.jpg'),
(21, 'thanhbanh', 'mikt22enthanh@gmail.com', '$2y$12$5kNqvtRWZdewRigT3uKVz.YpJa0N1Eru99Uysg.D1.TO1vFR/4FbW', '0948909702', 0, 'Bùi Chí Thanh', '2023-03-16 16:37:00', ''),
(22, 'thanh@gmal.com', 'mik111tenthanh@gmail.com', '$2y$12$oXhCgMi.apz43eNLeqKzKO0XW1SQus/H4KTuFCnNSjxeRSiJ7fvhq', '0948909702', 0, 'Bùi Chí Thanh', '2023-03-16 16:38:00', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `commnets`
--
ALTER TABLE `commnets`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `requests_admin`
--
ALTER TABLE `requests_admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `commnets`
--
ALTER TABLE `commnets`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT cho bảng `requests_admin`
--
ALTER TABLE `requests_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Cơ sở dữ liệu: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Cơ sở dữ liệu: `thibl2`
--
CREATE DATABASE IF NOT EXISTS `thibl2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci;
USE `thibl2`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `car`
--

CREATE TABLE `car` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `car`
--

INSERT INTO `car` (`id`, `name`, `image`, `categoryId`) VALUES
(11, 'bing le3233', 'xe1.png', 2),
(12, 'bing le nhahaahaahha', 'Ảnh chụp màn hình 2022-06-05 231051.png', 1),
(14, 'may tinh 34', 'erd_ASS.png', 2),
(15, 'may tinh 66', 'Screenshot (259).png', 2),
(16, '4444', 'miếng nối.png', 1),
(17, 'demo', 'laptop2_800x450.jpg', 2),
(19, 'dddddd', 'Screenshot (653).png', 1),
(20, 'dddddd', 'Screenshot (653).png', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id_cate` int(11) NOT NULL,
  `name_category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id_cate`, `name_category`) VALUES
(1, 'Audi'),
(2, 'Benley');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_foods_category` (`categoryId`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_cate`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id_cate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `fk_foods_category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id_cate`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
