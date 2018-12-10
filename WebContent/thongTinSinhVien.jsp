<%@page import="bean.ThongTinViecLamBean"%>
<%@page import="bean.ThongTinTaiKhoanBean"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
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
// dinh dang tien
NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("vie", "VN"));
// lay thong tin sinh vien
SinhVienBean sv = (SinhVienBean) request.getAttribute("sinhVien");
String tinhTrangViecLam = (String)	request.getAttribute("tinhTrangViecLam");
String[] listTrinhDoDaoTao = new String[]{ "Nghiên cứu sinh", "Thạc sĩ", "Tiến sĩ" };

// khoi tao gia tri mac dinh
String hoTen = "", danToc = "", quocTich = "", ngaySinh = "", gioiTinh = "", cMND = "", noiCapCMND = "",
	diaChiThuongTru = "", soDienThoai = "", email = "",
	tenTruong = "", tenNganh = "", thoiGianTotNghiep = "", soQuyetDinhTotNghiep = "", ngayKyQuyetDinhTotNghiep = "", nienKhoa = "",
	tenCongViec = "", thoiGianBatDauLamViec = "", tenCoQuan = "", diaChiCoQuan = "", viTriCongTac = "",
	mucDoPhuHopChuyenMon = "", mucDoDapUngKTCM = "", loaiHinhCoQuan = "";
long mucThuNhapTBThang = 0;

if(sv != null) {
	// Thong tin dao tao
	tenTruong = sv.getTenTruong() == null ? "" : sv.getTenTruong();
	tenNganh = sv.getTenNganh() == null ? "" : sv.getTenNganh();
	nienKhoa = sv.getNienKhoa() == null ? "" : sv.getNienKhoa();
	thoiGianTotNghiep = sv.getThoiGianTotNghiep() == null ? "" : sv.getThoiGianTotNghiep().toString();
	soQuyetDinhTotNghiep = sv.getSoQuyetDinhTotNghiep() == null ? "" : sv.getSoQuyetDinhTotNghiep();
	ngayKyQuyetDinhTotNghiep = sv.getNgayKyQuyetDinhTotNghiep() == null ? "" : sv.getNgayKyQuyetDinhTotNghiep().toString();
	
	if(sv.getThongTinTaiKhoan() != null) {
		ThongTinTaiKhoanBean tk = sv.getThongTinTaiKhoan();
		// Thong tin tai khoan
		hoTen = tk.getHoVaTen() == null ? "" : tk.getHoVaTen();
		danToc = tk.getDanToc() ==  null ? "" : tk.getDanToc();
		quocTich = tk.getQuocTich() == null ? "" : tk.getQuocTich();
		cMND = tk.getcMND() == null ? "" : tk.getcMND();
		noiCapCMND = tk.getNoiCapCMND() == null ? "" : tk.getNoiCapCMND();
		diaChiThuongTru = tk.getDiaChiThuongTru() == null ? "" : tk.getDiaChiThuongTru();
		soDienThoai = tk.getSoDienThoai() == null ? "" : tk.getSoDienThoai();
		email = tk.getEmail() == null ? "" : tk.getEmail();
		ngaySinh = tk.getNgaySinh() == null ? "" : tk.getNgaySinh().toString();
		gioiTinh = tk.isGioiTinh() ? "Nam" : "Nữ";
	}
	
	if(tinhTrangViecLam == "dangDiLam") {
		ThongTinViecLamBean vl = (ThongTinViecLamBean) request.getAttribute("thongTinViecLam");
		// Thong tin viec lam
		tenCongViec = vl.getTenCongViec() == null ? "" : vl.getTenCongViec();
		thoiGianBatDauLamViec = vl.getThoiGianBatDauLamViec() == null ? "" : vl.getThoiGianBatDauLamViec().toString();
		tenCoQuan = vl.getTenCoQuan() == null ? "" : vl.getTenCoQuan();
		diaChiCoQuan = vl.getDiaChiCoQuan() == null ? "" : vl.getDiaChiCoQuan();
		viTriCongTac = vl.getViTriCongTac() == null ? "" : vl.getViTriCongTac();
		mucDoDapUngKTCM = vl.getMucDoDapUngKienThuc() == null ? "" : vl.getMucDoDapUngKienThuc();
		mucDoPhuHopChuyenMon = vl.getMucDoPhuHopChuyenMon() == null ? "" : vl.getMucDoPhuHopChuyenMon();
		mucThuNhapTBThang = vl.getMucThuNhapTBThang();
		loaiHinhCoQuan = listTrinhDoDaoTao[vl.getLoaiHinhCoQuan()];
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
					
					<a href="taiKhoan?command=doiMatKhau" class="float-right" title="Đổi mật khẩu">
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
								<td class="pl-4"><p><%=nf.format(mucThuNhapTBThang) %></p></td>
							</tr>
						</table>
					</div>					
				</div>
			</div>		
	</div>
</body>
</html>