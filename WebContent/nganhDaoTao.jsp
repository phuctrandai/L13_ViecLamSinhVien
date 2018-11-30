<%@page import="java.util.ArrayList"%>
<%@page import="bean.NganhDaoTaoBean"%>
<%@page import="dao.Connect"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Quản lí ngành đào tạo</title>

<!-- <link rel="stylesheet" href="css/qltk.css"> -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		ArrayList<NganhDaoTaoBean> listNganh = (ArrayList<NganhDaoTaoBean>) request.getAttribute("listn");
	%>

	<jsp:include page="topMenu.jsp"></jsp:include>

	<div class="container-fluid">
		<h4 class="text-center mb-3">Quản lý ngành đào tạo</h4>
		<h2 class="text-center text-danger mb-5">Đại học Khoa học Huế</h2>
		<div class="row">
			<div class="col-2">
				<button type="button" class="btn btn-outline-success btn-sm">
					Tải lại danh sách &#x21BA;</button>
			</div>
			<div class="col-8">
				<form class="form-inline w-100">
					<label>Tìm kiếm:</label> <input type="search"
						class="form-control ml-3 col-7"> <select
						class="form-control ml-1 float-right">
						<option>Tên ngành</option>
						<option>Mã ngành</option>
						<option>Hình thức đào tạo</option>
						<option>Tất Cả</option>
					</select> <input type="submit" class="btn btn-dark ml-3 float-right" name=""
						value="Tìm"> <input type="hidden" name="timKiem"
						value="timKiem" id="timKiem">
				</form>
			</div>
			<div class="col-2 ">
				<button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#themModal"> <span
					class="glyphicon glyphicon-plus"></span> Thêm ngành đào tạo
					&#x2542;
				</button>
			</div>
		</div>
	</div>
	
	<div class="modal fade " id="themModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="nganhDaoTao" method="post">
					<!-- Modal Header -->
					<div class="modal-header">
						<h2 class="modal-title" style="text-align: center; color: red">Thêm ngành đào tạo</h2>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
	
					<!-- Modal body -->
					<div class="modal-body">
						<div class="form-group">
							<label for="username" class="control-label">Mã trường: (<span class="text-danger"><b>*</b></span>)</label> 
							<input
								class="form-control" id="username" name="matruong"
								title="Xin vui lòng nhập tên tài khoản" placeholder="Mã trường"
								type="text"><span class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="username" class="control-label">Tên trường: (<span class="text-danger"><b>*</b></span>)</label> 
							<input
								class="form-control" id="password" name="tentruong"
								title="Xin vui lòng nhập mật khẩu" placeholder="Tên trường"
								type="text"><span class="help-block"></span>
						</div>
						<div class="form-group">
							<label class="control-label">Trình độ đào tạo:</label> 
							<select
								class="form-control" name="tddt">
								<option>Đại học</option>
								<option>Cao đẳng</option>
							</select>
						</div>
						<div class="form-group">
							<label class="control-label">Hình thức đào tạo:</label> 
							<select
								class="form-control" name="htdt">
								<option>Chính quy</option>
								<option>Liên thông</option>
	
							</select>
						</div>
						<div class="form-group">
							<label class="control-label">Hệ đào tạo:</label> 
							<select
								class="form-control" name="hdt">
								<option>Cử nhân</option>
								<option>Thạc sĩ</option>
								<option>Tiến sĩ</option>
							</select><span class="help-block"></span>
						</div>
						<input type="hidden" name="command" value="themNganhDaoTao">
					</div>
	
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary w-25" data-dismiss="modal">Hủy</button>
						<button type="button" class="btn btn-danger w-50" data-dismiss="modal">Lưu</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="col-12 mt-5">
		<div class="table-responsive">
			<table id="mytable" class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<td>Mã Ngành</td>
						<td>Tên Ngành</td>
						<td>Hình thức đào tạo</td>
						<td>Hệ đào tạo</td>
						<td>Trình độ đào tạo</td>
						<td>Edit</td>
						<td>Delete</td>
					<tr>
				</thead>
				<tbody>
					<%
						if (listNganh != null) {
							for (NganhDaoTaoBean nganh : listNganh) {
					%>
					<tr>
						<td><%=nganh.getMaNganh()%></td>
						<td><%=nganh.getTenNganh()%></td>
						<td><%=nganh.getHinhThucDT()%></td>
						<td><%=nganh.getHeDT()%></td>
						<td><%=nganh.getTrinhDoDT()%></td>
						<td><p data-placement="top" data-toggle="tooltip"
								title="Edit">
								<button class="btn btn-primary btn-sm" data-title="Edit"
									data-toggle="modal" data-target="#chinhSuaModal">
									<i class="material-icons" style="font-size: 18px">border_color</i>
								</button>
							</p></td>
						<td><p data-placement="top" data-toggle="tooltip"
								title="Delete">
								<button class="btn btn-danger btn-sm" data-title="Delete"
									data-toggle="modal" data-target="#delete">
									<i class="material-icons" style="font-size: 18px">delete</i>
								</button>
							</p></td>
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


	<div class="modal fade " id="chinhSuaModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="nganhDaoTao" method="post">
					<!-- Modal Header -->
					<div class="modal-header">
						<h2 class="modal-title" style="text-align: center; color: red">Chỉnh sửa ngành đào tạo</h2>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
	
					<!-- Modal body -->
					<div class="modal-body">
						<div class="form-group">
							<label for="username" class="control-label">Mã trường: (<span class="text-danger"><b>*</b></span>)</label> 
							<input
								class="form-control" id="username" name="matruong"
								title="Xin vui lòng nhập tên tài khoản" placeholder="Mã trường"
								type="text"><span class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="username" class="control-label">Tên trường: (<span class="text-danger"><b>*</b></span>)</label> 
							<input
								class="form-control" id="password" name="tentruong"
								title="Xin vui lòng nhập mật khẩu" placeholder="Tên trường"
								type="text"><span class="help-block"></span>
						</div>
						<div class="form-group">
							<label class="control-label">Trình độ đào tạo:</label> 
							<select
								class="form-control" name="tddt">
								<option>Đại học</option>
								<option>Cao đẳng</option>
							</select>
						</div>
						<div class="form-group">
							<label class="control-label">Hình thức đào tạo:</label> 
							<select
								class="form-control" name="htdt">
								<option>Chính quy</option>
								<option>Liên thông</option>
	
							</select>
						</div>
						<div class="form-group">
							<label class="control-label">Hệ đào tạo:</label> 
							<select
								class="form-control" name="hdt">
								<option>Cử nhân</option>
								<option>Thạc sĩ</option>
								<option>Tiến sĩ</option>
							</select><span class="help-block"></span>
						</div>
						<input type="hidden" name="command" value="themNganhDaoTao">
					</div>
	
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary w-25" data-dismiss="modal">Hủy</button>
						<button type="button" class="btn btn-danger w-50" data-dismiss="modal">Lưu</button>
					</div>
				</form>
			</div>
		</div>
	</div>



	<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title text-center">Delete this entry</h4>
				</div>
				<div class="modal-body">

					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span> Are you
						sure you want to delete this Record?
					</div>

				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-danger w-25" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> No
					</button>
					<a href="#" class="btn btn-outline-secondary">
						<span class="glyphicon glyphicon-ok-sign"></span> Yes
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>