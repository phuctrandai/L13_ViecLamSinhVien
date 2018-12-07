<%@page import="bean.LoaiTaiKhoanBean"%>
<%@page import="java.util.ArrayList"%>
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

ArrayList<LoaiTaiKhoanBean> listLoai = null;
if(request.getAttribute("listLoai") != null) {
	listLoai = (ArrayList<LoaiTaiKhoanBean>) request.getAttribute("listLoai");
}
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
					<select name="maLoai" class="form-control">
						<%for(int i=0 ; i < listLoai.size() ; i++) { %>
							<option value="<%=listLoai.get(i).getMaLoai()%>"><%=listLoai.get(i).getTenLoai() %></option>
						<%}%>
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