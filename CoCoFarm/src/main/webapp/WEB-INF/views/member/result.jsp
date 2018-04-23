<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<td>${data.idx }</td>
	<td>${data.name }</td>
	<td>${data.email }</td>
	<td>${data.phone }</td>
	<td>
		<fmt:formatDate value="${data.joinDate }"
			 pattern="yyyy-MM-dd" />
	</td>
	<td>
		<button class="updateBtn" id="${data.idx }">수정</button>
		<button onclick="deleteAct(${data.idx });">삭제</button>
	</td>
