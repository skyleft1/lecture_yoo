<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String userID = null;
    if (session.getAttribute("userID") != null) {
    userID = (String) session.getAttribute("userID");
}
%>

  <div id= "nav_back">
  
    <div id= "nav_login">
    <div class="logo" ><a href ="index.jsp"></a> </div>
      <div id="nav">
        <ul>
          <li class="menu1">menu1</li>
          <li class="menu2">menu2</li>
          <li class="menu3">menu3</li>
          <li class="menu4">menu4</li>
          <li class="menu5"><a href='BBS.jsp'>게시판</a></li>
        </ul>
      </div>
      
      <%
      if(userID == null){
      %>

      <div id="login">
        <ul>
          <li class="sign_in"><a href="login.jsp">로그인</a></li>
          <li class="sign_up"><a href="join.jsp">회원가입</a></li>
        </ul>
      </div>
      <%
      } else {
     %>
      
      <div id="logout">
          
        <ul>
            <li>반갑습니다.</li>
            <li class="account_setting"><a href="#">회원관리</a></li>
            <li class="sign_out"><a href="logoutAction.jsp">로그아웃</a></li>
        </ul>
      </div>
      <%
      }
      %>
      
    </div>
  </div>

  
