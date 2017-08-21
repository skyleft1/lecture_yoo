<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.DaoUser" %>
<%@ page import = "java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/login.css">
<title></title>

</head>

<body>
    <%
    String userID = null;
    if(session.getAttribute("userID") != null){
        userID = (String) session.getAttribute("userID");
    }
    if(userID != null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 로그인되어 있습니다..')");
        script.println("location.href = 'index.jsp'");
        script.println("</script>");
    }
    
    DaoUser daouser = new DaoUser();
    int result = daouser.login(user.getUserID(), user.getUserPassword());
    if(result == 1){
        session.setAttribute("userID", user.getUserID());
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'index.jsp'");
        script.println("</script>");
    }
    else if(result == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호를 틀렸습니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else if(result == -1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('존재하지 않는 아이디 입니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else if(result == -2){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('데이터베이스 오류입니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    
    %>


</body>
</html>