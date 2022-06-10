<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Lista de Usuarios</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>

<body>
	<div class="generic-container">
		<%@include file="authheader.jsp" %>
		<div class="panel-heading"><span class="lead">Lista de Usuarios </span></div>
			<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <input class="form-control" id="myInput" type="text" placeholder="Search..">
		  	<table class="table table-hover" id="myTable2">
	    		<thead>
		      		<tr>
				        <th onclick="sortTable(0)">Nombre</th>
				        <th onclick="sortTable(1)">Apellido</th>
				        <th onclick="sortTable(2)">Email</th>
				        <th>Usuario</th>
				        <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
				        	<th width="100"></th>
				        </sec:authorize>
				        <sec:authorize access="hasRole('ADMIN')">
				        	<th width="100"></th>
				        </sec:authorize>

					</tr>
		    	</thead>
	    		<tbody id="myTable">
				<c:forEach items="${users}" var="user">
					<tr>
						<td>${user.firstName}</td>
						<td>${user.lastName}</td>
						<td>${user.email}</td>
						<td>${user.ssoId}</td>
					    <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
							<td><a href="<c:url value='/edit-user-${user.ssoId}' />" class="btn btn-success custom-width">Modificar</a></td>
				        </sec:authorize>
				        <sec:authorize access="hasRole('ADMIN')">
							<td><a href="<c:url value='/delete-user-${user.ssoId}' />" class="btn btn-danger custom-width">Eliminar</a></td>
        				</sec:authorize>
					</tr>
				</c:forEach>
	    		</tbody>
	    	</table>
		</div>

	 	<sec:authorize access="hasRole('ADMIN')">
			<td><a href="<c:url value='/newuser' />" class="btn btn-success custom-width">Agregar</a></td>
			</sec:authorize>
   	</div>

</body>

</html>