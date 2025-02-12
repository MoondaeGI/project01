<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<style>
table {
	width: 100%;
	max-width: 1200px;
	margin: 20px auto;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: center;
}

th {
	background-color: #f5f5f5;
}

input[type="text"], input[type="email"] {
	width: 90%;
	padding: 5px;
	border: 1px solid #ddd;
}

button {
	padding: 8px 16px;
	margin: 5px;
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script type="text/javascript">
$(function() {
    // 회원정보 수정 버튼 클릭 이벤트
    $("#update").on("click", function() {
        $("input.editable").removeAttr("readonly"); // 입력 필드 수정 가능하도록 변경
        $("#findPostcode").show();
        $("#update, #back").hide(); // 수정하기와 뒤로가기 버튼 숨김
        
        // 새로운 버튼 생성 및 추가
        let submitBtn = $("<button>")
            .attr("type", "submit")
            .text("수정 완료")
            .css("margin-right", "5px");
            
        let btnCancel = $("<button>")
            .attr("type", "button")
            .text("취소");
            
        btnCancel.on("click", function() {
            location.reload(); // 취소 시 페이지 새로고침
        });
        
        $("#btn1").empty().append(submitBtn); // 기존 버튼을 지우고 새 버튼 추가
        $("#btn2").empty().append(btnCancel);
    });
});
</script>
</head>
<body>
	<table border="1" align="center">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전화 번호</th>
			<th>이메일</th>
			<th>주소</th>
			<th>상세 주소</th>
			<th>가입날짜</th>
		</tr>
		<c:forEach var="i" items="${list }">
			<tr>
				<td>${i.id}<input type="hidden" name="id" value="${i.id}"></td>
				<td>${i.name}</td>
				<td><input type="text" name="phone" value="${i.phone}" readonly
					class="editable"></td>
				<td><input type="email" name="email" value="${i.email}"
					readonly class="editable"></td>
				<td><input type="text" name="postcode" value="${i.postcode}"
					readonly class="editable">
					<button id="findPostcode" style="display: none;"
						onclick="searchPostcode()">찾기</button></td>
				<td><input type="text" name="address1" value="${i.address1}"
					readonly class="editable"></td>
				<td><input type="text" name="address2" value="${i.address2}"
					readonly class="editable"></td>
				<td>${i.reg_date}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" align="center" id="btn1">
				<button type="button" id="update">회원정보 수정</button>
			</td>
			<td colspan="4" align="center" id="btn2">
				<button type="button" id="back" onclick="history.back()">뒤로가기</button>
			</td>
		</tr>
	</table>
</body>
</html>