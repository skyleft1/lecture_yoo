<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.DaoBbs" %>
<%@ page import = "java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/writeAction.css">
<title></title>

</head>

<body>
    <%
    String userID = null;
    if(session.getAttribute("userID") != null){
        userID = (String) session.getAttribute("userID");
    }

    if(userID == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 해야 작성이 가능합니다.')");
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
    }
    else{
    	if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null ){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('제목과 내용을 모두 입력해주세요.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else {
            DaoBbs daobbs = new DaoBbs();
            int result = daobbs.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('게시글 작성에 실패했습니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
            else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'BBS.jsp'");
                script.println("</script>");
            }
        }
    }
 
    %>


</body>
</html>