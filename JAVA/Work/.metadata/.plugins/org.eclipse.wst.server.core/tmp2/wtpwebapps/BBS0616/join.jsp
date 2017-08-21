<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/join.css">
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/common.js"></script>

<title>jsp 게시판 웹 사이트 + 회원가입</title>
</head>
<body>

    <div id="header"></div>
    <div class="content">
        <div class="content_inner">
        <h1>회원가입</h1>
            <div class="content_join w550h470">
                <form method='post' action='joinAction.jsp'>
                    <table>
                        <colgroup>
                            <col style="width: 100px;">
                            <col style="width: 500px;">
                        </colgroup>
                        <tr>
                            <td>아이디</td>
                            <td><input type="text" class=""
                                placeholder="아이디" name="userID" /></td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td><input type="password" class=""
                                placeholder="비밀번호" name="userPassword" /></td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td><input type="text" class=""
                                placeholder="" name="userName" /></td>
                        </tr>
                        <tr>
                            <td>성별</td>
                            <td><input type="radio" class=""
                                autocomplete="off" name="userGender"
                                value="여자" checked /> 여자 <input
                                type="radio" class="" autocomplete="off"
                                name="userGender" value="남자" checked />
                                남자</td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td><input type="email" class=""
                                placeholder="예) aaa@naver.com"
                                name="userEmail" /></td>
                        </tr>
                    </table>

                    <div class="join_confirm">
                        <input type="submit" class="" value="회원가입" />
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div id="footer"></div>

</body>
</html>