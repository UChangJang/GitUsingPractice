<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.board.dao.*"%>
<%
     BoardDAO dao=new BoardDAO();
     String strPage=request.getParameter("page");
     if(strPage==null)
    	 strPage="1"; // list.jsp 
     int curpage=Integer.parseInt(strPage);
     List<BoardDTO> list=dao.boardListData(curpage);
     int totalpage=dao.boardTotal();
     int count=dao.boardCount();
     count=count-((curpage*10)-10);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board.css">
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.js"></script>
<script type="text/javascript">
$(function(){
	$('td').click(function(){
		alert($(this).text());
	});
});
</script> -->
</head>
<body>
  <center>
    <img src="image/qna.jpg" width=700 height=80>
    <p>
    <table border=0 width=700>
      <tr>
       <td align=left>
         <a href="insert.jsp">
         <img src="image/btn_write.gif" border=0></a>
       </td>
      </tr>
    </table>
    <table border=0 width=700>
     <tr bgcolor="#ccccff">
       <th width=10%>번호</th>
       <th width=45%>제목</th>
       <th width=15%>이름</th>
       <th width=20%>작성일</th>
       <th width=10%>조회수</th>
     </tr>
     <!-- 데이터 출력 -->
     <%
         int j=0;
         String color="white";
         for(BoardDTO d:list)
         {
        	 if(j%2==0)
        		 color="white";
        	 else
        		 color="rgb(236,206,255)";
     %>
            <tr bgcolor=<%=color %>>
		       <td width=10% align=center><%=count-- %></td>
		       <td width=45% align=left>
		       <%
		          if(d.getGroup_tab()>0)
		          {
		        	  for(int i=0;i<d.getGroup_tab();i++)
		        	  {
		        		  out.println("&nbsp;&nbsp;");
		        	  }
		       %>
		             <img src="image/icon_reply.gif">   
		       <%
		          }
		       %>
		       <%
		          String msg="관리자가 삭제한 게시물입니다";
		          if(msg.equals(d.getSubject()))
		          {
		       %>
		            <font color=gray><%=d.getSubject() %></font>
		       <%
		          }
		          else
		          {
		       %>
		       <a href="content.jsp?no=<%=d.getNo()%>&page=<%=curpage%>">
		       <%=d.getSubject() %></a>
		       <%
		          }
		       %>
		       <%
		           String today=new SimpleDateFormat("yyyy-MM-dd")
		                       .format(new Date());
		           String dbday=d.getRegdate().toString();
		           if(today.equals(dbday))
		           {
		       %>
		              <sup><img src="image/icon_new (2).gif"></sup>
		       <%
		           }
		       %>
		       </td>
		       <td width=15% align=center><%=d.getName() %></td>
		       <td width=20% align=center><%=d.getRegdate().toString() %></td>
		       <td width=10% align=center><%=d.getHit() %></td>
		    </tr>
     <%
            j++;
         }
     %>
    </table>
    <hr width=700>
    <table border=0 width=700>
      <tr>
        <td align="left">
         <select name=fs>
           <option value="name">이름</option>
           <option value="subject">제목</option>
           <option value="content">내용</option>
         </select>
         <input type=text name=ss size=12>
         <input type="image" src="image/btn_search.gif">
        </td>
        <td align="right">
          <a href="list.jsp">
          <img src="image/begin.gif" border=0></a>
          <a href="list.jsp?page=<%= curpage>1?curpage-1:curpage%>">
          <img src="image/prev.gif" border=0></a>
          [1][2][3][4][5]
          <a href="list.jsp?page=<%= curpage<totalpage?curpage+1:curpage%>">
          <img src="image/next.gif" border=0></a>
          <a href="list.jsp?page=<%=totalpage%>">
          <img src="image/end.gif" border=0></a>
          &nbsp;&nbsp;<%=curpage %> page / <%=totalpage %> pages
        </td>
      </tr>
    </table>
  </center>
</body>
</html>






