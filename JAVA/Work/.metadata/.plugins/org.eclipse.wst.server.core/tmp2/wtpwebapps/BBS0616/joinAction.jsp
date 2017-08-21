<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.DaoUser" %>
<%@ page import = "java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


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
    
    if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null 
    || user.getUserGender() == null || user.getUserEmail() == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else {
        DaoUser daouser = new DaoUser();
        int result = daouser.join(user);
        if(result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 존재하는 아이디 입니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
		else {
            session.setAttribute("userID", user.getUserID());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'index.jsp'");
            script.println("</script>");
		}
    }
 
    %>


</body>
</html>