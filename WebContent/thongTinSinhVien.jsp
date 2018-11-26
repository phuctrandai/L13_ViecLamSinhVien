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
	thoiGianTotNghiep = sv.getThoiGianTotNghiep().toString();
	soQuyetDinhTotNghiep = sv.getSoQuyetDinhTotNghiep();
	ngayKyQuyetDinhTotNghiep = sv.getNgayKyQuyetDinhTotNghiep().toString();
	
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
		ngaySinh = sv.getThongTinTaiKhoan().getNgaySinh().toString();
		gioiTinh = sv.getThongTinTaiKhoan().isGioiTinh() ? "Nam" : "Nữ";
	}
	
	if(sv.getThongTinViecLam() != null) {
		// Thong tin viec lam
		tenCongViec = sv.getThongTinViecLam().getTenCongViec();
		thoiGianBatDauLamViec = sv.getThongTinViecLam().getThoiGianBatDauLamViec().toString();
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
						<table>
							<tr>
								<td><p><b>Họ tên: </b></p></td>
								<td class="pl-4"><p><%=hoTen %></p></td>
							</tr>
							<tr>
								<td><p><b>Ngày sinh: </b></p></td>
								<td class="pl-4"><p><%=ngaySinh %></p></td>
							</tr>
							<tr>
								<td><p><b>Giới tính: </b></p></td>
								<td class="pl-4"><p><%=gioiTinh %></p></td>
							</tr>
						</table>
					</div>
					<div class="col-md-5 col-sm-12">
						<table>
							<tr>
								<td><p><b>Dân tộc: </b></p></td>
								<td class="pl-4"><p><%=danToc %></p></td>
							</tr>
							<tr>
								<td><p><b>Quốc tịch: </b></p></td>
								<td class="pl-4"><p><%=quocTich %></p></td>
							</tr>
							<tr>
								<td><p><b>CMND: </b></p></td>
								<td class="pl-4"><p><%=cMND %></p></td>
							</tr>
							<tr>
								<td><p><b>Nơi cấp CMND: </b></p></td>
								<td class="pl-4"><p><%=noiCapCMND %></p></td>
							</tr>
						</table>
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
						<table>
							<tr>
								<td><p><b>Tên trường: </b></p></td>
								<td class="pl-4"><p><%=tenTruong %></p></td>
							</tr>
							<tr>
								<td><p><b>Ngành học: </b></p></td>
								<td class="pl-4"><p><%=tenNganh %></p></td>
							</tr>
							<tr>
								<td><p><b>Niên khóa: </b></p></td>
								<td class="pl-4"><p><%=nienKhoa %></p></td>
							</tr>
						</table>
					</div>
					<div class="col-md-5 col-sm-12 pl-md-3">
						<table>
							<tr>
								<td><p><b>Thời gian tốt nghiệp: </b></p></td>
								<td class="pl-4"><p><%=thoiGianTotNghiep %></p></td>
							</tr>
							<tr>
								<td><p><b>Số quyết định tốt nghiệp: </b></p></td>
								<td class="pl-4"><p><%=soQuyetDinhTotNghiep %></p></td>
							</tr>
							<tr>
								<td><p><b>Ngày ký quyết định tốt nghiệp: </b></p></td>
								<td class="pl-4"><p><%=ngayKyQuyetDinhTotNghiep %></p></td>
							</tr>
						</table>
					</div>
					<div class="col-md-2 col-sm-12" >
					</div>
				</div>
			</div>
			
			<div class="card">
				<div class="card-footer"><h3>Thông tin việc làm</h3></div>
				<div class="card-body row">
					<div class="col-md-6 col-sm-12 pl-md-5">
						<table>
							<tr>
								<td><p><b>Tên công việc: </b></p></td>
								<td class="pl-4"><p><%=tenCongViec %></p></td>
							</tr>
							<tr>
								<td><p><b>Vị trí công tác: </b></p></td>
								<td class="pl-4"><p><%=viTriCongTac %></p></td>
							</tr>
							<tr>
								<td><p><b>Thời gian bắt đầu làm việc: </b></p></td>
								<td class="pl-4"><p><%=thoiGianBatDauLamViec %></p></td>
							</tr>
							<tr>
								<td><p><b>Mức độ phù hợp chuyên môn: </b></p></td>
								<td class="pl-4"><p><%=mucDoPhuHopChuyenMon %></p></td>
							</tr>
							<tr>
								<td><p><b>Mức độ đáp ứng của KTCM: </b></p></td>
								<td class="pl-4"><p><%=mucDoDapUngKTCM %></p></td>
							</tr>
						</table>
					</div>
					<div class="col-md-6 col-sm-12 pl-md-3">
						<table>
							<tr>
								<td><p><b>Tên cơ quan: </b></p></td>
								<td class="pl-4"><p><%=tenCoQuan %></p></td>
							</tr>
							<tr>
								<td><p><b>Địa chỉ cơ quan: </b></p></td>
								<td class="pl-4"><p><%=diaChiCoQuan %></p></td>
							</tr>
							<tr>
								<td><p><b>Loại hình cơ quan: </b></p></td>
								<td class="pl-4"><p><%=loaiHinhCoQuan %></p></td>
							</tr>
							<tr>
								<td><p><b>Mức thu nhập trung bình tháng: </b></p></td>
								<td class="pl-4"><p><%=mucThuNhapTBThang %></p></td>
							</tr>
						</table>
					</div>					
				</div>
			</div>		
	</div>
</body>
</html>