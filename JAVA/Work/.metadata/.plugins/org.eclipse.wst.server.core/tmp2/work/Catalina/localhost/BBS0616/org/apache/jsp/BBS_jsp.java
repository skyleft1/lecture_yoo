/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.15
 * Generated at: 2017-06-21 08:51:09 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import bbs.DaoBbs;
import bbs.Bbs;
import java.util.ArrayList;

public final class BBS_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("bbs.Bbs");
    _jspx_imports_classes.add("bbs.DaoBbs");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/common.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/index.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/bbs.css\">\r\n");
      out.write("\r\n");
      out.write("<script src=\"js/jquery-3.1.0.min.js\"></script>\r\n");
      out.write("<script src=\"js/common.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<title>jsp 게시판 웹 사이트 + 게시판</title>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
 int pageNumber = 1;
if(request.getParameter("pageNumber") != null){
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}

      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id = \"header\"></div>\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"content\">\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t<h1>게시판</h1>\r\n");
      out.write("\t\t\t<table class=\"bbs_table\">\r\n");
      out.write("\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th style=\"width: 10%;\">번호</th>\r\n");
      out.write("\t\t\t\t\t<th style=\"width: 50%;\">제목</th>\r\n");
      out.write("\t\t\t\t\t<th style=\"width: 15%;\">작성자</th>\r\n");
      out.write("\t\t\t\t\t<th style=\"width: 25%;\">작성일</th>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</colgroup>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<tbody>\r\n");
      out.write("            \t");

            		DaoBbs daobbs = new DaoBbs();
            		ArrayList<Bbs> list = daobbs.getList(pageNumber);
            		for (int i = 0; i < list.size(); i++) {
            	
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("                    <td>");
      out.print(list.get(i).getBbsID());
      out.write("</td> \r\n");
      out.write("                    <td><a\r\n");
      out.write("\t\t\t\t\t\t\thref=\"BBS_view.jsp?bbsID=");
      out.print(list.get(i).getBbsID());
      out.write('"');
      out.write('>');
      out.print(list.get(i).getBbsTitle());
      out.write("</a></td>\r\n");
      out.write("                    <td>");
      out.print(list.get(i).getUserID());
      out.write("</td>\r\n");
      out.write("                    <td>");
      out.print(list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
						+ list.get(i).getBbsDate().substring(14, 16) + "분");
      out.write("</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            \t");

            		}
            	
      out.write("\r\n");
      out.write("            </tbody>\r\n");
      out.write("        </table>\r\n");
      out.write("        <div class=\"content_bottom1\">\r\n");
      out.write("\t        ");

	        	if (pageNumber != 1) {
	        
      out.write("\t\r\n");
      out.write("\t\t\t\t \r\n");
      out.write("                <a href=\"BBS.jsp?pageNumber=");
      out.print(pageNumber - 1);
      out.write("\" class=\"a1\"><input type=\"button\" class=\"\" value=\"이전\" /></a>\r\n");
      out.write("\t        ");

	        	}
	        	if (daobbs.nextPage(pageNumber + 1)) {
	        
      out.write("\r\n");
      out.write("\t        \t<a href=\"BBS.jsp?pageNumber=");
      out.print(pageNumber + 1);
      out.write("\" class=\"a2\"><input type=\"button\" class=\"\" value=\"다음\" /></a>\r\n");
      out.write("\t        ");

	        	}
	        
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("            <input type=\"button\" class=\"content_bottom2\" value=\"글쓰기\"\r\n");
      out.write("\t\t\t\t    onclick=\"location.href ='write.jsp'\" />\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div id = \"footer\"></div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}