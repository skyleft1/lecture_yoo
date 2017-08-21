<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="bbs.DaoBbs" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/bbs.css">

<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/common.js"></script>

<title>jsp 게시판 웹 사이트 + 게시판</title>


</head>
<body>

<% int pageNumber = 1;
if(request.getParameter("pageNumber") != null){
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
%>

<div id = "header"></div>

	<div class="content">
		<div class="row">
		<h1>게시판</h1>
			<table class="bbs_table">
				<colgroup>
				<tr>
					<th style="width: 10%;">번호</th>
					<th style="width: 50%;">제목</th>
					<th style="width: 15%;">작성자</th>
					<th style="width: 25%;">작성일</th>
				</tr>
				</colgroup>


				<tbody>
            	<%
            		DaoBbs daobbs = new DaoBbs();
            		ArrayList<Bbs> list = daobbs.getList(pageNumber);
            		for (int i = 0; i < list.size(); i++) {
            	%>
				<tr>
                    <td><%=list.get(i).getBbsID()%></td> 
                    <td><a
							href="BBS_view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
                    <td><%=list.get(i).getUserID()%></td>
                    <td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
						+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
                </tr>
            	<%
            		}
            	%>
            </tbody>
        </table>
        <div class="content_bottom1">
	        <%
	        	if (pageNumber != 1) {
	        %>	
				 
                <a href="BBS.jsp?pageNumber=<%=pageNumber - 1%>" class="a1"><input type="button" class="" value="이전" /></a>
	        <%
	        	}
	        	if (daobbs.nextPage(pageNumber + 1)) {
	        %>
	        	<a href="BBS.jsp?pageNumber=<%=pageNumber + 1%>" class="a2"><input type="button" class="" value="다음" /></a>
	        <%
	        	}
	        %>	

            <input type="button" class="content_bottom2" value="글쓰기"
				    onclick="location.href ='write.jsp'" />
        </div>
    </div>
</div>

<div id = "footer"></div>


</body>
</html>