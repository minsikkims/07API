<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- JQ  -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

</head>
<body>

	<div style="width:95%;height:700px; overflow:auto;" class="confirm">
	
	</div>

	<script>
		const cpath = '${pageContext.request.contextPath}';
		$.ajax({
			type : "GET",
			url : cpath +"/meme.do",
			dataType : 'json',
			contextType : 'application/json',
			success : function(result){
				//console.log(result);
				//console.log(result.status);
				//console.log(result.total);
				//console.log(result.data);
				let tmp;
				let divtg=document.querySelector('.confirm');
				$.each(result.data,function(idx,item){
				//	console.log(item.BZ_NM+" "+item.MBZ_HR);
				//	console.log(item.MNU);
				//	console.log(item.TLNO);
					tmp="<div>";
					tmp+="<span>"+item.BZ_NM+"</span> <span>"+item.MBZ_HR+"</span><br>";
					tmp+="<span>"+item.MNU+"</span><br>";
					tmp+="<span>"+item.TLNO+"</span>";		
					tmp+="<div>";
					tmp+="<hr>";
					divtg.innerHTML+=tmp;
				})
				
			},
			error : function(request,status,error){
				alert(error);
			}
		})
	</script>

</body>
</html>