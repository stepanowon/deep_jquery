<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ruby.contact.domain.*" %>
<%@ page import="com.ruby.contact.util.*" %>
<%
	String strNo = request.getParameter("no");
	long no = -1L;
	try {	no = Long.parseLong(strNo); } catch (Exception e) {}
	Contact c = SampleDAO.getContactByNo(no);
	String json = "{ \"errormessage\" : \"해당 데이터가 없습니다.\"}";
	if (c != null) {
		json = Converter.convertToJson(c);
	} 
%><%=json %>