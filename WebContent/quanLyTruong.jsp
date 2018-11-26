<%@page import="bean.TruongBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Quản lý trường</title>
	
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		ArrayList<TruongBean> listTruong = (ArrayList<TruongBean>) request.getAttribute("danhSachTruong");
	%>
	
	<jsp:include page="topMenu.jsp"></jsp:include>
	
	<div class="container-fluid">
		<h2 class="text-center mb-5">Quản lý trường</h2>
		<div class="row">
			<div class="col-2">
				<button type="button" class="btn btn-outline-success btn-sm">
					Tải lại danh sách &#x21BA;
				</button>
			</div>
			<div class="col-8">
				<form class="form-inline w-100">
					<label>Tìm kiếm:</label> <input type="search"
						class="form-control ml-3 col-8"> <select
						class="form-control ml-1 float-right">
						<option>Tên trường</option>
						<option>Mã trường</option>
						<option>Tất Cả</option>
					</select> 
					<input type="submit" class="btn btn-dark ml-3 float-right" name="" value="Tìm">
					<input type="hidden" name="timKiem" value="timKiem" id="timKiem">
				</form>
			</div>
			<div class="col-2 ">
				<a class="btn btn-outline-success btn-sm float-right" href="truong?command=add">
					Thêm trường	&#x2542;
				</a>
			</div>
		</div>
	</div>
	
	<div class="col-12 mt-5">
		<div class="table-responsive">
			<table id="mytable" class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<td>Mã trường</td>
						<td>Tên trường</td>
						<td>Địa chỉ</td>
						<td>SĐT</td>
						<td>Email</td>
						<td>Số fax</td>
						<td>Website</td>
						<td>Loại hình</td>
						<td>Loại trường</td>
						<td>Tỉnh thành trực thuộc</td>
						<td colspan='3'>Chức năng</td>
					<tr>
				</thead>
				<tbody>
					<%
						if (listTruong != null) {
							for (TruongBean truong : listTruong) {
					%>
					<tr>
						<td><%=truong.getMatruong()%></td>
						<td><%=truong.getTentruong()%></td>
						<td><%=truong.getDiachi()%></td>
						<td><%=truong.getSdt()%></td>
						<td><%=truong.getEmail()%></td>
						<td><%=truong.getSofax()%></td>
						<td><%=truong.getWebsite()%></td>
						<td><%=truong.getLoaihinh()%></td>
						<td><%=truong.getLoaitruong()%></td>
						<td><%=truong.getTinhthanhtructhuoc()%></td>
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
									data-title="<%=truong.getMatruong()%>,<%=truong.getTentruong() %>"
									data-toggle="modal" data-target="#xoaTruong">
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
	
	<div class="modal fade" id="xoaTruong" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title text-center">Xác nhận xóa</h4>
				</div>
				<div class="modal-body">
					
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span>
						<h6>Mã trường: "<span id="maTruongTB"></span>"</h6>
						<h6>Tên trường: "<span id="tenTruongTB"></span>"</h6>
					</div>

				</div>
				<div class="modal-footer ">
					<form action="truong" method="post" class="w-100 text-right">
						<input type="hidden" name="command" value="xoaTruong">
						<input type="hidden" name="maTruong" id="maTruong"/>
						
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
	        $('#maTruong').val(info[0]);
	        $('#maTruongTB').html(info[0]);
	        $('#tenTruongTB').html(info[1]);	        
	    });
	});
	</script>
</body>
</html>