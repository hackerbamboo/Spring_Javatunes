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
		padding: 20px;
	}
	table tbody tr:hover{
		background-color:#00BFFF;
	}
	#price{
		color:white;
	}
	
</style>

<script>

$(function() {
	 $._.setLocale($("html").attr("lang")); 
	 
	  $("#checkout").on("click", function(){
		  $.ajax({
			  type: "GET",
			  url: "checkout.do",
			  success: window.location.href="checkout.do"
		  });
		  
	  });
	  
	  $("#card").dialog({
			closeOnEscape : true,
			modal : true,
			position : {
				my : "center",
				at : "center"
			},
			create : function(event, ui) {
				$(".ui-dialog-titlebar").hide();
			},
			width : "350",
			height : "300",
			autoOpen : false,
			show : "blind",
			hide : "fold",
			close : function() {
				$("#card input[type!='button']").val("");
			}
		});
	  
	  $("#pay").on("click", function(){
		  $("#card").dialog("open");
	  });
	  
	  $("#card_close").click(function() {
			$("#card").dialog("close");
		});
	  
	  $("#finally").on("click", function(){
		  $.ajax({
			  type: "POST",
			  url: "checkout.do",
			  success: function(){
				  alertify.alert($._("thankyou"));
				  window.location.href="index.do";
			  }
		  })
	  })
	  
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
	    </tr>
	  </thead> 
	  <tbody>

		
       <c:forEach items="${finalresults.passBack}" var="item">
	
	    <tr height='60'>
	      <td><c:out value="${item.musicItem.id}"/></td>
	      <td><b><c:out value="${item.musicItem.title}"/></b><br><br>
		  <c:out value="${item.musicItem.artist}"/></td>
	      <td><fmt:formatDate value="${item.musicItem.releaseDate}" type="date" dateStyle="medium"/></td>
	      <td>$<c:out value="${item.musicItem.price}"/></td>
	      <td><c:out value="${item.quantity}"/></td>
	      <td>$<c:out value="${item.totalPriceEach}"/></td> 
	    </tr>	    
       </c:forEach>
	   </tbody>	
      </table>
      <div id="price">
      <%=messages.getString("totalPriceBeforeTax") %>: <b>$<c:out value="${finalresults.totalPriceBeforeTax }"/> </b><br>
	  <%=messages.getString("taxof") %> <c:out value="${finalresults.state}"/>: <b><c:out value="${finalresults.tax }"/></b><br>
	  <%=messages.getString("totalPriceAfterTax") %>: <b>$<c:out value="${finalresults.totalPriceAfterTax }"/> </b><br>
    </div>
     <div>
     	<a href="${pageContext.request.contextPath}/viewcart.do"><input type="button" class="Button" value="Go Back"></a>
		<input type="button" class="Button" value="<%=messages.getString("placeorder")%>" id="pay">
	  </div>
	  
	  
	  
	  <div id="card" style="display: none">
		<img id="card_close" src="images/x.png" class="closeimage">
		<h2><%=messages.getString("PlaceOrder") %></h2>
		<form>
			<input type="text" name="text" id="cardnumber" placeholder="Card Number"><br>
			<br> <input type="button" value="<%=messages.getString("paynow")%>" class="Button" id="finally">
		</form>
	</div>
	  
	</BODY>
</HTML>
