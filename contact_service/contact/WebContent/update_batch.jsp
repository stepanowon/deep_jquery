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
		ContactList contactList = Converter.convertFromJSONStream(
			request.getInputStream(), ContactList.class);
		if (contactList == null) {
			status = "fail";
			message = "요청 정보 json 데이터를 객체로 변환에 실패했습니다";
		} else {
			int count = SampleDAO.updateBatch(contactList);
			if (count > 0) {
				message = "총 " + count + "건의 업데이트가 성공했습니다";
			} else {
				status = "fail";
				message = "업데이트할 데이터가 존재하지 않습니다";				
			}
		}
	} else {
		status = "fail";
		message = "PUT 메서드만 지원합니다.";
	}
%>
{
   "status" : "<%=status %>",
   "message" : "<%=message %>"
}
