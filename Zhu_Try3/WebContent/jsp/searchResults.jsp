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
    <script type="text/javascript">
      $(function() {
    	  
    	  //alert($("html").attr("lang"));
  
    	  $(".spinner").spinner({
    		  min: 1,
    		  max: 3,
    		  
    	  });
    	  
    	  
    	  $._.setLocale($("html").attr("lang")); 
    	  
    	  $(".addButton").on("click", function(){
    		  var id = $(this).attr("name");
    		  var count = $("#spinner"+id).spinner("value");
    		  console.log(id+" "+count);
    		  $.ajax({
    			  type : "POST",
  				  url : "addToCart.do",
    			  data: {
    				  id: id,
    				  count: count
    			  },
    			success : function(respText, status, jqXHR) {
    				if ($.trim(respText) == "success") {
    					alertify.alert($._("added"));		
    				}
    				if ($.trim(respText) == "update") {
    					alertify.alert($._("updated"));		
    				}
    			}
    			  
    		  });
    		  
    	  });
      });
        	
        
   </script>
   </HEAD>
   <BODY background="../images/music.gif">
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
	
	
     <p><font color="#FFFFFF"><%=messages.getString("searchkeyword")%> <B><c:out value='${param.keyword}'/></B>:</font></p>
     <br>
	<table border="2" width='800'>
	  <thead>
	    <tr height='60'>
	      <th width='60'>ID</th>
	      <th  width='600'><%=messages.getString("title")%>/<%=messages.getString("artist")%></th>
	      <th  width='150'><%=messages.getString("releasedate")%></th>
	      <th  width='150'><%=messages.getString("unitprice")%></th>
	      <th  width='150'><font><%=messages.getString("addtocart")%></font></th>
	    </tr>
	  </thead> 
	  <tbody>

       <c:forEach items="${results}" var="item">
	
	    <tr height='50'>
	      <td><c:out value="${item.id}"/></td>
	      <td><b><c:out value="${item.title}"/></b><br><br>
		  <c:out value="${item.artist}"/></td>
	      <td><fmt:formatDate value="${item.releaseDate}" type="date" dateStyle="medium"/></td>
	      <td>$<c:out value="${item.price}"/></td>
	      <td>
	      	<div>
	      	<input class="spinner" id="spinner${item.id}">
	      	<input type="button" class="addButton" value="<%=messages.getString("addtocart")%>" name = "${item.id}" id="button${item.id}">
	      	</div>
	      </td>
	      
	    </tr>
	    
       </c:forEach>
	    </tbody>
		
      </table>
	

   </BODY>
</HTML>
