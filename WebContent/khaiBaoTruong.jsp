<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Khai Báo Thông Tin Trường</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
			<div><h1 style="text-align: center;">KHAI BÁO THÔNG TIN TRƯỜNG</h1></div>
	

				<div class="tab-content">
					<div class="tab-pane active" id="home">

					
						<form class="form" action="##" method="post" id="registrationForm">
						<hr>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="first_name"><h4>Mã Trường</h4></label>
									<input type="text" class="form-control" name="txtmatruong" id="first_name" placeholder="Mã Trường" title="enter your first name if any.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="last_name"><h4>Tên Trường</h4></label>
									<input type="text" class="form-control" name="txttentruong" id="last_name" placeholder="Tên Trường" title="enter your last name if any.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="last_name"><h4>Địa Chỉ</h4></label>
									<input type="text" class="form-control" name="txtdiachi" id="last_name" placeholder="Địa Chỉ" title="enter your last name if any.">
								</div>
							</div>

							

							<div class="form-group">
								<div class="col-xs-6">
									<label for="mobile"><h4>Loại Trường</h4></label>
									<select class="form-control" id="sel1" name="txtloaitruong">
										<option>Đại Học</option>
										<option>Cao Đẳng</option>
									
										
									</select>

								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="phone"><h4>Email</h4></label>
								<input type="text" class="form-control" name="txtemail" id="last_name" placeholder="@gmail.com" title="enter your phone number if any.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="password2"><h4>Loại Hình</h4></label>
									<select class="form-control" id="sel1" name="txtloaihinh">
										<option>Công Lập</option>
										<option>Dân Lập</option>
										
									</select>
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="password2"><h4>Số Điện Thoại</h4></label>
									<input type="number" name="txtsdt" class="form-control">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="password2"><h4>Tỉnh Thành Trực thuộc</h4></label>
									<select class="form-control" id="sel1" name="txttinhthanhtructhuoc">
										<option>Thừa Thiên Huế</option>
										<option>Hồ Chí Minh</option>
										
									</select>
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="email"><h4>Website</h4></label>
									
									<input type="text" name="txtwebsite" class="form-control" id="location" placeholder="" title="enter a location">

									<label for="email"><h4>Số Fax</h4></label>
									<input type="number" name="txtsofax" class="form-control" id="location" placeholder="" title="enter a location">
								</div>
							</div>
							
							
							
							<div class="form-group" >
								<div class="col-xs-9">
									<br>
								<button class="btn btn-lg"  style="
    float:  right;  margin-right: -72px;"><i class="glyphicon glyphicon-repeat"></i> Exit</button>
									<button class="btn btn-lg btn-success" type="submit"  name="save" style="
    float:  right;    margin-right: 47px;     margin-bottom: 61px;"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
									
								</div>
							</div>

						</form>

						<hr>

					</div><!--/tab-pane-->
					
					<!--/tab-pane-->
			</div><!--/tab-content-->
			</div>
</body>
</html>