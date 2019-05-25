package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import oms.model.*;
import oms.model.DAO.*;
import oms.model.controller.*;
import java.sql.Connection;
import java.util.*;
import java.sql.*;

public final class accessManagament_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/header.jsp");
  }

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
      out.write("         \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"header.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"dropdown.css\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>HeaderMain Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <div class=\"header\">\n");
      out.write("            <h2>Online Movie Store</h2>\n");
      out.write("\t</div>\n");
      out.write("        <div class=\"navbar\">\t\n");
      out.write("            <a style=\"margin-right: 20px\" href=\"#\"><i class=\"fa fa-shopping-cart\"></i> Cart</a>\n");
      out.write("                    \n");
      out.write("                <div class=\"dropdown\">\n");
      out.write("                    <button class=\"dropbtn\">Register&nbsp<i class=\"fa fa-caret-down\"></i></button>\n");
      out.write("                        <div class=\"dropdown-content\">\n");
      out.write("                            <a href=\"register.jsp\">Customer</a>\n");
      out.write("                            <a href=\"register_staff.jsp\">MS Staff</a>\n");
      out.write("                        </div>\n");
      out.write("                </div>\n");
      out.write("                    \n");
      out.write("            <a href=\"login.jsp\"><i class=\"fa fa-user\"></i> Log In</a>\t\t\t\t\n");
      out.write("                    \t\n");
      out.write("                <div class=\"search\">\n");
      out.write("                    <form action=\"/action_page.php\">\n");
      out.write("                        <input type=\"text\" placeholder=\"Search..\" name=\"search\">\n");
      out.write("                            <button type=\"submit\"><i class=\"fa fa-search\"></i></button>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            <a style=\"float: left; margin-left: 20px\" href=\"Main.jsp\"><i class=\"fa fa-home\"></i> Home</a>\n");
      out.write("\t</div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        <title>Management Page</title>\n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("        pa\n");
      out.write("        {\n");
      out.write("             float: right;  \n");
      out.write("        }\n");
      out.write("        table#t01\n");
      out.write("        {\n");
      out.write("            padding: 5px 20px 15px;\n");
      out.write("           width:87%; \n");
      out.write("           border: 2px solid black;\n");
      out.write("            border-radius: 5px;\n");
      out.write("           border-collapse: collapse; \n");
      out.write("        }\n");
      out.write("        table#t01 tr \n");
      out.write("        {\n");
      out.write("            background-color: #eee;\n");
      out.write("        }\n");
      out.write("        th\n");
      out.write("        {\n");
      out.write("             background-color: black;\n");
      out.write("             color: white;\n");
      out.write("        }\n");
      out.write("        th,td\n");
      out.write("        {\n");
      out.write("            text-align: center;\n");
      out.write("            padding: 15px;\n");
      out.write("        }\n");
      out.write("         td \n");
      out.write("        {\n");
      out.write("            border: 1px solid black;\n");
      out.write("            border-collapse: collapse;\n");
      out.write("        }\n");
      out.write("        .border input[type=button]\n");
      out.write("        {\n");
      out.write("                width: 100%;\n");
      out.write("                background-color: #585858;\n");
      out.write("                padding: 5px;\n");
      out.write("                color: white;\n");
      out.write("                cursor: pointer;\n");
      out.write("                padding: 10px 20px;\n");
      out.write("                border: 0;\n");
      out.write("        }\n");
      out.write("        .border input[type=button]:hover\n");
      out.write("        {\n");
      out.write("                opacity: 0.6;\n");
      out.write("        }\n");
      out.write("  </style>\n");
      out.write("   \n");
      out.write("    <body>\n");
      out.write("         <div class=\"border\">\n");
      out.write("        <h2>Access Management </h2>\n");
      out.write("        <hr>\n");
      out.write("        <table  id =\"t01\">\n");
      out.write("         <tr>\n");
      out.write("             <th width=\"30%\" >ID</th> \n");
      out.write("             <th width=\"30%\">Time Login</th>\n");
      out.write("             <th width=\"30%\">Time logout</th>     \n");
      out.write("             <th width=\"10%\">remove record</th>\n");
      out.write("         </tr>\n");
      out.write("        </table >\n");
      out.write("    ");

           DBManager manager = (DBManager)session.getAttribute("manager");
           ArrayList<oms.model.Time> SearchRecord= new ArrayList<oms.model.Time>();
        for(oms.model.Time t: SearchRecord)
    {
      out.write("\n");
      out.write("    <>\n");
      out.write("        <table  id =\"t01\" >\n");
      out.write("         <tr>\n");
      out.write("            \n");
      out.write("             <td width=\"30%\">");
      out.print(t.getCustomerID());
      out.write("</td> \n");
      out.write("             <td width=\"30%\">");
      out.print(t.getLoginT());
      out.write("</td>\n");
      out.write("             <td width=\"30%\">");
      out.print(t.getLogoutT());
      out.write("</td>     \n");
      out.write("             <td width=\"10%\"><input type=\"button\" value=\"Delete\"></td>\n");
      out.write("         </tr>\n");
      out.write("        </table >\n");
      out.write("        ");
}
      out.write("\n");
      out.write("     <p><input type=\"button\" value=\"Delete All\"></p></div>\n");
      out.write("   \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    </body>\n");
      out.write("</html>");
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
