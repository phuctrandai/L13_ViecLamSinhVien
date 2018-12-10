
<%@page import="bean.ThongTinTaiKhoanBean"%>
<%@page import="bean.TaiKhoanBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Quản lý tài khoản</title>
	
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	ArrayList<TaiKhoanBean> listTaiKhoan = (ArrayList<TaiKhoanBean>) request.getAttribute("listTaiKhoan");
	ArrayList<ThongTinTaiKhoanBean> listThongTin = (ArrayList<ThongTinTaiKhoanBean>) request.getAttribute("listThongTin");
	%>
	<div class="d-flex justify-content-between container mt-3">
		<div>
			<p><%="Xin chào: " + ((TaiKhoanBean)request.getSession().getAttribute("taiKhoan")).getTenTaiKhoan() %></p>
		</div>
		<div>
			<form action="taiKhoan" method="POST">
				<input type="hidden" name="command" value="logout">
				<input type="submit" class="btn btn-outline-danger float-right" value="Đăng xuất">
			</form>
		</div>
	</div>
	<hr>
		
	<div class="container-fluid">
		<h2 class="text-center mb-5">Quản lý tài khoản</h2>
		<div class="row">
			<div class="col-2">
				<button type="button" class="btn btn-outline-success btn-sm">
					Tải lại danh sách &#x21BA;
				</button>
			</div>
			<div class="col-9">
				<form class="form-inline w-100">
					<label>Tìm kiếm:</label> 
					<input type="search" class="form-control form-control-sm ml-3 col-8"> 
					<select class="form-control form-control-sm ml-1 float-right">
						<option>Tên tài khoản</option>
						<option>Loại tài khoản</option>
					</select> 
					<input type="submit" class="btn btn-dark ml-3 float-right  btn-sm" name="" value="Tìm">
					<input type="hidden" name="timKiem" value="timKiem" id="timKiem">
				</form>
			</div>
			<div class="col-1 ">
				<a class="btn btn-outline-primary btn-sm float-right" href="taiKhoan?command=add">
					Thêm tài khoản	&#x2542;
				</a>
			</div>
		</div>
	</div>
	
	<div class="col-12 mt-5">
		<div class="table-responsive">
			<table id="mytable" class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<td>Tên tài khoản</td>
						<td>Mật khẩu</td>
						<td>Loại tài khoản</td>
						<td>Họ và tên</td>
						<td>Ngày sinh</td>
						<td>Giới tính</td>
						<td>CMND</td>
						<td colspan='3' class="text-center">Chức năng</td>
					<tr>
				</thead>
				<tbody>
					<%
						if (listTaiKhoan != null && listThongTin != null) {
							TaiKhoanBean dangDN = ((TaiKhoanBean)request.getSession().getAttribute("taiKhoan"));
							for (int i=0 ; i < listTaiKhoan.size() ; i++) {
								String hoVaTen = "", ngaySinh = "", gioiTinh = "", CMND = "";
								TaiKhoanBean tk = listTaiKhoan.get(i);
								ThongTinTaiKhoanBean tt = listThongTin.get(i);
								
								if(dangDN.getMaTaiKhoan() == tk.getMaTaiKhoan()) continue;
								
								if(tt != null) {
									hoVaTen = tt.getHoVaTen() == null ? "" : tt.getHoVaTen();
									ngaySinh = tt.getNgaySinh() == null ? "" : tt.getNgaySinh().toString();
									gioiTinh = tt.isGioiTinh() == true ? "Nam" : "Nữ";
									CMND = tt.getcMND() == null ? "" : tt.getcMND();
								} else {
									
								}
					%>
					<tr>
						<td><%=tk.getTenTaiKhoan()%></td>
						<td><%=tk.getMatKhau()%></td>
						<td><%=tk.getTenLoai()%></td>
						<td><%=hoVaTen%></td>
						<td><%=ngaySinh%></td>
						<td><%=gioiTinh%></td>
						<td><%=CMND%></td>
						
						<td>
							<a href="#">Xem chi tiết</a>
						</td>
						<td>
							<p data-placement="top" data-toggle="tooltip" title="Edit">
								<button class="btn btn-primary btn-sm" data-title="Edit"
										data-toggle="modal" data-target="#chinhSuaModal">
									<i class="material-icons" style="font-size: 18px">border_color</i>
								</button>
							</p>
						</td>
						<td>
							<p data-placement="top" data-toggle="tooltip" title="Delete">
								<button class="btn btn-danger btn-sm xoaTruongBtn" 
									data-title="<%=tk.getTenTaiKhoan()%>,<%=tk.getTenLoai()%>,<%=tk.getMaTaiKhoan()%>"
									data-toggle="modal" data-target="#xoaTaiKhoan">
										<i class="material-icons" style="font-size: 18px">delete</i>
								</button>
							</p>
						</td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>

			<div class="clearfix"></div>
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="javascript:void(0);">&larr;</a></li>
				<li class="page-item"><a class="page-link"
					href="javascript:void(0);">1</a></li>
				<li class="page-item"><a class="page-link"
					href="javascript:void(0);">2</a></li>
				<li class="page-item"><a class="page-link"
					href="javascript:void(0);">&rarr;</a></li>
			</ul>

		</div>
	</div>
	
	<div class="modal fade" id="xoaTaiKhoan" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title text-center">Xác nhận xóa</h4>
				</div>
				<div class="modal-body">
					
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span>
						<h6>Tên tài khoản: "<span id="tenTaiKhoanTB"></span>"</h6>
						<h6>Loại tài khoản: "<span id="loaiTaiKhoanTB"></span>"</h6>
					</div>

				</div>
				<div class="modal-footer ">
					<form action="taiKhoan" method="post" class="w-100 text-right">
						<input type="hidden" name="command" value="xoaTaiKhoan">
						<input type="hidden" name="maTaiKhoan" id="maTaiKhoanTB"/>
						
						<button type="button" class="btn btn-danger w-25" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Hủy
						</button>
						
						<input type="submit" class="btn btn-outline-secondary" value="Xóa">
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function(){
	    $('.xoaTruongBtn').click(function(){
	        var info = $(this).attr('data-title').split(',');
	        $('#tenTaiKhoanTB').html(info[0]);
	        $('#loaiTaiKhoanTB').html(info[1]);
	        $('#maTaiKhoanTB').val(info[2]);	        
	    });
	});
	</script>
</body>
</html>