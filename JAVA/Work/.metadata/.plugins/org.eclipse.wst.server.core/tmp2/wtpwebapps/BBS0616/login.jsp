<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/login.css">
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/common.js"></script>

<title>jsp 게시판 웹 사이트 + 로그인</title>
</head>
<body>

    <div id="header"></div>
    <div class="content">
        <div class="content_inner">
            <h1>로그인</h1>
            <div class='content_img w350h400'>
                <img src="img/번개01.gif" alt="login" />
            </div>
            <div class='content_login w350h400'>
                <form method='post' action='loginAction.jsp'>
                    <div class="input_userid">
                        <div>아이디</div>
                        <input type="text" class="" placeholder="아이디"
                            name="userID" />
                    </div>
                    <div class="input_password">
                        <div>비밀번호</div>
                        <input type="password" class=""
                            placeholder="비밀번호" name="userPassword" />
                    </div>


                    <div class="login_confirm">
                        <input type="submit" class="" value="로그인" />
                    </div>
                    <div class="signUp_password_find">
                        <div class="signUp">
                            <a href="join.jsp" src=""> 
                            <input type="button" class="" value="회원가입" />
                            </a>
                        </div>
                        <div class="password_find">
                            <a href="http://www.naver.com" src=""> <input
                                type="button" class="" value="비밀번호 찾기" />
                            </a>
                        </div>
                    </div>
                </form>
            </div>



        </div>
    </div>
    <div id = "footer"></div>


</body>
</html>