<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<script>
	$(function(){
		var info = "";
		<c:forEach var="item" items="${resultlist}">
			$.getJSON("https://maps.googleapis.com/maps/api/geocode"+
					"/json?key=key&address="+"${item.getPlace()}", function(data) {
				info="lat="+data.results[0].geometry.location.lat+"&lng="+data.results[0].geometry.location.lng
					+"&fid="+"${item.getFid()}";
				 $.ajax({
				        url : 'changelatlng',
				        type : 'get',
				        data : info,
				        success : function(data) {
				          console.log(data);
				        },
				        error : function(request,status,error){
				        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				        }
				      });
				});	
			
		</c:forEach>
		
	});
	</script>
</body>
</html>
