<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="joinfrm" onsubmit="return false">
		<input type="text" name=zipcode><button onclick="search()">우편검색</button><br> 
		<input type="text" name=addr1 /><br> 
		<input type="text" name=addr2 /><br>
	</form>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		const frm = document.joinfrm;
		function search() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
					// 예제를 참고하여 다양한 활용법을 확인해 보세요.
					console.log(data.zonecode);
					console.log(data.userSelectedType);
					console.log(data.roadAddress);
					console.log(data.jibunAddress);

					frm.zipcode.value = data.zonecode;
					if (data.userSelectedType == 'R')
						frm.addr1.value = data.roadAddress;
					else if (data.userSelectedType == 'J')
						frm.addr1.value = data.jibunAddress;

				}
			}).open();
		}
	</script>
</body>
</html>