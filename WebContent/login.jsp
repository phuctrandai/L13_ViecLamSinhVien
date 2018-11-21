<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Đăng nhập</title>
	<link rel="stylesheet" href=".\Library\boostrap-4\css\bootstrap.min.css">
	<link rel="stylesheet" href=".\Library\custom\css\login.css">
</head>
<body>
<%
boolean loginFail = false;
if(request.getAttribute("loginFail") != null)
	loginFail = (boolean) request.getAttribute("loginFail");
%>
	<div class="container text-center">
		<h1 class="text-light mt-3">Đăng nhập</h1>
		<div class="card card-container text-left">

			<img id="profile-img" class="profile-img-card"
				src="./image/avatar_2x.png" />

			<form class="form-signin" action="taiKhoan" method="post">
				<input type="hidden" name="command" value="login">
				
				<div class="form-group">
					<label for="tenTaiKhoan">Tên tài khoản:</label>
					<input type="text" id="tenTaiKhoan" name="tenTaiKhoan" class="form-control"
					placeholder="" required autofocus>
				</div>
				
				<div class="form-group">
					<label for="password">Mật khẩu:</label>
					<input type="password" id="matKhau" name="matKhau"
					class="form-control" placeholder="" required>
				</div>
				
				<div class="form-group">
					<label>Vai trò</label>
					<select name="loaiTaiKhoan" class="form-control">
						<option value="Sinh viên">Sinh viên</option>
						<option value="Nhân viên">Nhân viên</option>
						<option value="Quản trị">Quản trị</option>
					</select>
				</div>
				
				<%if(loginFail) {%>
					<label style="color: #f00; font-size: 12px">Tên tài khoản hoặc mật khẩu không đúng!</label>
				<%} %>
				<button class="btn btn-lg btn-primary btn-block btn-signin"
					type="submit" name="dangNhap">Đăng nhập</button>
			</form>
		</div>
	</div>
</body>
	<script src=".\Library\boostrap-4\js\bootstrap.min.js"></script>
</html>