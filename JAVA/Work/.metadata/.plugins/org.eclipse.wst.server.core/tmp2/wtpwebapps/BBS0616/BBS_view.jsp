<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.DaoBbs" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/bbs_view.css">
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/common.js"></script>

<title>jsp 게시판 웹 사이트 + 게시판</title>
</head>
<body>

<div id = "header"></div>

<%

    int bbsID = 0;
    if(request.getParameter("bbsID") != null){
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    
    if(bbsID == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않는 게시글 입니다.')");
        script.println("location.href = 'BBS.jsp'");
        script.println("</script>");
    }
    
    Bbs bbs = new DaoBbs().getBbs(bbsID);

%>

	<div class="content">
		<div class="container">
			<div class="bbs_div"></div>
			<div class="cover_bbsid_title_modify_delete">
				<div class="bbs_view_bbsid">
					<%=bbs.getBbsID()%>
				</div>

				<div class="bbs_view_title">
					<h3><%=bbs.getBbsTitle()%></h3>
				</div>
				<div class="bbs_view_modify">
					<input type="button" value="수정" name="">
				</div>
				<div class="bbs_view_delete">
					<input type="button" value="삭제" name="">
				</div>
			</div>

			<div class="bbs_div"></div>
			<div class="cover_userid_date">
				<div class="bbs_view_userid">
					[작성자]
					<%=bbs.getUserID()%>
				</div>

				<div class="bbs_view_date">
					[작성일자]
					<%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"
					+ bbs.getBbsDate().substring(14, 16) + "분"%>
				</div>
			</div>
			<div class="bbs_div"></div>
			
			<div class="cover_content">
				<div class="bbs_view_content">
					<%=bbs.getBbsContent()%>
				</div>
			</div>
			<div class="bbs_div"></div>


			<div></div>
		</div>
	</div>

	<div id = "footer"></div>

</body>
</html>