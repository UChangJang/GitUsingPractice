<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.board.dao.*"%>
<%
    // 데이터 (insert.jsp) 받기
  
    request.setCharacterEncoding("EUC-KR");
    String no=request.getParameter("no");
    String strPage=request.getParameter("page");
    String name=request.getParameter("name");
    String subject=request.getParameter("subject");
    String content=request.getParameter("content");
    String pwd=request.getParameter("pwd");
    // DAO => 전송 (오라클에 데이터 저장)
    // 모아서 전송 (DTO)
    BoardDTO d=new BoardDTO();
    d.setName(name);
    d.setSubject(subject);
    d.setContent(content);
    d.setPwd(pwd);
    BoardDAO dao=new BoardDAO();
    dao.boardReply(Integer.parseInt(no),d);
    // 이동 (list.jsp)
    response.sendRedirect("list.jsp?page="+strPage);
%>





