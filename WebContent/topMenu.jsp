<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="w-100">
	<table class="w-75 mt-3 ml-auto mr-auto">
		<tr>
			<td>
				<a class="text-dark float-left" href="#">Tên tài khoản</a>
			</td>
			<td>
				<a href="taiKhoan?command=info" class="btn btn-outline-primary">Thông tin tài khoản</a>
			</td>
			<td>
				<a href="truong" class="btn btn-outline-primary">Quản lý trường</a>
			</td>
			<td>
				<a href="#" class="btn btn-outline-primary">Quản lý sinh viên</a>
			</td>
			<td>
				<a href="#" class="btn btn-outline-primary">Thống kê</a>
			</td>
			<td>
				<form action="taiKhoan" method="POST">
					<input type="hidden" name="command" value="logout">
					<input type="submit" class="btn btn-outline-danger float-right" value="Đăng xuất">
				</form>
			</td>
		</tr>
	</table>
	<hr>
</div>