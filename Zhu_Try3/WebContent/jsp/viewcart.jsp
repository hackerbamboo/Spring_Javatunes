<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.*" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
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
		padding: 5px;
	}
	table tbody tr:hover{
		background-color:#00BFFF;
	}
</style>

<script>

$(function() {
	
	  $(".spinner").spinner({
		  min: 1,
		  max: 3,
		  
	  });
	  
	  $._.setLocale($("html").attr("lang")); 
	  
	  
	  $(".updateButton").on("click", function(){
		  var id = $(this).attr("name");
		  var count = $("#spinnerDelete"+id).spinner("value");
		  console.log(id+" "+count);
		  $.ajax({
			  type : "POST",
			  url : "addToCart.do",
			  data: {
				  id: id,
				  count: count
			  },
			success : function(respText, status, jqXHR) {
				if ($.trim(respText) == "update") {
					alertify.alert($._("updated"), function(){
						$.ajax({
							type:"GET",
							url: "viewcart.do",
							success: function(){
								window.location.href="viewcart.do";
							}
								
						});
						
					});
					
				}
			}
			  
		  });
		  
	  });
	  
	  $(".deleteButton").on("click", function(){
		  var id = $(this).attr("name");
		  
				  $.ajax({
					  type: "POST",
					  url : "deleteToCart.do",
					  data:{
						  id : id
					  },
					  success: function(){
						  alertify.alert($._("deleted"), function(){
							  $("#delete"+id).parent().parent().parent().remove();
							  $.ajax({
									type:"GET",
									url: "viewcart.do",
									success: window.location.href="viewcart.do"
								});
							  
						  });
						 
					  }
				  });
		  
	  });
	  
	  $("#checkout").on("click", function(){
		  $.ajax({
			  type: "GET",
			  url: "checkout.do",
			  success: window.location.href="checkout.do"
		  });
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
	
	
	<p><c:out value="${cartinfo}"></c:out></p>
	
	<table border="2" width='800'>
	  <thead>
	    <tr height='60'>
	      <th width='60'>ID</th>
	      <th  width='600'><%=messages.getString("title")%>/<%=messages.getString("artist")%></th>
	      <th  width='150'><%=messages.getString("releasedate")%></th>
	      <th  width='150'><%=messages.getString("unitprice")%></th>
	      <th  width='80'><%=messages.getString("quantity")%></th>
	      <th  width='80'><%=messages.getString("totalprice")%></th>
	      <th  width='150'><font color='green'><%=messages.getString("editcart")%></font></th>
	    </tr>
	  </thead> 
	  <tbody>

		
       <c:forEach items="${cartresults}" var="item">
	
	    <tr height='50'>
	      <td><c:out value="${item.musicItem.id}"/></td>
	      <td><b><c:out value="${item.musicItem.title}"/></b><br><br>
		  <c:out value="${item.musicItem.artist}"/></td>
	      <td><fmt:formatDate value="${item.musicItem.releaseDate}" type="date" dateStyle="medium"/></td>
	      <td>$<c:out value="${item.musicItem.price}"/></td>
	      <td><c:out value="${item.quantity}"/></td>
	      <td>$<c:out value="${item.totalPriceEach}"/></td>
	      <td>
	      	<div>
	      	<input class="spinner" id="spinnerDelete${item.musicItem.id}">
	      	<input type="button" class="updateButton" value="<%=messages.getString("updatecart")%>" name = "${item.musicItem.id}" id="update${item.musicItem.id}">
	      	<input type="button" class="deleteButton" value="<%=messages.getString("deletecart")%>" name = "${item.musicItem.id}" id="delete${item.musicItem.id}">
	      	</div>
	      </td>	      
	    </tr>	    
       </c:forEach>
	   </tbody>	
      </table>
      
      <div>
		<input type="button" class="Button" value="<%=messages.getString("checkout")%>" id="checkout">
	  </div>
	  
	  
	</BODY>
</HTML>
