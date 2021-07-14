<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	input{border: 1px solid red; padding: 8px;}
	table{width: 1200px; margin: 0 auto; border-collapse: collapse;}
	table, th, td { border: 1px solid gray; text-align: center;}
	p, h2{text-align: center;}
	a{text-decoration: none;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$.ajax({
		url : "list_ok.do",
		method : "post",
		dataType : "json",
		success : function(data) {
			  var tbody = "";
			  $.each(data,function(){
				 tbody +="<tr>"; 
				 tbody += "<td>"+this["idx"] +"</td>";
				 tbody += "<td>"+this["name"] +"</td>";
				 tbody += "<td><span id='onelist' idx='"+this["idx"]+"'>"+this["subject"] +"</span></td>";
				 tbody +="<td>"+this["regdate"].substring(0,10) +"</td>";
				 tbody +="</tr>";
			  });
			  $("#tbody").append(tbody);
		},
		error : function() {
			alert("읽기 실패");
		}
	})
	$("table").on("click","#onelist",function() {
		location.href="onelist.do?idx="+$(this).attr("idx");
	});
});
</script>
</head>
<body>
	<div>
		<h2>방명록</h2>
		<hr>
		<p>[ <a href="write.do">방명록 쓰기</a> ]</p>
		<form method="post">
			<table>
				<thead>
					<tr style="background-color: #99ccff">
					   <th>번호</th><th>작성자</th><th>제목</th><th>작성일</th>
					</tr>
				</thead>
				<tbody id="tbody"></tbody>
			</table>
		</form>
	</div>
</body>
</html>