<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
function deleteAct(idx){
	console.log("deleteAct() called");
	console.log("idx : "+ idx);	// 삭제될 member의 idx
	
	// /member/delete.do
	// Request Parameter : idx
	
	// get방식 전달
	// 	location.href="/member/delete.do?idx="+idx;
	
	//post방식 전달
	// <form> 태그를 이용해서 전달해야함
	// 방법 1. Javascript 코드를 이용해서 <form>만들기
	// 	var form = document.createElement("form");
	// 	form.method = 'post';
	// 	form.action = '/member/delete.do';
		
	// 	var idxInput = document.createElement('input');
	// 	idxInput.type = 'hidden';
	// 	idxInput.name = 'idx';
	// 	idxInput.value = idx;
		
	// 	form.appendChild(idxInput);
	// 	document.body.appendChild(form);
		
	// 	form.submit();

	// 방법 2. jQuery 코드를 이용해서 <form> 만들기
	// form tag를 만들며 attribute 지정
	var $form = $("<form>").attr({
		action:"/member/delete.do"
		, method:"post"
	});
	
	var $input = $("<input>").attr({
		type:"hidden"
		,name:"idx"
		,value: idx
	});
	
// 	$form.append( $input);
// 	$(document.body).append($form);
	// 위와 동일한 방법으로 한줄로 쓴 형태
	$form.append( $input ).appendTo($(document.body));
	$form.submit();
	
	// 2-1. jQuery 변형
// 	var $form = null;
// 	$(document.body).append(
// 			$form = $("<form>").attr({
// 				action: "/member/delete.do"
// 				,method: "post"
// 			}).append(
// 					$("<input>").attr({
// 						type: "hidden"
// 						, name: "idx"
// 						, value: idx
// 					})
// 				));
}

//======================방법 1===========================
// 수정버튼 처리
// $(document).ready(function(){
// 	$(".updateBtn").click(function(){
// // 		console.log($(this));
// // 		console.log($("name"));
// // 		console.log($("email"));
// // 		console.log($("phone"));
// 		var id = $(this).attr("id");
// 		$.ajax({
// 			type : "post"
// 			, url: "/member/update.do"
// 			, data: {
// 				idx: $(this).attr("id")
// 				, name: $("#name").val()
// 				, email: $("#email").val()
// 				, phone: $("#phone").val()
// 			}
// 			, dataType: "html"
// 			, success: function(d){
// // 				alert("AJAX 통신 성공");
// 				//아래 코드는 controller에서 writer에 담긴 반환이 d값으로 전달되어 그것을 alert로 띄워주는거
// // 				alert(d);
// 				//아래 코드는 새로고침 해주는 형태인데 ajax 그러면 쓰려는 이유가 사라진다
// 				//페이지 이동 없이 화면을 새로 고쳐주는 형태로 짜주어야해~!
// // 				$(location).attr("href","/member/main.do");
				
// 				//페이지 이동 없이 테이블 수정
// 				$("#tr"+id).css("color","red");
				
// 				$("#tr"+id+" td").eq(1).html($("#name").val());
// 				$("#tr"+id+" td").eq(2).html($("#email").val());
// 				$("#tr"+id+" td").eq(3).html($("#phone").val());
		
// 				//tr17이라는 아이디를 가지는 자식 중 td의 첫번째 자식
// 				//td 써줄 때 띄어쓰기로 구분해줘야함
// 			}
// 			, error: function(){
// 				alert("AJAX 통신 실패(비정상적인 응답)");
				
// 			}
// 		})
// 	});
// });

//======================방법 2===========================
// $(document).ready(function() {
// 	$(".updateBtn").click(function() {
// // 		console.log( $(this) );
// // 		console.log( $("name") );
// // 		console.log( $("email") );
// // 		console.log( $("phone") );
		
// 		var id = $(this).attr("id");
		
// 		$.ajax({
// 			type: "post"
// 			, url: "/member/update.do"
// 			, data: {
// 				idx: $(this).attr("id")
// 				, name: $("#name").val()
// 				, email: $("#email").val()
// 				, phone: $("#phone").val()
// 			}
// 			, dataType: "json"
// 			, success: function( d ) {
// // 				alert("AJAX 통신 성공(정상적인 응답)");
// // 				console.log(d);
				
// 				// 페이지 이동
// // 				$(location).attr("href", "/member/main.do");
// // 				location.href="/member/main.do";
				
// 				// 페이지 이동 없이 테이블 수정
// 				$("#tr"+d.idx).css("color", "red");
				
// 				$("#tr"+d.idx+" td").eq(1).html( d.name );
// 				$("#tr"+d.idx+" td").eq(2).html( d.email );
// 				$("#tr"+d.idx+" td").eq(3).html( d.phone );
				
// 			}
// 			, error: function() {
// 				alert("AJAX 통신 실패(비정상적인 응답)");
// 			}
// 		});
		
		
// 	});
// });

//======================방법 3===========================
$(document).ready(function() {
// 	$(".updateBtn").click(function() {
	$("tr").on("click","td .updateBtn", function(){
// 		console.log( $(this) );
// 		console.log( $("name") );
// 		console.log( $("email") );
// 		console.log( $("phone") );
		
		var id = $(this).attr("id");
		
		$.ajax({
			type: "post"
			, url: "/member/update.do"
			, data: {
				idx: $(this).attr("id")
				, name: $("#name").val()
				, email: $("#email").val()
				, phone: $("#phone").val()
			}
			, dataType: "html"
			, success: function( d ) {
				alert("AJAX 통신 성공(정상적인 응답)");
				console.log(d);
				$("#tr"+id).html(d);
			}
			, error: function() {
				alert("AJAX 통신 실패(비정상적인 응답)");
			}
		});
		
		
	});
});


</script>

</head>
<body>

	<div>

		<h1>멤버 메인</h1>
		<hr>

		<form action="/member/insert.do" method="post">
			<table border="1">

				<thead>
					<tr>
						<th>이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" name="name" id="name" /></td>
						<td><input type="text" name="email" id="email" /></td>
						<td><input type="text" name="phone" id="phone" /></td>
						<td><input type="submit" value="가입" /></td>
					</tr>
				</tbody>

			</table>
		</form>
		<hr>
		<c:if test="${list.size() eq 0}">
			<h3>데이터가 없습니다</h3>
		</c:if>

		<c:if test="${list.size() ne 0 }">
			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>가입날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="data">
						<tr id="tr${data.idx }">
							<td>${data.idx }</td>
							<td>${data.name }</td>
							<td>${data.email }</td>
							<td>${data.phone }</td>
							<%-- 	<td>	${data.joinDate }	</td> --%>
							<td><fmt:formatDate value="${data.joinDate }"
									pattern="yyyy-MM-dd" /></td>
							<td>
								<button class="updateBtn" id="${data.idx}" >수정</button>
								<button onclick="deleteAct(${data.idx });">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</c:if>
	</div>

</body>
</html>








