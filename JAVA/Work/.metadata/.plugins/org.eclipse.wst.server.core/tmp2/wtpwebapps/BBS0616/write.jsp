<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/write.css">

<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/common.js"></script>

<title>jsp 게시판 웹 사이트 + 게시판</title>
</head>
<body>

    <div id="header"></div>

    <div class="content">
        <h2>글쓰기</h2>
        <div class="content_write">
            <form class="form_write" action="writeAction.jsp" method="post">
                <table>
                    <colgroup>
                        <col style="width:140px"/>
                        <col/>
                    </colgroup>
                    <tbody>
                        <tr class='input_title'>
                            <th>제목</th>
                            <td>
                                <textarea rows='1' cols='80' name="bbsTitle"></textarea>
                            </td>
                        </tr>
 
                        <tr class='input_content'>
                            <th>내용</th>
                            <td>
                                <textarea rows='5' cols='80' name="bbsContent"></textarea>
                             </td>
                        </tr>
                    </tbody>
                </table>
                <div class="bbs_submit">
                    <input type="submit" name="bbs_submit1" value="완료" />
                </div>
            </form>
        </div>
    </div>

    <div id="footer"></div>

</body>
</html>