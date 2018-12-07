<%@page import="bean.ThongTinViecLamBean"%>
<%@page import="bean.ThongTinTaiKhoanBean"%>
<%@page import="bean.LoaiHinhCoQuanBean"%>
<%@page import="bean.NganhDaoTaoBean"%>
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
	<link rel="stylesheet" href="./Library/custom/css/sinhVien.css">
</head>
<%
DateFormat df = new SimpleDateFormat("dd.MM.yy");

ArrayList<TruongBean> danhSachTruong = (ArrayList<TruongBean>) request.getAttribute("danhSachTruong");
ArrayList<NganhDaoTaoBean> danhSachNganh = (ArrayList<NganhDaoTaoBean>) request.getAttribute("danhSachNganh");
ArrayList<LoaiHinhCoQuanBean> listLoaiHinhCoQuan = (ArrayList<LoaiHinhCoQuanBean>) request.getAttribute("listLoaiHinhCoQuan");

//lay thong tin sinh vien
SinhVienBean sv = (SinhVienBean) request.getAttribute("sinhVien");

//khoi tao gia tri mac dinh
String hoTen = "", danToc = "", quocTich = "", ngaySinh = "", gioiTinh = "", cMND = "", noiCapCMND = "",
	diaChiThuongTru = "", soDienThoai = "", email = "",
	tenTruong = "", tenNganh = "", thoiGianTotNghiep = "", soQuyetDinhTotNghiep = "", ngayKyQuyetDinhTotNghiep = "", nienKhoa = "",
	tenCongViec = "", thoiGianBatDauLamViec = "", tenCoQuan = "", diaChiCoQuan = "", viTriCongTac = "",
	mucDoPhuHopChuyenMon = "", mucDoDapUngKTCM = "";
int loaiHinhCoQuan = 0;
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
	
	if(sv.getThongTinViecLam() != null) {
		ThongTinViecLamBean vl = sv.getThongTinViecLam();
		// Thong tin viec lam
		tenCongViec = vl.getTenCongViec() == null ? "" : vl.getTenCongViec();
		thoiGianBatDauLamViec = vl.getThoiGianBatDauLamViec() == null ? "" : vl.getThoiGianBatDauLamViec().toString();
		tenCoQuan = vl.getTenCoQuan() == null ? "" : vl.getTenCoQuan();
		diaChiCoQuan = vl.getDiaChiCoQuan() == null ? "" : vl.getDiaChiCoQuan();
		viTriCongTac = vl.getViTriCongTac() == null ? "" : vl.getViTriCongTac();
		mucDoDapUngKTCM = vl.getMucDoDapUngKienThuc() == null ? "" : vl.getMucDoDapUngKienThuc();
		mucDoPhuHopChuyenMon = vl.getMucDoPhuHopChuyenMon() == null ? "" : vl.getMucDoPhuHopChuyenMon();
		mucThuNhapTBThang = vl.getMucThuNhapTBThang();
		loaiHinhCoQuan = vl.getLoaiHinhCoQuan();
	}
}
%>
<body>
	<div class="container mt-5">
	<!-- action="sinhVien" method="post" onsubmit="return checkNgayThang()" -->
	<form>
		<div class="card">
			<div class="card-header text-center">
				<h3>Khai báo thông tin sinh viên</h3>
			</div>
			<div class="card-body">
				<div class="form-group">
					<div class="row">
					
	<!-- THONG TIN CHUNG -->
						<h4 class="col-12">Thông tin chung:</h4>
						<div class="col-md-5 col-sm-12">
							<div class="form-group">
								<label for="hoTen">Họ và tên (<span class="text-danger"><b>*</b></span>)</label>
								<input type="text" name="hoTen" id="hoTen" class="form-control" value="<%=hoTen%>" maxlength="100">
							</div>
							
							<div class="form-group">
								<label for="ngaySinh">Ngày sinh (<span class="text-danger"><b>*</b></span>)</label>
								<input type="date" name="ngaySinh" id="ngaySinh" class="form-control" 
									value="<%=ngaySinh.toString()%>">
							</div>
							
							<div class="form-group">
								<label for="gioiTinh">Giới tính</label>
								<select class="form-control" name="gioiTinh" id="gioiTinh">
									<option value="1" <%=gioiTinh.equals("Nam") ? "selected" : "" %>>Nam</option>
									<option value="0" <%=gioiTinh.equals("Nữ") ? "selected" : "" %>>Nữ</option> 
								</select>
							</div>
							
							<div class="form-group">
								<label for="danToc">Dân tộc (<span class="text-danger"><b>*</b></span>)</label>
								<input type="text" name="danToc" id="danToc" class="form-control" value="<%=danToc%>" maxlength="50">
							</div>
						</div>
						<div class="col-md-4 col-sm-12">
							<div class="form-group">
								<label for="quocTich">Quốc tịch (<span class="text-danger"><b>*</b></span>)</label>
								<input type="text" name="quocTich" id="quocTich" class="form-control" value="<%=quocTich%>" maxlength="50">
							</div>
							
							<div class="form-group">
								<label for="cMND">Số CMND (<span class="text-danger"><b>*</b></span>)</label>
								<input type="text" name="cMND" id="cMND" class="form-control" value="<%=cMND%>" maxlength="20">
							</div>
							
							<div class="form-group">
								<label for="noiCapCMND">Nơi cấp CMND (<span class="text-danger"><b>*</b></span>)</label>
								<input type="text" name="noiCapCMND" id="noiCapCMND" class="form-control" value="<%=noiCapCMND%>" maxlength="50">
							</div>
						</div>
							
						<div class="col-md-3 col-sm-12 text-center">
							<label for="anhDaiDien">Ảnh đại diện</label><br>
							<div id="image-holder"
								 style="height:150px; width: 150px; margin: 0px auto;
								 		background-image: url('./image/avatar.png') ;
								 		background-size: cover;
								 		background-position: top;"> </div>
							<br>
							<input  type="file" accept="image/*"
									name="anhDaiDien" id="anhDaiDien" 
									class="btn p-0 m-0 w-100 mt-3">
						</div>
					</div>
				</div>
				<hr>
	<!-- THONG TIN LIEN HE -->
				<div class="form-group">
					<div class="row">
						<h4 class="col-12">Thông tin liên hệ:</h4>
						<div class="col-md-5 col-sm-12">
							<div class="form-group">
								<label for="diaChi">Địa chỉ thường trú (<span class="text-danger"><b>*</b></span>)</label>
								<input type="text" name="diaChi" id="diaChi" class="form-control" value="<%=diaChiThuongTru%>" maxlength="200">
							</div>
						</div>
						
						<div class="col-md-4 col-sm-12">
							<div class="form-group">
								<label for="email">Email (<span class="text-danger"><b>*</b></span>)</label>
								<input type="email" name="email" id="email" class="form-control" value="<%=email%>" maxlength="100">
							</div>
						</div>
						
						<div class="col-md-3 col-sm-12">
							<div class="form-group">
								<label for="soDienThoai">Số điện thoại (<span class="text-danger"><b>*</b></span>)</label>
								<input type="text" name="soDienThoai" id="soDienThoai" class="form-control" value="<%=soDienThoai%>" maxlength="20">
							</div>
						</div>
					</div>
				</div>
				<hr>
	<!-- THONG TIN DAO TAO -->
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
								<select name="tenNganh" id="tenNganh" class="form-control">
									<%for(NganhDaoTaoBean ndt : danhSachNganh) {%>
										<option value="<%=ndt.getMaNganh()%>"><%=ndt.getTenNganh() %></option>
									<%} %>
								</select>
							</div>
														
							<div class="form-group">
								<label for="nienKhoa">Niên khóa (<span class="text-danger"><b>*</b></span>)</label>
								<input type="text" name="nienKhoa" id="nienKhoa" class="form-control" value="<%=nienKhoa%>" maxlength="100">
							</div>
						</div>
						
						<div class="col-md-4 col-sm-12">
							<div class="form-group">
								<label for="thoiGianTotNghiep">Thời gian tốt nghiệp (<span class="text-danger"><b>*</b></span>)</label>
								<input type="date" name="thoiGianTotNghiep" id="thoiGianTotNghiep" class="form-control" value="<%=thoiGianTotNghiep%>">
							</div>
							
							<div class="form-group">
								<label for="soQuyetDinhTotNghiep">Số quyết định tốt nghiệp (<span class="text-danger"><b>*</b></span>)</label>
								<input type="text" name="soQuyetDinhTotNghiep" id="soQuyetDinhTotNghiep" class="form-control" 
									value="<%=soQuyetDinhTotNghiep%>" maxlength="50">
							</div>
							
							<div class="form-group">
								<label for="ngayKyQuyetDinh">Ngày ký quyết định tốt nghiệp (<span class="text-danger"><b>*</b></span>)</label>
								<input type="date" name="ngayKyQuyetDinh" id="ngayKyQuyetDinh" class="form-control" value="<%=ngayKyQuyetDinhTotNghiep%>">
							</div>
						</div>
					</div>
				</div>
				<hr>
	<!-- THONG TIN VIEC LAM -->
				<div class="form-group">
					<div class="mt-3">
						<div class="row">
							<h4 class="col-12">Thông tin việc làm</h4>
							<div class="form-group col-12 text-center">
								<div class="form-check-inline col-3">
									<label class="form-check-label">
										<input type="radio" class="form-check-input" name="tinhTrangViecLam" 
											value="dangDiLam" id="dangDiLamOption" checked>
										Đang đi làm
									</label>
								</div>
								<div class="form-check-inline col-3">
									<label class="form-check-label">
									    <input type="radio" class="form-check-input" name="tinhTrangViecLam"
									    	value="dangHocNangCao" id="dangHocNangCaoOption">
									    Đang học nâng cao
								  	</label>
								</div>
								<div class="form-check-inline col-3">
									<label class="form-check-label">
									    <input type="radio" class="form-check-input" name="tinhTrangViecLam" 
									    	value="thatNghiep" id="thatNghiepOption">
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
							    		<label for="tenCongViec">Tên công việc: (<span class="text-danger"><b>*</b></span>)</label>
							    	</div>
							    	<div class="col-md-6 col-sm-12">
							    		<input type="text" name="tenCongViec" id="tenCongViec" class="form-control" 
							    			value="<%=tenCongViec%>" maxlength="200">
							    	</div>
								</div>
						    	<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="thoiGianBatDauLamViec">Thời gian bắt đầu làm việc: (<span class="text-danger"><b>*</b></span>)</label>
							    	</div>
							    	<div class="col-md-3 col-sm-12">
							    		<input type="date" name="thoiGianBatDauLamViec" id="thoiGianBatDauLamViec" class="form-control"
							    			value="<%=thoiGianBatDauLamViec%>">
							    	</div>
								</div>
						    	
						    	<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="viTriCongTac">Vị trí công tác:</label>
							    	</div>
							    	<div class="col-md-6 col-sm-12">
							    		<input type="text" name="viTriCongTac" id="viTriCongTac" class="form-control"
							    		 value="<%=viTriCongTac%>" maxlength="50">
							    	</div>
								</div>
								
								<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="tenCoQuan">Tên cơ quan:</label>
							    	</div>
							    	<div class="col-md-6 col-sm-12">
							    		<input type="text" name="tenCoQuan" id="tenCoQuan" class="form-control" value="<%=tenCoQuan%>"
							    			maxlength="200">
							    	</div>
								</div>
								
								<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="diaChiCoQuan">Địa chỉ cơ quan:</label>
							    	</div>
							    	<div class="col-md-6 col-sm-12">
							    		<input type="text" name="diaChiCoQuan" id="diaChiCoQuan" class="form-control" 
							    		value="<%=diaChiCoQuan%>" maxlength="200">
							    	</div>
								</div>
								
								<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="mucDoPhuHopChuyenMon">Mức độ phù hợp chuyên môn:</label>
							    	</div>
							    	<div class="col-md-3 col-sm-12">
							    		<select name="mucDoPhuHopChuyenMon" id="mucDoPhuHopChuyenMon" class="form-control">
							    			<option value="Cao">Cao</option>
							    			<option value="Trung bình">Trung bình</option>
							    			<option value="Thấp">Thấp</option>
							    		</select>
							    	</div>
								</div>
								
								<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="mucDoDapUngKTCM">Mức độ đáp ứng của kiến thức chuyên môn</label>
							    	</div>
							    	<div class="col-md-3 col-sm-12">
							    		<select name="mucDoDapUngKTCM" id="mucDoDapUngKTCM" class="form-control">
							    			<option value="Cao">Cao</option>
							    			<option value="Trung bình">Trung bình</option>
							    			<option value="Thấp">Thấp</option>
							    		</select>
							    	</div>
								</div>
								
								<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="loaiHinhCoQuan">Loại hình cơ quan:</label>
							    	</div>
							    	<div class="col-md-3 col-sm-12">
							    		<select name="loaiHinhCoQuan" id="loaiHinhCoQuan" class="form-control">
							    			<%for(LoaiHinhCoQuanBean lh : listLoaiHinhCoQuan) {%>
							    				<option value="<%=lh.getMaLoai()%>"
							    					<%if(lh.getMaLoai() == loaiHinhCoQuan) {%> selected <%} %>
						    					><%=lh.getTenLoai() %></option>
							    			<%} %>
							    		</select>
							    	</div>
								</div>
								
								<div class="row form-group">
									<div class="col-md-4 col-sm-12">
							    		<label for="mucThuNhapTBThang">Mức thu nhập trung bình tháng:</label>
							    	</div>
							    	<div class="col-md-3 col-sm-12">
							    		<input type="number" name="mucThuNhapTBThang" id="mucThuNhapTBThang" class="form-control" 
							    			value="<%=mucThuNhapTBThang%>" step="50000">
							    	</div>
								</div>
					    	</div>
					    	
						  	<div id="dangHocNangCao" class="tab-pane fade"><br>
						   		<div class="row form-group">
						   			<div class="col-md-6 col-sm-12">
					   					<div class="form-group">
					   						<label for="tenTruongNangCao">Tên trường:</label>
					   						<select name="tenTruongNangCao" id="tenTruongNangCao" class="form-control">
								    			<%for(TruongBean tb : danhSachTruong) {%>
													<option value="<%=tb.getMatruong().trim()%>"><%=tb.getTentruong() %></option>
												<%} %>
								    		</select>
					   					</div>
					   					
					   					<div class="form-group">
					   						<label for="tenNganhNangCao">Ngành học:</label>
					   						<select name="tenNganhNangCao" id="tenNganhNangCao" class="form-control">
								    			<%for(NganhDaoTaoBean ndt : danhSachNganh) {%>
													<option value="<%=ndt.getMaNganh().trim()%>"><%=ndt.getTenNganh() %></option>
												<%} %>
								    		</select>
					   					</div>
					   					
					   					<div class="form-group">
					   						<label for="nienKhoaNangCao">Niên khóa: (<span class="text-danger"><b>*</b></span>)</label>
					   						<input type="text" name="nienKhoaNangCao" id="nienKhoaNangCao" class="form-control">
					   					</div>
						   			</div>
						   			
						   			<div class="col-md-6 col-sm-12">
						   				<div class="form-group">
					   						<label for="trinhDoDaoTaoNangCao">Trình độ đào tạo:</label>
					   						<select name="trinhDoDaoTaoNangCao" id="trinhDoDaoTaoNangCao" class="form-control">
								    			<option value="Nghiên cứu sinh">Nghiên cứu sinh</option>
								    			<option value="Thạc sĩ">Thạc sĩ</option>
								    			<option value="Tiến sĩ">Tiến sĩ</option>
								    		</select>
					   					</div>
					   					
					   					<div class="form-group">
					   						<label for="hinhThucDaoTaoNangCao">Hình thức đào tạo:</label>
					   						<select name="hinhThucDaoTaoNangCao" id="hinhThucDaoTaoNangCao" class="form-control">
								    			<option value="Tập trung">Tập trung</option>
								    			<option value="Không tập trung">Không tập trung</option>
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
					<input type="hidden" name="maSinhVien" id="maSinhVien" value="<%=sv.getMaSinhVien()%>">
					<!-- <input type="hidden" name="command" value="capNhat"> -->
					<input type="button" name="capNhat" id="capNhatBtn" 
						value="Cập nhật" class="btn btn-success mr-5">
					<a href="sinhVien" class="btn btn-outline-danger">Hủy</a>
				</div>
			</div>
		</div>
	</form>
	</div>
	
	<div class="modal modal-close" id="thongBaoModal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title text-center" id="tieuDeThongBao"></h4>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger" id="alertMode">
						<span class="glyphicon glyphicon-warning-sign" id="noiDungThongBao"></span>
					</div>
				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-danger w-25" id="closeModal">
						<span class="glyphicon glyphicon-remove"></span> OK
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal modal-close" id="wait" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div style="display: flex;
						justify-content: center; align-items: center;">
				<img src='./image/loading.gif' width="64" height="64" />
			</div>
		</div>
	</div>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="./Library/custom/js/sinh-vien-script.js"></script>
	<script src="./Library/custom/js/validate-info-script.js"></script>
</body>
</html>