<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String username= request.getParameter("username");
	String id= request.getParameter("id");
	String pw= request.getParameter("pw");
	String phone1= request.getParameter("phone1");
	String phone2= request.getParameter("phone2");
	String phone3= request.getParameter("phone3");
	String gender= request.getParameter("gender");
		
	MemberDAO dao= new MemberDAO();
	MemberDTO dto= new MemberDTO();
	
	dto.setUsername(username);
	dto.setId(id);
	dto.setPw(pw);
	dto.setPhone1(phone1);
	dto.setPhone2(phone2);
	dto.setPhone3(phone3);
	dto.setGender(gender);

	dao.addMember(dto);
	response.sendRedirect("memberList.jsp");
%>
