
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Quản lí tài khoản</title>
	<link rel="stylesheet" href="css/qltk.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css" media="screen">
		li{
			list-style-type: none;
			float: left;

		}
		input[type=text] {
			width: 400px;	
			padding: 12px 20px;
			margin: 8px 0;
			box-sizing: border-box;
			border: 3px solid #ccc;
			-webkit-transition: 0.5s;
			transition: 0.5s;
			outline: none;
		}

		input[type=text]:focus {
			border: 3px solid #555;
		}
		select{
			padding: 12px 20px;
			margin: 8px 0;
			box-sizing: border-box;
			border: 3px solid #ccc;
		}
		.container{
			background:white;
		}
	</style>
</head>
<body style="background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));">
	<div class="container" style="border: 1px solid black; height: 50px;">
		<h style="line-height: 50px">Tên Tài Khoản</h>
		<button type="" style="float: right;margin-top: 10pX;"><span class="glyphicon glyphicon-log-out"></span> Đăng xuất</button>

	</div>
	<div class="container">
		<h3 style="margin: 15px 469px;">Quản Lí Tài Khoản</h3>
		<ul>
			<li style="width: 300px;"> 
				<button type="button" class="btn btn-default btn-sm">
					<span class="glyphicon glyphicon-plus"></span> Tạo tài khoản
				</button>
			</li style="width: 800px;">
			<li><form>
				<p> Tìm Kiếm:
					<input type="text" name="" placeholder="Tìm Kiếm">
					<select>
						<option value="0">Select car:</option>
						<option value="1">Audi</option>

					</select>
					<button style="padding: 12px 20px;
					margin: 8px 0;
					box-sizing: border-box;
					border: 3px solid #ccc;" type="submit" class="btn btn-default btn-sm">
					<span class="glyphicon glyphicon-search"></span> Search 
				</button>
			</p> 
		</form>
	</li>
	<li>
		<p>Danh sách tải lại: </p>

	</li>
	<li><button type="">Tải lại</button></li>
</ul>
</div>
<div class="container" >
	<table class="table">
		<thead>
			<tr>
				<th>Tên tài khoản</th>
				<th>Mật khẩu</th>
				<th>Loại tài khoản</th>
				<th>Họ và tên</th>
				<th>Ngày sinh</th>
				<th>Giới tinh</th>
				<th>CMND</th>
				<th>Thao tac</th>
			</tr>
		</thead>
		<tbody>
		<%
// 			ArrayList<QLTaiKhoanBean> ds =(ArrayList<QLTaiKhoanBean>)request.getAttribute("dstk");
// 				 	for(QLTaiKhoanBean h:ds){
		%>
			<tr>
			
				<td><%//h.getMaTaiKhoan() %></td>
				<td>Defaultson</td>
				<td>def@somemail.com</td>
				<td>Default</td>
				<td>Defaultson</td>
				<td>def@somemail.com</td>
				<td>Default</td>
				<td><ul><li style="margin-right: 10px;"><span class="glyphicon glyphicon-edit"></span></p></li>
				<listyle="margin-left: 10px;"><span style="color: red;" class="glyphicon glyphicon-trash"></span></p>  </li></ul></td>
				
			</tr>   
			<% //} %>   
			

		</tbody>
	</table>
	
</div>



</body>
</html>