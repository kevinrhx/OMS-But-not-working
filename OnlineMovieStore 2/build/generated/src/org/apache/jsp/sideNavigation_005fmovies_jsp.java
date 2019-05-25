package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class sideNavigation_005fmovies_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>side navigation and movies</title>\n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("        .container{\n");
      out.write("             font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n");
      out.write("             line-height: 1.7em;\n");
      out.write("        }\n");
      out.write("        .sidebar{\n");
      out.write("            display: inline;\n");
      out.write("            float: left;\n");
      out.write("            width: 15%;\n");
      out.write("        }\n");
      out.write("        .content{\n");
      out.write("            display: inline;\n");
      out.write("            width: 85%;\n");
      out.write("            padding: 0px 10px;\n");
      out.write("        }\n");
      out.write("        .box{\n");
      out.write("            display: inline-block;\n");
      out.write("            text-align: center;\n");
      out.write("            background-color: #f4f4f4;\n");
      out.write("            width: 28.3%;\n");
      out.write("            padding: 100px;\n");
      out.write("            \n");
      out.write("            margin-bottom: 15px;\n");
      out.write("        }\n");
      out.write("        .side-menu{\n");
      out.write("            list-style: none;\n");
      out.write("            background: #42413D;\n");
      out.write("            border: 1px #f4f4f4 solid;\n");
      out.write("            border-radius: 10px;\n");
      out.write("            width: auto;\n");
      out.write("            padding: 10px;\n");
      out.write("        }\n");
      out.write("        .side-menu li{\n");
      out.write("            display: block;\n");
      out.write("            font-size: 18px;\n");
      out.write("            line-height: 2.4em;\n");
      out.write("            border-bottom: dotted 1px #ddd;\n");
      out.write("            color:white;\n");
      out.write("        }\n");
      out.write("        .side-menu li:last-child{\n");
      out.write("           border-bottom: none;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .side-menu li:first-child{\n");
      out.write("            text-decoration: none;\n");
      out.write("            text-align: center;\n");
      out.write("            color: white;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("        .side-menu li a{\n");
      out.write("            text-decoration: none;\n");
      out.write("            color: white;\n");
      out.write("        }\n");
      out.write("        .side-menu li a:hover{\n");
      out.write("            background: #f7c08a;\n");
      out.write("            color: #333;\n");
      out.write("            padding: 10px 20px;\n");
      out.write("            \n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </style>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <section class=\"content\">\n");
      out.write("                <div class=\"box\">  <h5> No country for old men </h5> </div>\n");
      out.write("            </section>\n");
      out.write("            <aside class=\"sidebar\">\n");
      out.write("                <ul class=\"side-menu\">\n");
      out.write("                    <li>Movie Genres</li>\n");
      out.write("                    <li><a href=\"#\">Action</button></li>\n");
      out.write("                    <li><a href=\"#\">Children</li>\n");
      out.write("                    <li><a href=\"#\">Comedy</li>\n");
      out.write("                    <li><a href=\"#\">Documentary</li>\n");
      out.write("                    <li><a href=\"#\">Drama</li>\n");
      out.write("                    <li><a href=\"#\">Family</li>\n");
      out.write("                    <li><a href=\"#\">Science Fiction</li>\n");
      out.write("                    <li><a href=\"#\">Sport</li>\n");
      out.write("                </ul>\n");
      out.write("            </aside>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
