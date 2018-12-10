<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Đổi mật khẩu</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body class="d-flex justify-content-center">
	<div class="w-100 mt-5" style="max-width: 400px">
		<form class="form">
			<input type="hidden" name="command" value="luuMatKhau">
			<div class="card">
				<div class="card-header">
					<h3>Đổi mật khẩu</h3>
				</div>
				<div class="card-body">
					<div class="form-group">
						<label for="matKhauCu" id="matKhauCuLabel">Mật khẩu cũ (<span class="text-danger"><b>*</b></span>)</label>
						<input type="password" name="matKhauCu" id="matKhauCu" class="form-control">
					</div>
					<div class="form-group">
						<label for="matKhauMoi" id="matKhauMoiLabel">Mật khẩu mới (<span class="text-danger"><b>*</b></span>)</label>
						<input type="password" name="matKhauMoi" id="matKhauMoi" class="form-control">
					</div>
					<div class="form-group">
						<label for="matKhauXacNhan" id="matKhauXacNhanLabel">Xác nhận mật khẩu mới (<span class="text-danger"><b>*</b></span>)</label>
						<input type="password" name="matKhauXacNhan" id="matKhauXacNhan" class="form-control">
					</div>
				</div>
				<div class="card-footer d-flex justify-content-end">
					<a href="sinhVien" class="btn btn-outline-secondary mr-5">Hủy</a>
					<input type="button" name="saveBtn" class="btn btn-success" value="Lưu" onclick="validateMatKhau()">
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
	
	<script src="./Library/custom/js/doi-mat-khau.js"></script>
</body>
</html>