<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Khai Báo Thông Tin Trường</title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<style>
	.col-6 {
		display: inline-block !important;
	}
</style>
<body>
	<div class="container mt-3">
		<div>
			<h1 style="text-align: center;">KHAI BÁO THÔNG TIN TRƯỜNG</h1>
		</div>
		<div class="mt-5">
			<div class="">
				<form class="row">
					<input type="hidden" name="command" value="save">
					<hr>
					<div class="col-6">
						<div class="form-group">
							<label for="maTruong">Mã Trường (<span class="text-danger"><b>*</b></span>)</label> 
							<input
								type="text" class="form-control" name="txtmatruong"
								id="maTruong" placeholder="Nhập mã trường...">
						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label for="tenTruong">Tên Trường (<span class="text-danger"><b>*</b></span>)</label>
							<input
								type="text" class="form-control" name="txttentruong"
								id="tenTruong" placeholder="Nhập tên trường...">
						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label for="diaChi">Địa Chỉ (<span class="text-danger"><b>*</b></span>)</label> 
							<input
								type="text" class="form-control" name="txtdiachi" id="diaChi" 
								placeholder="Nhập địa chỉ...">
						</div>
					</div>

					<div class="col-6">
						<div class="form-group">
							<label for="loaiTruong">Loại Trường</label>
							<select
								class="form-control" id="loaiTruong" name="txtloaitruong">
								<option value="Đại học">Đại Học</option>
								<option value="Cao đẳng">Cao Đẳng</option>
							</select>

						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label for="email">Email (<span class="text-danger"><b>*</b></span>)</label> 
							<input type="text"
								class="form-control" name="txtemail" id="email" 
								placeholder="...@gmail.com">
						</div>
					</div>
					<div class="col-6">

						<div class="form-group">
							<label for="loaiHinh">Loại Hình</label>
							<select
								class="form-control" id="loaiHinh" name="txtloaihinh">
								<option value="Công lập">Công Lập</option>
								<option value="Dân lập">Dân Lập</option>

							</select>
						</div>
					</div>
					<div class="col-6">

						<div class="form-group">
							<label for="soDienThoai">Số Điện Thoại (<span class="text-danger"><b>*</b></span>)</label> 
							<input
								type="text" id="soDienThoai" name="txtsdt" class="form-control" 
								placeholder="Nhập số điện thoại...">
						</div>
					</div>
					<div class="col-6">

						<div class="form-group">
							<label for="tinhThanh">Tỉnh Thành Trực thuộc</label>
							<select
								class="form-control" id="tinhThanh" name="txttinhthanhtructhuoc">
								<option>Thừa Thiên Huế</option>
								<option>Hồ Chí Minh</option>
							</select>
						</div>
					</div>
					<div class="col-6">

						<div class="form-group">
							<label for="website">Website</label> 
							<input type="text"
								name="txtwebsite" class="form-control" id="website"
								placeholder="Nhập địa chỉ website...">
						</div>
					</div>

					<div class="col-6">
						<div class="form-group">
							<label for="soFax">Số Fax</label>
							<input type="text"
								name="txtsofax" class="form-control" id="soFax"
								placeholder="Nhập số fax...">
						</div>
					</div>

					<div class="col-12">
						<a class="btn btn-lg btn-outline-secondary" href="truong"
							style="float: right;">
							<i class="glyphicon glyphicon-repeat"></i> Hủy
						</a>
						<button class="btn btn-lg btn-success" type="button" name="save" id="saveBtn"
							style="float: right; margin-right: 47px; margin-bottom: 61px;">
							<i class="glyphicon glyphicon-ok-sign"></i> Lưu
						</button>
					</div>

				</form>

				<hr>

			</div>
			<!--/tab-pane-->

			<!--/tab-pane-->
		</div>
		<!--/tab-content-->
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
	
	<div id="wait" 
		style="	display: none;
				background-color: rgba(0,0,0,0.3);
				width: 100%;
				height: 100%;
				position: absolute;
				top: 0;
				left: 0; 
				justify-content: center; align-items: center;">
		<img src='./image/loading.gif' width="64" height="64" />
		<br>Loading..
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="./Library/custom/js/khai-bao-truong.js"></script>
</body>
</html>