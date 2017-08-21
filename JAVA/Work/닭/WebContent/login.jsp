<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/login.css">
<title>jsp 게시판 웹 사이트</title>
</head>
<body>

<script src='http://code.jquery.com/jquery-3.1.1.min.js'></script>
<div class="outline">
    <div class="header">Login
        <form method ='post' action = 'loginAction.jsp'>
            <div class="username">username
                <input type="text" class="" placeholder="Username"/>
            </div>
            <div class="password">password
                <input type="password" class="" placeholder="Password"/>
            </div>
            <div class="login_confirm">
                <input type="submit" class="" value="Login"/>
            </div>
            <div class="signUp+password_find">
                <div class="signUp">
                    <input type="button" class="" value="회원가입"/>
                </div>
                <div class="password_find">
                    <a href="#" src="">비밀번호 찾기</a>
                </div>
            </div>
        </form>
    </div>

</div>



</body>
</html>