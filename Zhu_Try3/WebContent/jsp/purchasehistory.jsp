<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<% Locale currentLocale = (Locale) session.getAttribute("locale");%>
<HTML lang=<%= currentLocale%>>
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

<script src="js/jquery.i18n.js"></script>
<script src="js/jquery.i18n.fr.json"></script>
<script src="js/jquery.i18n.en.json"></script>
<script src="js/index.en.json"></script>
<script src="js/index.fr.json"></script>

<link rel="stylesheet" href="css/alertify.core.css" />
<link rel="stylesheet" href="css/alertify.default.css" />

<style>
table{
		background-color:#F0FFFF;
		border-collapse:collapse;
	}
	table td{
		text-align:center;
		padding: 20px;
	}
	table tbody tr:hover{
		background-color:#00BFFF;
	}
</style>

<script>
	
	$(function(){
		$._.setLocale($("html").attr("lang")); 
		
		$(".nbutton").click(function(){
			 alertify.alert($._("downloading"));
			
		});
		
	});
	
	
</script>

</HEAD>
<BODY>

	 <%ResourceBundle messages = (ResourceBundle)session.getAttribute("lang"); %>

	<div id="header">
		<img src="images/javatunesTitle.png" width="300px" height="100px"><br>
		<a href="${pageContext.request.contextPath}/search.do"><input
			type="button" class="Button" value="<%=messages.getString("search")%>" /></a> <a
			href="${pageContext.request.contextPath}/viewcart.do"><input
			type="button" class="Button" value="<%=messages.getString("viewcart")%>" /></a> <a
			href="${pageContext.request.contextPath}/purchasehistory.do"><input
			type="button" class="Button" value="<%=messages.getString("purchasehistory")%>" /></a> <a
			href="${pageContext.request.contextPath}/logout.do"><input
			type="button" class="Button" value="<%=messages.getString("logout")%>" /></a>

	</div>

	<p><c:out value="${info}"></c:out></p>
	
	
	<table border="2" width='800'>
		<thead>
			<tr height='60'>
				<th width='60'><%=messages.getString("purchasedate")%></th>
				<th width='600'><%=messages.getString("title")%>/<%=messages.getString("artist")%></th>
				<th width='150'><%=messages.getString("releasedate")%></th>
				<th width='150'><%=messages.getString("unitprice")%></th>
				<th width='80'><%=messages.getString("quantity")%></th>
				<th width='80'><%=messages.getString("downloading")%></th>
			</tr>
		</thead>
		<tbody>


			<c:forEach items="${history}" var="item">

				<tr height='60'>
					<td><fmt:formatDate value="${item.orderdate}" 
						type="date" dateStyle="medium"/></td>
					<td><b><c:out value="${item.musicitem.title}" /></b><br>
					<br> <c:out value="${item.musicitem.artist}" /></td>
					<td><fmt:formatDate value="${item.musicitem.releaseDate}"
							type="date" dateStyle="medium" /></td>
					<td>$<c:out value="${item.unitprice}" /></td>
					<td><c:out value="${item.quantity}" /></td>
					<td><input type="button" class="nbutton" value="<%=messages.getString("downloading")%>"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>



</BODY>
</HTML>
