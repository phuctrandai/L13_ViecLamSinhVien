/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.1000)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2008 R2
    Target Database Engine Edition : Microsoft SQL Server Express Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [RUP_ViecLamSinhVien]    Script Date: 11/25/2018 9:23:02 AM ******/
CREATE DATABASE [RUP_ViecLamSinhVien] ON  PRIMARY 
( NAME = N'RUP_ViecLamSinhVien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RUP_ViecLamSinhVien.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RUP_ViecLamSinhVien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RUP_ViecLamSinhVien_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RUP_ViecLamSinhVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET ARITHABORT OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET  MULTI_USER 
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET DB_CHAINING OFF 
GO
USE [RUP_ViecLamSinhVien]
GO
/****** Object:  Table [dbo].[NGANHDAOTAO]    Script Date: 11/25/2018 9:23:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGANHDAOTAO](
	[MaNganh] [char](20) NOT NULL,
	[TenNganh] [nvarchar](200) NULL,
 CONSTRAINT [PK_NGANHDAOTAO] PRIMARY KEY CLUSTERED 
(
	[MaNganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 11/25/2018 9:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SINHVIEN](
	[MaSinhVien] [int] IDENTITY(1,1) NOT NULL,
	[NienKhoa] [varchar](20) NULL,
	[ThoiGianTotNghiep] [date] NULL,
	[SoQuyetDinhTotNghiep] [varchar](20) NULL,
	[NgayKyQuyetDinhTotNghiep] [date] NULL,
	[MaTaiKhoan] [int] NULL,
	[MaTruongNganh] [int] NULL,
 CONSTRAINT [PK_SINHVIEN] PRIMARY KEY CLUSTERED 
(
	[MaSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 11/25/2018 9:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [varchar](100) NULL,
	[MatKhau] [varchar](50) NULL,
	[LoaiTaiKhoan] [nvarchar](50) NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THONGTINTAIKHOAN]    Script Date: 11/25/2018 9:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THONGTINTAIKHOAN](
	[MaTaiKhoan] [int] NULL,
	[HoVaTen] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[CMND] [varchar](12) NULL,
	[NgayCapCMND] [date] NULL,
	[NoiCapCMND] [nvarchar](100) NULL,
	[DanToc] [nvarchar](50) NULL,
	[QuocTich] [nvarchar](50) NULL,
	[DiaChiThuongTru] [nvarchar](200) NULL,
	[SoDienThoai] [varchar](12) NULL,
	[Email] [varchar](100) NULL,
	[AnhDaiDien] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THONGTINVIECLAM]    Script Date: 11/25/2018 9:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THONGTINVIECLAM](
	[MaSinhVien] [int] NOT NULL,
	[TenCongViec] [nvarchar](200) NULL,
	[ThoiGianBatDauLamViec] [date] NULL,
	[TenCoQuan] [nvarchar](200) NULL,
	[DiaChiCoQuan] [nvarchar](200) NULL,
	[LoaiHinhCoQuan] [nvarchar](100) NULL,
	[ViTriCongTac] [nvarchar](100) NULL,
	[MucThuNhapTBThang] [money] NULL,
	[MucDoPhuHopChuyenMon] [nvarchar](100) NULL,
	[MucDoDapUngKTCM] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRUONG]    Script Date: 11/25/2018 9:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRUONG](
	[MaTruong] [char](20) NOT NULL,
	[TenTruong] [nvarchar](200) NULL,
	[LoaiHinh] [nvarchar](100) NULL,
	[LoaiTruong] [nvarchar](100) NULL,
	[TinhThanhTrucThuoc] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SoDienThoai] [varchar](12) NULL,
	[SoFax] [varchar](12) NULL,
	[Email] [varchar](100) NULL,
	[Website] [varchar](200) NULL,
 CONSTRAINT [PK_TRUONG] PRIMARY KEY CLUSTERED 
(
	[MaTruong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRUONG_NGANH]    Script Date: 11/25/2018 9:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRUONG_NGANH](
	[MaTruongNganh] [int] IDENTITY(1,1) NOT NULL,
	[MaTruong] [char](20) NULL,
	[MaNganh] [char](20) NULL,
	[TrinhDoDaoTao] [nvarchar](100) NULL,
	[HeDaoTao] [nvarchar](100) NULL,
	[HinhThucDaoTao] [nvarchar](100) NULL,
 CONSTRAINT [PK_TRUONG_NGANH] PRIMARY KEY CLUSTERED 
(
	[MaTruongNganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_NGANHDT]    Script Date: 11/25/2018 9:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_NGANHDT]
AS
SELECT        dbo.NGANHDAOTAO.MaNganh, dbo.NGANHDAOTAO.TenNganh, dbo.TRUONG_NGANH.TrinhDoDaoTao, dbo.TRUONG_NGANH.HeDaoTao, 
                         dbo.TRUONG_NGANH.HinhThucDaoTao, dbo.TRUONG_NGANH.MaTruong
FROM            dbo.NGANHDAOTAO INNER JOIN
                         dbo.TRUONG_NGANH ON dbo.NGANHDAOTAO.MaNganh = dbo.TRUONG_NGANH.MaNganh

GO
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7140201             ', N'Giáo dục Mầm non')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7140202             ', N'Giáo dục Tiểu học')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7140203             ', N'Giáo dục Đặc biệt')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7140210             ', N'Sư phạm Tin học')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7140211             ', N'Sư phạm Vật lý')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7140212             ', N'Sư phạm Hóa học')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7140213             ', N'Sư phạm Sinh học')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7480101             ', N'Khoa học máy tính')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7480102             ', N'Mạng máy tính và truyền thông dữ liệu')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7480103             ', N'Kỹ thuật phần mềm')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7480104             ', N'Hệ thống thông tin')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7480106             ', N'Kỹ thuật máy tính')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7480108             ', N'Công nghệ kỹ thuật máy tính')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7480201             ', N'Công nghệ thông tin')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7480202             ', N'An toàn thông tin')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7510101             ', N'Công nghệ kỹ thuật kiến trúc')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7510102             ', N'Công nghệ kỹ thuật công trình xây dựng')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7510103             ', N'Công nghệ kỹ thuật xây dựng')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7510104             ', N'Công nghệ kỹ thuật giao thông')
INSERT [dbo].[NGANHDAOTAO] ([MaNganh], [TenNganh]) VALUES (N'7510105             ', N'Công nghệ kỹ thuật vật liệu xây dựng')
SET IDENTITY_INSERT [dbo].[SINHVIEN] ON 

INSERT [dbo].[SINHVIEN] ([MaSinhVien], [NienKhoa], [ThoiGianTotNghiep], [SoQuyetDinhTotNghiep], [NgayKyQuyetDinhTotNghiep], [MaTaiKhoan], [MaTruongNganh]) VALUES (17, N'2019', CAST(N'2018-09-13' AS Date), N'123', CAST(N'2018-08-13' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[SINHVIEN] OFF
SET IDENTITY_INSERT [dbo].[TAIKHOAN] ON 

INSERT [dbo].[TAIKHOAN] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [LoaiTaiKhoan]) VALUES (1, N'phuc', N'123', N'Sinh viên')
INSERT [dbo].[TAIKHOAN] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [LoaiTaiKhoan]) VALUES (2, N'quang', N'123', N'Nhân viên')
SET IDENTITY_INSERT [dbo].[TAIKHOAN] OFF
INSERT [dbo].[THONGTINTAIKHOAN] ([MaTaiKhoan], [HoVaTen], [NgaySinh], [GioiTinh], [CMND], [NgayCapCMND], [NoiCapCMND], [DanToc], [QuocTich], [DiaChiThuongTru], [SoDienThoai], [Email], [AnhDaiDien]) VALUES (1, N'Lê Văn B', CAST(N'1994-05-03' AS Date), 1, N'1232223121', CAST(N'2014-03-02' AS Date), N'Công an Huế', N'Kinh', N'Việt Nam', N'3 Trần Hưng Đạo', N'292019200', N'b@gmail.com', NULL)
INSERT [dbo].[THONGTINVIECLAM] ([MaSinhVien], [TenCongViec], [ThoiGianBatDauLamViec], [TenCoQuan], [DiaChiCoQuan], [LoaiHinhCoQuan], [ViTriCongTac], [MucThuNhapTBThang], [MucDoPhuHopChuyenMon], [MucDoDapUngKTCM]) VALUES (17, N'Web developer', CAST(N'2018-09-13' AS Date), N'Kodoteam', N'6 Lê Lợi', N'Tư nhân', N'Lập trinh viên', 3000000.0000, N'Cao', N'Cao')
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'BKA                 ', N'Đại học Bách khoa Hà Nội', N'Công lập', N'Đại học', N'Hà Nội', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'C05                 ', N'Cao đẳng Sư phạm Hà Giang', N'Công lập', N'Cao đẳng', N'Hà Giang', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'C12                 ', N'Cao đẳng Sư phạm Thái Nguyên', N'Công lập', N'Cao đẳng', N'Thái Nguyên', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'C33                 ', N'Cao đẳng Sư phạm Thừa Thiên Huế', N'Công lập', N'Cao đẳng', N'Thừa Thiên Huế', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'CCH                 ', N'Cao đẳng Công nghiệp Huế', N'Công lập', N'Cao đẳng', N'Thừa Thiên Huế', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'DDK                 ', N'Đại học Bách khoa Đà Nẵng', N'Công lập', N'Đại học', N'Đà Nẵng', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'DDS                 ', N'Đại học Sư phạm - Đại học Đà Nẵng', N'Công lập', N'Đại học', N'Đà Nẵng', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'DHS                 ', N'Đại học Sư phạm - Đại học Huế', N'Công lập', N'Đại học', N'Thừa Thiên Huế', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'DHT                 ', N'Đại học Khoa học - Đại học Huế', N'Công lập', N'Đại học', N'Thừa Thiên Huế', N'74 Nguyễn Huệ', N'123', N'12234', N'Khoahoc@gmail.com', N'http://husc.hueuni.edu.vn')
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'DSK                 ', N'Đại học Sư phạm kỹ thuật - Đại học Đà Nẵng', N'Công lập', N'Đại học', N'Đà Nẵng', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'DTS                 ', N'Đại học Sư phạm - Đại học Thái Nguyên', N'Công lập', N'Đại học', N'Thái Nguyên', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'DTZ                 ', N'Đại học Khoa học - Đại học Thái Nguyên', N'Công lập', N'Đại học', N'Thái Nguyên', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'KCN                 ', N'Đại học Khoa học và công nghệ Hà Nội', N'Công lập', N'Đại học', N'Hà Nội', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'QSB                 ', N'Đại học Bách khoa - Đại học Quốc gia TPHCM', N'Công lập', N'Đại học', N'Hồ Chí Minh', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'QST                 ', N'Đại học Khoa học tự nhiên - Đại học Quốc gia TPHCM', N'Công lập', N'Đại học', N'Hồ Chí Minh', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'sdsds               ', N'Khoa hoc', N'Công Lập', N'Đại Học', N'Thừa Thiên Huế', N'Hue', N'123232323', N'112121212', N'Khoahoc@gmail.com', N'1234')
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'SPS                 ', N'Đại học Sư phạm TPHCM', N'Công lập', N'Đại học', N'Hồ Chí Minh', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRUONG] ([MaTruong], [TenTruong], [LoaiHinh], [LoaiTruong], [TinhThanhTrucThuoc], [DiaChi], [SoDienThoai], [SoFax], [Email], [Website]) VALUES (N'SPH                 ', N'Đại học Sư phạm Hà Nội', N'Công lập', N'Đại học', N'Hà Nội', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TRUONG_NGANH] ON 

INSERT [dbo].[TRUONG_NGANH] ([MaTruongNganh], [MaTruong], [MaNganh], [TrinhDoDaoTao], [HeDaoTao], [HinhThucDaoTao]) VALUES (1, N'BKA                 ', N'7480101             ', N'Đại học', N'Kĩ sư', N'Chính quy')
SET IDENTITY_INSERT [dbo].[TRUONG_NGANH] OFF
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_SINHVIEN_TAIKHOAN] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TAIKHOAN] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [FK_SINHVIEN_TAIKHOAN]
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_SINHVIEN_TRUONG_NGANH] FOREIGN KEY([MaTruongNganh])
REFERENCES [dbo].[TRUONG_NGANH] ([MaTruongNganh])
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [FK_SINHVIEN_TRUONG_NGANH]
GO
ALTER TABLE [dbo].[THONGTINTAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_THONGTINTAIKHOAN_TAIKHOAN] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TAIKHOAN] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[THONGTINTAIKHOAN] CHECK CONSTRAINT [FK_THONGTINTAIKHOAN_TAIKHOAN]
GO
ALTER TABLE [dbo].[THONGTINVIECLAM]  WITH CHECK ADD  CONSTRAINT [FK_THONGTINVIECLAM_SINHVIEN] FOREIGN KEY([MaSinhVien])
REFERENCES [dbo].[SINHVIEN] ([MaSinhVien])
GO
ALTER TABLE [dbo].[THONGTINVIECLAM] CHECK CONSTRAINT [FK_THONGTINVIECLAM_SINHVIEN]
GO
ALTER TABLE [dbo].[TRUONG_NGANH]  WITH CHECK ADD  CONSTRAINT [FK_TRUONG_NGANH_NGANHDAOTAO] FOREIGN KEY([MaNganh])
REFERENCES [dbo].[NGANHDAOTAO] ([MaNganh])
GO
ALTER TABLE [dbo].[TRUONG_NGANH] CHECK CONSTRAINT [FK_TRUONG_NGANH_NGANHDAOTAO]
GO
ALTER TABLE [dbo].[TRUONG_NGANH]  WITH CHECK ADD  CONSTRAINT [FK_TRUONG_NGANH_TRUONG] FOREIGN KEY([MaTruong])
REFERENCES [dbo].[TRUONG] ([MaTruong])
GO
ALTER TABLE [dbo].[TRUONG_NGANH] CHECK CONSTRAINT [FK_TRUONG_NGANH_TRUONG]
GO
USE [master]
GO
ALTER DATABASE [RUP_ViecLamSinhVien] SET  READ_WRITE 
GO
