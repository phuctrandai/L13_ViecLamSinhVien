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
				<form class="row" action="truong" method="post">
					<input type="hidden" name="command" value="save">
					<hr>
					<div class="col-6">
						<div class="form-group">
							<label for="maTruong">Mã Trường (<span class="text-danger"><b>*</b></span>)</label> 
							<input
								type="text" class="form-control" name="txtmatruong"
								id="maTruong" placeholder="Nhập mã trường..." required>
						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label for="tenTruong">Tên Trường (<span class="text-danger"><b>*</b></span>)</label>
							<input
								type="text" class="form-control" name="txttentruong" required="required"
								id="tenTruong" placeholder="Nhập tên trường...">
						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label for="diaChi">Địa Chỉ (<span class="text-danger"><b>*</b></span>)</label> 
							<input
								type="text" class="form-control" name="txtdiachi" id="diaChi" required="required"
								placeholder="Nhập địa chỉ...">
						</div>
					</div>

					<div class="col-6">
						<div class="form-group">
							<label for="loaiTruong">Loại Trường</label>
							<select
								class="form-control" id="loaiTruong" name="txtloaitruong">
								<option>Đại Học</option>
								<option>Cao Đẳng</option>
							</select>

						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label for="email">Email (<span class="text-danger"><b>*</b></span>)</label> 
							<input type="text"
								class="form-control" name="txtemail" id="email" required="required"
								placeholder="...@gmail.com">
						</div>
					</div>
					<div class="col-6">

						<div class="form-group">
							<label for="loaiHinh">Loại Hình</label>
							<select
								class="form-control" id="loaiHinh" name="txtloaihinh">
								<option>Công Lập</option>
								<option>Dân Lập</option>

							</select>
						</div>
					</div>
					<div class="col-6">

						<div class="form-group">
							<label for="soDienThoai">Số Điện Thoại (<span class="text-danger"><b>*</b></span>)</label> 
							<input
								type="text" id="soDienThoai" name="txtsdt" class="form-control" required="required"
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
						<button class="btn btn-lg btn-success" type="submit" name="save"
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
</body>
</html>