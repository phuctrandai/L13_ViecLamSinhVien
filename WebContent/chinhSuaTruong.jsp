<%@page import="bo.TruongBo"%>
<%@page import="bean.TruongBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Khai Báo Thông Tin Trường</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
	type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="container">
		<div>
			<h1 style="text-align: center;">CHỈNH SỬA THÔNG TIN TRƯỜNG</h1>
		</div>
		<%
			String mt = request.getParameter("matruong");
			TruongBo bo = new TruongBo();
			System.out.println(mt);
			TruongBean bean = bo.TimTheoMa(mt);
		%>

		<div class="tab-content">
			<div class="tab-pane active" id="home">

				<form class="form" action="truong" method="post"
					id="registrationForm">
					<hr>
					<div class="form-group">

						<div class="col-xs-6">
							<label for="first_name"><h4>Mã Trường</h4></label> <input
								type="text" class="form-control" name="txtmatruong"
								id="matruong" onkeypress="nhanphim()" <%if (bean != null) {%>
								value="<%=bean.getMatruong()%>" <%}%> id="first_name"
								placeholder="Mã Trường" title="enter your first name if any.">
						</div>
					</div>
					
					<div class="form-group">

						<div class="col-xs-6">
							<label for="last_name"><h4>Tên Trường</h4></label> <input
								type="text" class="form-control" name="txttentruong"
								id="tentruong" onkeypress="nhanphim()" <%if (bean != null) {%>
								value="<%=bean.getTentruong()%>" <%}%> id="last_name"
								placeholder="Tên Trường" title="enter your last name if any.">
						</div>
					</div>
					
					<div class="form-group">

						<div class="col-xs-6">
							<label for="last_name"><h4>Địa Chỉ</h4></label> <input
								type="text" class="form-control" name="txtdiachi" id="diachi"
								onkeypress="nhanphim()" <%if (bean != null) {%>
								value="<%=bean.getDiachi()%>" <%}%> id="last_name"
								placeholder="Địa Chỉ" title="enter your last name if any.">
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-6">
							<label for="mobile"><h4>Loại Trường</h4></label> <select
								class="form-control" id="sel1" name="txtloaitruong">
								<option>Đại Học</option>
								<option>Cao Đẳng</option>


							</select>

						</div>
					</div>
					
					<div class="form-group">

						<div class="col-xs-6">
							<label for="phone"><h4>Email</h4></label> <input type="text"
								class="form-control" name="txtemail" id="email"
								onkeypress="nhanphim()" <%if (bean != null) {%>
								value="<%=bean.getEmail()%>" <%}%> id="last_name"
								placeholder="@gmail.com" title="enter your phone number if any.">
						</div>
					</div>
					
					<div class="form-group">

						<div class="col-xs-6">
							<label for="password2"><h4>Loại Hình</h4></label> <select
								class="form-control" id="sel1" name="txtloaihinh">
								<option>Công Lập</option>
								<option>Dân Lập</option>

							</select>
						</div>
					</div>
					
					<div class="form-group">

						<div class="col-xs-6">
							<label for="password2"><h4>Số Điện Thoại</h4></label> <input
								type="number" name="txtsdt" id="sdt" onkeypress="nhanphim()"
								<%if (bean != null) {%> value="<%=bean.getSdt()%>" <%}%>
								class="form-control">
						</div>
					</div>
					
					<div class="form-group">

						<div class="col-xs-6">
							<label for="password2"><h4>Tỉnh Thành Trực thuộc</h4></label> <select
								class="form-control" id="sel1" name="txttinhthanhtructhuoc">
								<option>Thừa Thiên Huế</option>
								<option>Hồ Chí Minh</option>

							</select>
						</div>
					</div>
					
					<div class="form-group">

						<div class="col-xs-6">
							<label for="email"><h4>Website</h4></label> <input type="text"
								name="txtwebsite" <%if (bean != null) {%>
								value="<%=bean.getWebsite()%>" <%}%> class="form-control"
								id="location" placeholder="" title="enter a location"> <label
								for="email"><h4>Số Fax</h4></label> <input type="number"
								name="txtsofax" <%if (bean != null) {%>
								value="<%=bean.getSofax()%>" <%}%> class="form-control"
								id="location" placeholder="" title="enter a location">
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-9">
							<br>
							<button class="btn btn-lg"
								style="float: right; margin-right: -72px;">
								<i class="glyphicon glyphicon-repeat"></i> Exit
							</button>
							<button class="btn btn-lg btn-success" type="submit" name="sua"
								id="sua"
								style="float: right; margin-right: 47px; margin-bottom: 61px;">
								<i class="glyphicon glyphicon-ok-sign"></i> Save
							</button>

						</div>
					</div>

				</form>

				<hr>

			</div>
			<!--/tab-pane-->

			<!--/tab-pane-->
		</div>
		<!--/tab-content-->
	</div>
	<script type="text/javascript">
        function nhanphim() {
            $("#matruong").css('box-shadow', '0px 0px 0px red');
            $("#tentruong").css('box-shadow', '0px 0px 0px red');
            $("#diachi").css('box-shadow', '0px 0px 0px red');
            $("#email").css('box-shadow', '0px 0px 0px red');
            $("#sdt").css('box-shadow', '0px 0px 0px red');

        }
        var buttonpressed;
        $('#sua').click(function () {
            buttonpressed = $(this).attr('name');
        });

        $(document).ready(function () {
            $("#registrationForm").submit(function (e) {
                if (buttonpressed == "sua")
                //e.preventDefault();
                {
                    if ($("#matruong").val() == "") {
                        $("#matruong").css('box-shadow', '0px 0px 7px red');

                        alert('Bạn chưa nhập thông tin ô Mã trường.');
                        e.preventDefault();
                    } else if ($("#tentruong").val() == "") {
                        $("#tentruong").css('box-shadow', '0px 0px 7px red');

                        alert('Bạn chưa nhập thông tin ô Tên trường.');
                        e.preventDefault();
                    } else if ($("#diachi").val() == "") {
                        $("#diachi").css('box-shadow', '0px 0px 7px red');

                        alert('Bạn chưa nhập thông tin ô Địa chỉ.');
                        e.preventDefault();
                    } else if ($("#email").val() == "") {
                        $("#email").css('box-shadow', '0px 0px 7px red');

                        alert('Bạn chưa nhập thông tin ô Email.');
                        e.preventDefault();
                    } else if ($("#sdt").val() == "") {
                        $("#sdt").css('box-shadow', '0px 0px 7px red');

                        alert('Bạn chưa nhập thông tin ô Số điện thoại.');
                        e.preventDefault();
                    }

                }
            });
        });
    </script>
</body>
</html>