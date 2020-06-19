

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

    <title> Segmento - Listagem </title>
    
    <spring:url value="/css" var="css"/>
    <spring:url value="/js" var="js"/>
    
    <c:set value="${pageContext.request.contextPath}" var="contextPath"/>
    
    <link href="${css}/bootstrap.css" rel="stylesheet">
    <link href="${css}/small-business.css" rel="stylesheet">
    <link href="${css}/style.css" rel="stylesheet">

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
				
				<h1>Segmento</h1>
				
				<p class="toolbar">
				
					<a class="create btn btn-default" href="${contextPath}/segment/form?page=segmento-novo">Novo Segmento</a>
	
					<span class="alert"></span>
				</p>
				
				<c:if test="${not empty messages}">
					<h3 class="alert alert-warning">${messages}</h3>
				</c:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
							<th data-field="name">Nome do segmento</th>
							<th data-field="name">Id do pai</th>
							<th data-field="name">Nome do pai</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach items="${segmentos}" var="segmento">
						<tr>
							<td>${segmento.name}</td>
							
							<td>${segmento.bot.idBot}</td>
							
							<td>${segmento.bot.nameBot}</td>
							
							<td class="actions">
							
								<form:form action="${contextPath}/segment/${segmento.idSegment}" method="delete">
								
									<a class="btn btn-success btn-xs" href="${contextPath}/segment/${segmento.idSegment}">Detalhes</a>
									<a class="btn btn-warning btn-xs" href="${contextPath}/segment/form?page=segmento-editar&id=${segmento.idSegment}">Editar</a>
									<input type="submit" value="Excluir" class="btn btn-danger btn-xs">
									
								</form:form>
								
							</td>
						</tr>
					</c:forEach>
                    </tbody>
				</table>
            </div>
        </div>
		<hr>
    </div>

    <script src="${js}/jquery.js"></script>
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>