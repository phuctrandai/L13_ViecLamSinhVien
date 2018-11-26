<%@page import="bean.SinhVienBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin cựu sinh viên</title>

	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>

<%
SinhVienBean sv = (SinhVienBean) request.getAttribute("sinhVien");
String hoTen = "", danToc = "", quocTich = "", ngaySinh = "", gioiTinh = "", cMND = "", noiCapCMND = "",

	diaChiThuongTru = "", soDienThoai = "", email = "",
	
	tenTruong = "", tenNganh = "", thoiGianTotNghiep = "", soQuyetDinhTotNghiep = "", ngayKyQuyetDinhTotNghiep = "", nienKhoa = "",
	
	tenCongViec = "", thoiGianBatDauLamViec = "", tenCoQuan = "", diaChiCoQuan = "", loaiHinhCoQuan = "", viTriCongTac = "",
	
	mucDoPhuHopChuyenMon = "", mucDoDapUngKTCM = "", mucThuNhapTBThang = "";
if(sv != null) {
	// Thong tin dao tao
	tenTruong = sv.getTenTruong();
	tenNganh = sv.getTenNganh();
	nienKhoa = sv.getNienKhoa();
	thoiGianTotNghiep = sv.getThoiGianTotNghiep().toLocaleString();
	soQuyetDinhTotNghiep = sv.getSoQuyetDinhTotNghiep();
	ngayKyQuyetDinhTotNghiep = sv.getNgayKyQuyetDinhTotNghiep().toLocaleString();
	
	if(sv.getThongTinTaiKhoan() != null) {
		// Thong tin tai khoan
		hoTen = sv.getThongTinTaiKhoan().getHoVaTen();
		danToc = sv.getThongTinTaiKhoan().getDanToc();
		quocTich = sv.getThongTinTaiKhoan().getQuocTich();
		cMND = sv.getThongTinTaiKhoan().getcMND();
		noiCapCMND = sv.getThongTinTaiKhoan().getNoiCapCMND();
		diaChiThuongTru = sv.getThongTinTaiKhoan().getDiaChiThuongTru();
		soDienThoai = sv.getThongTinTaiKhoan().getSoDienThoai();
		email = sv.getThongTinTaiKhoan().getEmail();
		ngaySinh = sv.getThongTinTaiKhoan().getNgaySinh().toLocaleString();
		gioiTinh = sv.getThongTinTaiKhoan().isGioiTinh() ? "Nam" : "Nữ";
	}
	
	if(sv.getThongTinViecLam() != null) {
		// Thong tin viec lam
		tenCongViec = sv.getThongTinViecLam().getTenCongViec();
		thoiGianBatDauLamViec = sv.getThongTinViecLam().getThoiGianBatDauLamViec().toLocaleString();
		tenCoQuan = sv.getThongTinViecLam().getTenCoQuan();
		diaChiCoQuan = sv.getThongTinViecLam().getDiaChiCoQuan();
		loaiHinhCoQuan = sv.getThongTinViecLam().getLoaiHinhCoQuan();
		viTriCongTac = sv.getThongTinViecLam().getViTriCongTac();
		mucDoDapUngKTCM = sv.getThongTinViecLam().getMucDoDapUngKienThuc();
		mucDoPhuHopChuyenMon = sv.getThongTinViecLam().getMucDoPhuHopChuyenMon();
		mucThuNhapTBThang = String.valueOf(sv.getThongTinViecLam().getMucThuNhapTBThang());
	}
}

%>

<body>
	<div class="container mt-5">
		<form action="taiKhoan" method="POST">
			<input type="hidden" name="command" value="logout">
			<input type="submit" class="btn btn-outline-danger float-right" value="Đăng xuất">
		</form>
		<h2 class="text-center mb-5">Thông tin sinh viên</h2>
			<div class="card">
				<div class="card-header">
					<span style="font-size: 1.75rem; font-weight: 500;">Thông tin chung</span>
					
					<a href="sinhVien?command=doiMatKhau" class="float-right" title="Đổi mật khẩu">
						<i class="fa fa-key text-danger" style="font-size:24px"></i>
					</a>
					<a href="sinhVien?command=chinhSua" class="float-right mr-5" title="Chỉnh sửa thông tin">
						<i class="material-icons" style="font-size:24px">border_color</i>
					</a>
					
				</div>
				<div class="card-body row">
					<div class="col-md-5 col-sm-12 pl-md-5">
						<p><b>Họ tên: </b><%=hoTen %></p>
						<p><b>Ngày sinh: </b><%=ngaySinh %></p>
						<p><b>Giới tính: </b><%=gioiTinh %></p>
					</div>
					<div class="col-md-5 col-sm-12">
						<p><b>Dân tộc: </b><%=danToc %></p>
						<p><b>Quốc tịch: </b><%=quocTich %></p>
						<p><b>CMND: </b><%=cMND %></p>
						<p><b>Nơi cấp CMND: </b><%=noiCapCMND %></p>
					</div>
					<div class="col-md-2 col-sm-12">
						<img style="height:150px; width: 150px;"
							src="https://www.svgimages.com/svg-image/s5/man-passportsize-silhouette-icon-256x256.png">
					</div>
				</div>
			</div>
			
			<div class="card">
				<div class="card-footer"><h3>Thông tin liên hệ</h3></div>
				<div class="card-body row">
					<div class="col-md-5 col-sm-12 pl-md-5">
						<p><b>Địa chỉ thường trú: </b><%=diaChiThuongTru %></p>
					</div>
					<div class="col-md-3 col-sm-12">
						<p><b>Số điện thoại: </b><%=soDienThoai %></p>
					</div>
					<div class="col-md-4 col-sm-12">
						<p><b>Địa chỉ email: </b><%=email %></p>
					</div>
				</div>
			</div>
			
			<div class="card">
				<div class="card-footer"><h3>Thông tin đào tạo</h3></div>
				<div class="card-body row">
					<div class="col-md-5 pl-md-5 col-sm-12">
						<p><b>Tên trường: </b><%=tenTruong %></p>
						<p><b>Ngành học: </b><%=tenNganh %></p>
						<p><b>Niên khóa: </b><%=nienKhoa %></p>
					</div>
					<div class="col-md-5 col-sm-12 pl-md-3">
						<p><b>Thời gian tốt nghiệp: </b><%=thoiGianTotNghiep %></p>
						<p><b>Số quyết định tốt nghiệp: </b><%=soQuyetDinhTotNghiep %></p>
						<p><b>Ngày ký quyết định tốt nghiệp: </b><%=ngayKyQuyetDinhTotNghiep %></p>
					</div>
					<div class="col-md-2 col-sm-12" >
					</div>
				</div>
			</div>
			
			<div class="card">
				<div class="card-footer"><h3>Thông tin việc làm</h3></div>
				<div class="card-body row">
					<div class="col-md-6 col-sm-12 pl-md-5">
						<p><b>Tên công việc: </b><%=tenCongViec%></p>
						<p><b>Vị trí công tác: </b><%=viTriCongTac %></p>
						<p><b>Thời gian bắt đầu làm việc: </b><%=thoiGianBatDauLamViec %></p>
						<p><b>Mức độ phù hợp chuyên môn: </b><%=mucDoPhuHopChuyenMon %></p>
						<p><b>Mức độ đáp ứng của kiến thức chuyên môn: </b><%=mucDoDapUngKTCM %></p>
					</div>
					<div class="col-md-6 col-sm-12 pl-md-3">
						<p><b>Tên cơ quan: </b><%=tenCoQuan %></p>
						<p><b>Địa chỉ cơ quan: </b><%=diaChiCoQuan %></p>
						<p><b>Loại hình cơ quan: </b><%=loaiHinhCoQuan %></p>
						<p><b>Mức thu nhập trung bình tháng: </b><%=mucThuNhapTBThang %></p>
					</div>					
				</div>
			</div>		
	</div>
</body>
</html>