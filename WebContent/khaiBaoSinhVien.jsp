<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="bean.TruongBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="bean.SinhVienBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Khai báo sinh viên</title>
	
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<%
DateFormat df = new SimpleDateFormat("dd.MM.yy");

ArrayList<TruongBean> danhSachTruong = (ArrayList<TruongBean>) request.getAttribute("danhSachTruong");
SinhVienBean sv = (SinhVienBean) request.getAttribute("sinhVien");
String hoTen = "", ngaySinh = "", danToc = "", quocTich = "", gioiTinh = "", cMND = "", noiCapCMND = "",

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
	<form action="sinhVien" method="post">
		<div class="card">
			<div class="card-header text-center">
				<h3>Khai báo thông tin sinh viên</h3>
			</div>
			<div class="card-body">
				<div class="form-group">
					<div class="row">
						<h4 class="col-12">Thông tin chung:</h4>
						<div class="col-md-5 col-sm-12">
							<div class="form-group">
								<label for="hoTen">Họ và tên</label>
								<input type="text" name="hoTen" id="hoTen" class="form-control" value="<%=hoTen%>">
							</div>
							
							<div class="form-group">
								<label id="ngaySinh">Ngày sinh</label>
								<input type="date" name="ngaySinh" id="ngaySinh" class="form-control" 
									value="<%=ngaySinh%>">
							</div>
							
							<div class="form-group">
								<label id="gioiTinh">Giới tính</label>
								<select class="form-control" name="gioiTinh" id="gioiTinh">
									<option value="1" <%=gioiTinh.equals("Nam") ? "selected" : "" %>>Nam</option>
									<option value="0" <%=gioiTinh.equals("Nữ") ? "selected" : "" %>>Nữ</option> 
								</select>
							</div>
							
							<div class="form-group">
								<label for="danToc">Dân tộc</label>
								<input type="text" name="danToc" id="danToc" class="form-control" value="<%=danToc%>">
							</div>
						</div>
						<div class="col-md-4 col-sm-12">
							<div class="form-group">
								<label for="quocTich">Quốc tịch</label>
								<input type="text" name="quocTich" id="quocTich" class="form-control" value="<%=quocTich%>">
							</div>
							
							<div class="form-group">
								<label for="cMND">Số CMND</label>
								<input type="text" name="cMND" id="cMND" class="form-control" value="<%=cMND%>">
							</div>
							
							<div class="form-group">
								<label for="noiCapCMND">Nơi cấp CMND</label>
								<input type="text" name="noiCapCMND" id="noiCapCMND" class="form-control" value="<%=noiCapCMND%>">
							</div>
						</div>
							
						<div class="col-md-3 col-sm-12 text-center">
							<label for="anhDaiDien">Ảnh đại diện</label><br>
							<img style="height:150px; width: 150px;" src="./image/avatar.png" alt="N/A"><br>
							<input type="file" name="anhDaiDien" id="anhDaiDien" class="btn p-0 m-0 w-100 mt-3">
						</div>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<div class="row">
						<h4 class="col-12">Thông tin liên hệ:</h4>
						<div class="col-md-5 col-sm-12">
							<div class="form-group">
								<label for="diaChi">Địa chỉ thường trú</label>
								<input type="text" name="diaChi" id="diaChi" class="form-control" value="<%=diaChiThuongTru%>">
							</div>
						</div>
						
						<div class="col-md-4 col-sm-12">
							<div class="form-group">
								<label for="email">Email</label>
								<input type="text" name="email" id="email" class="form-control" value="<%=email%>">
							</div>
						</div>
						
						<div class="col-md-3 col-sm-12">
							<div class="form-group">
								<label for="soDienThoai">Số điện thoại</label>
								<input type="text" name="soDienThoai" id="soDienThoai" class="form-control" value="<%=soDienThoai%>">
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<div class="row">
						<h4 class="col-12">Thông tin đào tạo</h4>
						<div class="col-md-5 col-sm-12">
							<div class="form-group">
								<label for="tenTruong">Tên trường</label>
								<select name="tenTruong" id="tenTruong" class="form-control">
								<%for(TruongBean tb : danhSachTruong) {%>
									<option value="<%=tb.getMatruong()%>"><%=tb.getTentruong() %></option>
								<%} %>
								</select>
							</div>
							
							<div class="form-group">
								<label for="tenNganh">Ngành học</label>
								<select name="tenNganh" class="form-control">
									<option value="maNganh">Công nghệ thông tin</option>
								</select>
							</div>
							
							<div class="form-group">
								<label for="hinhThucDaoTao">Hình thức đào tạo</label>
								<select name="hinhThucDaoTao" class="form-control">
									<option value="">Chính qui</option>
								</select>
							</div>
							
							<div class="form-group">
								<label for="nienKhoa">Niên khóa</label>
								<input type="text" name="nienKhoa" id="nienKhoa" class="form-control" value="<%=nienKhoa%>">
							</div>
						</div>
						
						<div class="col-md-4 col-sm-12">
							<div class="form-group">
								<label for="thoiGianTotNghiep">Thời gian tốt nghiệp</label>
								<input type="date" name="thoiGianTotNghiep" id="thoiGianTotNghiep" class="form-control" value="<%=thoiGianTotNghiep%>">
							</div>
							
							<div class="form-group">
								<label for="soQuyetDinhTotNghiep">Số quyết định tốt nghiệp</label>
								<input type="text" name="soQuyetDinhTotNghiep" id="soQuyetDinhTotNghiep" class="form-control" value="<%=soQuyetDinhTotNghiep%>">
							</div>
							
							<div class="form-group">
								<label for="ngayKyQuyetDinh">Ngày ký quyết định tốt nghiệp</label>
								<input type="date" name="ngayKyQuyetDinh" id="ngayKyQuyetDinh" class="form-control" value="<%=ngayKyQuyetDinhTotNghiep%>">
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<div class="mt-3">
						<div class="row">
							<h4 class="col-12">Thông tin việc làm</h4>
							<div class="form-group col-12 text-center">
								<div class="form-check-inline col-3">
									<label class="form-check-label">
										<input type="radio" class="form-check-input" name="tinhTrangViecLam" value="dangDiLam" id="dangDiLamOption" checked>
										Đang đi làm
									</label>
								</div>
								<div class="form-check-inline col-3">
									<label class="form-check-label">
									    <input type="radio" class="form-check-input" name="tinhTrangViecLam" value="dangHocNangCao" id="dangHocNangCaoOption">
									    Đang học nâng cao
								  	</label>
								</div>
								<div class="form-check-inline col-3">
									<label class="form-check-label">
									    <input type="radio" class="form-check-input" name="tinhTrangViecLam" value="thatNghiep" id="thatNghiepOption">
									    Đang không có việc làm
									</label>
								</div>
							</div>
						</div>
						<hr>
						<div class="tab-content">
							<div id="dangDiLam" class="tab-pane active"><br>
								<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="tenCongViec">Tên công việc:</label>
							    	</div>
							    	<div class="col-md-6 col-sm-12">
							    		<input type="text" name="tenCongViec" id="tenCongViec" class="form-control" value="<%=tenCongViec%>">
							    	</div>
								</div>
						    	<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="thoiGianBatDauLamViec">Thời gian bắt đầu làm việc:</label>
							    	</div>
							    	<div class="col-md-3 col-sm-12">
							    		<input type="date" name="thoiGianBatDauLamViec" id="thoiGianBatDauLamViec" class="form-control"
							    			value="<%=thoiGianBatDauLamViec%>">
							    	</div>
								</div>
						    	
						    	<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="viTriCongViec">Vị trí công tác:</label>
							    	</div>
							    	<div class="col-md-6 col-sm-12">
							    		<input type="text" name="viTriCongViec" id="viTriCongViec" class="form-control" value="<%=viTriCongTac%>">
							    	</div>
								</div>
								
								<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="tenCoQuan">Tên cơ quan:</label>
							    	</div>
							    	<div class="col-md-6 col-sm-12">
							    		<input type="text" name="tenCoQuan" id="tenCoQuan" class="form-control" value="<%=tenCoQuan%>">
							    	</div>
								</div>
								
								<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="diaChiCoQuan">Địa chỉ cơ quan:</label>
							    	</div>
							    	<div class="col-md-6 col-sm-12">
							    		<input type="text" name="diaChiCoQuan" id="viTriCongViec" class="form-control" value="<%=diaChiCoQuan%>">
							    	</div>
								</div>
								
								<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="mucDoPhuHopChuyenMon">Mức độ phù hợp chuyên môn:</label>
							    	</div>
							    	<div class="col-md-3 col-sm-12">
							    		<select name="mucDoPhuHopChuyenMon" class="form-control">
							    			<option>Cao</option>
							    			<option>Trung bình</option>
							    			<option>Thấp</option>
							    		</select>
							    	</div>
								</div>
								
								<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="mucDoDapUngKTCM">Mức độ đáp ứng của kiến thức chuyên môn</label>
							    	</div>
							    	<div class="col-md-3 col-sm-12">
							    		<select name="mucDoDapUngKTCM" class="form-control">
							    			<option>Cao</option>
							    			<option>Trung bình</option>
							    			<option>Thấp</option>
							    		</select>
							    	</div>
								</div>
								
								<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="loaiHinhCoQuan">Loại hình cơ quan:</label>
							    	</div>
							    	<div class="col-md-3 col-sm-12">
							    		<select name="loaiHinhCoQuan" class="form-control">
							    			<option>Cao</option>
							    			<option>Trung bình</option>
							    			<option>Thấp</option>
							    		</select>
							    	</div>
								</div>
								
								<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="mucThuNhapTrungBinh">Mức thu nhập trung bình tháng:</label>
							    	</div>
							    	<div class="col-md-3 col-sm-12">
							    		<input type="number" name="mucThuNhapTrungBinh" id="mucThuNhapTrungBinh" class="form-control" value="<%=mucThuNhapTBThang%>">
							    	</div>
								</div>
					    	</div>
					    	
						  	<div id="dangHocNangCao" class="tab-pane fade"><br>
						   		<div class="row form-group">
						   			<div class="col-md-6 col-sm-12">
					   					<div class="form-group">
					   						<label for="tenTruongNangCao">Tên trường:</label>
					   						<select name="tenTruongNangCao" class="form-control">
								    			<%for(TruongBean tb : danhSachTruong) {%>
													<option value="<%=tb.getMatruong()%>"><%=tb.getTentruong() %></option>
												<%} %>
								    		</select>
					   					</div>
					   					
					   					<div class="form-group">
					   						<label for="tenNganhNangCao">Ngành học:</label>
					   						<select name="tenNganh" class="form-control">
								    			<option>Cao</option>
								    			<option>Trung bình</option>
								    			<option>Thấp</option>
								    		</select>
					   					</div>
					   					
					   					<div class="form-group">
					   						<label for="nienKhoaNangCao">Niên khóa:</label>
					   						<input type="text" name="nienKhoa" id="nienKhoa" class="form-control">
					   					</div>
						   			</div>
						   			
						   			<div class="col-md-6 col-sm-12">
						   				<div class="form-group">
					   						<label for="trinhDoDaoTaoNangCao">Trình độ đào tạo:</label>
					   						<select name="trinhDoDaoTaoNangCao" class="form-control">
								    			<option>Nghiên cứu sinh</option>
								    			<option>Thạc sĩ</option>
								    			<option>Tiến sĩ</option>
								    		</select>
					   					</div>
					   					
					   					<div class="form-group">
					   						<label for="hinhThucDaoTaoNangCao">Hình thức đào tạo:</label>
					   						<select name="hinhThucDaoTaoNangCao" class="form-control">
								    			<option>Tập trung</option>
								    			<option>Không tập trung</option>
								    		</select>
					   					</div>
						   			</div>
						   		</div>
						  	</div>
						  	<div id="thatNghiep" class="text-center tab-pane fade"><br>
						    	<h3>Cảm ơn bạn đã dành thời gian khai báo!</h3>
						  	</div>
						</div>
					</div>
				</div>
			</div>
		
			<div class="card-footer">
				<div class="form-group text-right">
					<input type="hidden" name="command" value="capNhat">
					<input type="submit" name="capNhat" value="Cập nhật" class="btn btn-success mr-5">
					<a href="sinhVien" class="btn btn-outline-danger">Hủy</a>
				</div>
			</div>
		</div>
	</form>
	</div>
	
	<script src="./Library/custom/js/my-script.js"></script>
	
</body>
</html>