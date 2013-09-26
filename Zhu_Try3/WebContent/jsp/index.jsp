<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>



<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<TITLE>JavaTunes</TITLE>
<link type="text/css" rel="stylesheet" href="css/web.css" />
<link rel="stylesheet" type="text/css"
	href="jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.css" />
<script type="text/javascript"
	src="jquery-ui-1.10.3.custom/js/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.js"></script>
<script src="js/alertify.min.js"></script>
<script src="js/jquery.flexslider.js"></script>

<link rel="stylesheet" href="css/flexslider.css"/>
<link rel="stylesheet" href="css/alertify.core.css" />
<link rel="stylesheet" href="css/alertify.default.css" />

<script type="text/javascript">
$(window).load(function() {
    $('.flexslider').flexslider({
    	 animation: "slide",
    	 slideshowSpeed: 3000,

    });
  });
</script>

<style type="text/css">
table{
	color:white;
}
.flexslider{
	width:400px;
	float:left;
}
#main{
	float:left;
	width:200px;
}
</style>

</HEAD>
<BODY>
	<%ResourceBundle messages = (ResourceBundle)session.getAttribute("lang"); %>

	<div class="header">
		<a href="${pageContext.request.contextPath}/index.do"><img src="images/javatunesTitle.png" width="300px" height="100px"></a>
		<br>
		<a href="${pageContext.request.contextPath}/search.do"><input
			type="button" class="Button" value="<%=messages.getString("search")%>" /></a> <a
			href="${pageContext.request.contextPath}/viewcart.do"><input
			type="button" class="Button" value="<%=messages.getString("viewcart")%>" /></a> <a
			href="${pageContext.request.contextPath}/purchasehistory.do"><input
			type="button" class="Button" value="<%=messages.getString("purchasehistory")%>" /></a> <a
			href="${pageContext.request.contextPath}/logout.do"><input
			type="button" class="Button" value="<%=messages.getString("logout")%>" /></a>
	<br><br>
	</div>



	<div id="main">
		<table>
			<tr>
				<td colspan="2"><b><%=messages.getString("welcome") %></b></td>
			</tr>
			<tr>
				<td><%=messages.getString("username")%></td>
				<td><c:out value="${userinfo.username}" /></td>
			</tr>
			<tr>
				<td><%=messages.getString("firstname")%></td>
				<td><c:out value="${userinfo.firstname}" /></td>
			</tr>
			<tr>
				<td><%=messages.getString("lastname")%></td>
				<td><c:out value="${userinfo.lastname}" /></td>
			</tr>
			<tr>
				<td><%=messages.getString("address")%></td>
				<td><c:out value="${userinfo.address}" /></td>
			</tr>
			<tr>
				<td><%=messages.getString("states")%></td>
				<td><c:out value="${userinfo.states}" /></td>
			</tr>
			<tr>
				<td><%=messages.getString("zipcode")%></td>
				<td><c:out value="${userinfo.zipcode}" /></td>
			</tr>

		</table>
	</div>


	<div class="flexslider">

  			<ul class="slides">
    		<li>
      			<img src="images/image1.jpg" />
    		</li>
    		<li>
      			<img src="images/image2.jpeg" />
    		</li>
    		<li>
      			<img src="images/image3.jpg" />
    		</li>
    		<li>
      			<img src="images/image4.jpg" />
    		</li>
    		<li>
      			<img src="images/image5.jpg" />
    		</li>
  			</ul>
	</div>
	

	
</BODY>
</HTML>
