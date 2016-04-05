<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.board.dao.*"%>
<%
     String pwd=request.getParameter("pwd");
     String no=request.getParameter("no");
     String strPage=request.getParameter("page");
     // DB연동 
     BoardDAO dao=new BoardDAO();
     boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
     if(bCheck==true)
     {
    	 response.sendRedirect("list.jsp?page="+strPage);
     }
     else
     {
%>
         <script type="text/javascript">
         alert("비밀번호가 틀립니다");
         history.back();
         </script>
<%
     }
%>





