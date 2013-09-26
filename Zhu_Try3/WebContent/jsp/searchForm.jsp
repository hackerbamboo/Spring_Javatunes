<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.*" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



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
<link rel="stylesheet" href="css/alertify.core.css" />
<link rel="stylesheet" href="css/alertify.default.css" />

<script>
var localData = ["Diva", "Annie Lennox","Dream of the Blue Turtles",
                 "Sting","Trouble is...","Kenny Wayne Shepherd Band","Lie to Me","Jonny Lang",
                 "Little Earthquakes","Tori Amos","Seal","Ian Moore","Ian Moore",
                 "So Much for the Afterglow","Everclear","Surfacing","Sarah McLachlan",
                 "Hysteria","Def Leppard","A Life of Saturdays","Dexter Freebish",
                 "Human Clay","Creed","My, I'm Large","Bobs","So","Peter Gabriel",
                 "Big Ones","Aerosmith","90125","Yes","1984","Van Halen",
                 "Escape","Journey","Greatest Hits","Jay and the Americans",
                 "Ray of Light","Madonna","Stanlick Unplugged","Stanlick"];
                 
$(function(){
	
	$("#autocomplete").autocomplete({
		 source: localData,
		 autoFocuus: true,
	});
});

</script>
</HEAD>
<BODY>
<%ResourceBundle messages = (ResourceBundle)session.getAttribute("lang"); %>

	<div id="header">
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

	</div>
	 
<f:form action="search.do" modelAttribute="uiModel" method="post">

	<table width='500'>
		<tbody>
			<tr>
				<td align='right' valign='bottom' width='514'><font
					color='#FFFFFF'><b><%=messages.getString("searchdatabase")%> </b></font>
				 <f:select path="catalog">
						<f:option value="title"><%=messages.getString("title")%></f:option>
						<f:option value="artist"><%=messages.getString("artist")%></f:option>
				</f:select>
				</td>
				<td><f:input size='20' type='text' path='keyword' id="autocomplete"/></td>
				<td><input class="nbutton" type='submit' name='Submit' value='<%=messages.getString("search")%>' /></td>
			</tr>

		</tbody>
	</table>
</f:form>
	 
	  
</BODY>
</HTML>
