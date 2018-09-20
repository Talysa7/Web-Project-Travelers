<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${page_input}</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Custom style for this template -->
<link rel="stylesheet" href="${project}style_loginForm.css">
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script src="//code.jquery.com/jquery.js"></script>
</head>


 
<body>
	
	<div class="container" style="width:600px">
		<div class="text-center">
			<a href="${project}list.go">
				<img class="mb-4" src="img/logo_c.png" alt="" width="100" height="100">
			</a>
			<h1>${page_input}</h1>
			<br>
		</div>
		
		 <form class="form-horizontal" action="/action_page.php" method="post" action="loginPro.go" name="loginform" onsubmit="">
			<div class="form-group row">
				<label for="inputID" class="col-sm-2 col-form-label">${str_id}</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="inputID" 
						placeholder="ID" maxlength="20" required autofocus>					
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-md btn-secondary" onclick="confirmid()">${btn_confirm}</button>			
				</div>
			</div>

			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">${str_passwd}</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="inputPassword"
						placeholder="비밀번호" maxlength="30" required>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="inputRepassword"
						placeholder="비밀번호 재입력" maxlength="30" required>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputNickname" class="col-sm-2 col-form-label">${str_nickname}</label>
				<div class="col-sm-8">
					<input type="text" name="n_name" class="form-control" id="inputNickname" 
						placeholder="Nickname" required>					
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-md btn-secondary" onclick="">${btn_confirm}</button>			
				</div>
			</div>

			<fieldset class="form-group">
				<div class="row">
					<legend class="col-form-label col-sm-2 pt-0">${str_gender}</legend>
					<div class="col-sm-10">
						<div class="form-check">
						
							<input class="form-check-input" type="radio" name="gridRadios"
								id="gridRadios1" value="female" checked> 
							<label class="form-check-label" for="gridRadios1"> ${str_gender_f} </label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio" name="gridRadios"
								id="gridRadios2" value="male"> 
							<label class="form-check-label" for="gridRadios2"> ${str_gender_m} </label>						
						</div>
					</div>
				</div>
			</fieldset>

			<div class="form-group">
			 	<div class="row">
		    		 <label for="email" class="control-label col-sm-2" >${str_email} </label>
		     	 		<div class="col-sm-8">
		      	  		<input type="email" name="email" class="form-control" id="email" placeholder="Enter email" required>
		      	    	</div>
		      	    	<div class="col-sm-2">
							<button type="button" class="btn btn-md btn-secondary" onclick="">${btn_confirm_smtp}</button>			
					</div>
		      	</div>
		    </div>
		    
			<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-10">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="gridCheck1">
						<label class="form-check-label" for="gridCheck1"> Agree to
							<a href="#">Terms and Conditions</a></label>
					</div>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<button type="submit" class="btn btn-lg btn-secondary btn-block">${btn_join}</button>
				</div>
			</div>
			
		</form>
	</div>
	<!-- container -->

</body>
</html>