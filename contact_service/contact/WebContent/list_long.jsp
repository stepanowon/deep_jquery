<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ruby.contact.domain.*" %>
<%@ page import="com.ruby.contact.util.*" %>
<%
	Thread.sleep(2000);
	String strPageno = request.getParameter("pageno");
	String strPagesize = request.getParameter("pagesize");
	
	//페이지 번호, 한 페이지 크기의 기본값을 0, 3으로 지정
	//0이면 모든 데이터 조회 1이상이면 특정 페이지 조회
	int pageno = 0;		
	int pagesize = 3; 		
	
	try { pageno = Integer.parseInt(strPageno);  } catch(Exception e) { }
	try { pagesize = Integer.parseInt(strPagesize);  } catch(Exception e) { }
	
	ContactList contactList = null;
	if (pageno==0) {
		contactList = SampleDAO.getContacts();
	} else {
		contactList = SampleDAO.getContacts(pageno, pagesize);
	}
	
	String json = Converter.convertToJson(contactList);
%><%=json %>
