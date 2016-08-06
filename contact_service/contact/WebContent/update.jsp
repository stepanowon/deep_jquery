<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ruby.contact.domain.*" %>
<%@ page import="com.ruby.contact.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String status = "ok";
	String message = "";

	if (request.getMethod().equals("POST")) {
		
		long no = 0;
		try {
			no = Long.parseLong(request.getParameter("no"));
		} catch (Exception ex) {}
		
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		Contact c = new Contact(no, name, tel, address);
	 	System.out.println(c);		
		if (name == null || name.equals("") || tel == null || tel.equals("")) {
			status = "fail";
			message = "수정하시려면 이름과 전화번호는 필수로 입력해야 합니다";
		} else {
			int count = SampleDAO.updateContact(c);
			if (count == 1) {
				status = "ok";
				message = "일련번호 " + c.getNo() + "번 데이터가 수정되었습니다";
			} else {
				status = "fail";
				message = "수정하려는 데이터가 존재하지 않습니다";
			}
		}
	} else {
		status = "fail";
		message = "POST 메서드만 지원합니다.";
	}
%>
{
   "status" : "<%=status %>",
   "message" : "<%=message %>"
}
