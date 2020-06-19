<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

    <title>Bots</title>
    
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
				
				<h1>Bots</h1>
				
				<p class="toolbar">
				
					<a class="create btn btn-default" href="${contextPath}/bot/form?page=bot-novo">Novo Bot</a>
					<span class="alert"></span>
				</p>
				
				<c:if test="${not empty messages}">
					<h3 class="alert alert-warning">${messages}</h3>
				</c:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
							<th data-field="name">Nome:</th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach items="${bots}" var="bot">
						<tr>
							<td>${bot.nameBot}</td>
							
							<td class="actions">
							
								<form:form action="${contextPath}/bot/${bot.idBot}" method="delete">
								
									<a class="btn btn-success btn-xs" href="${contextPath}/bot/${bot.idBot}">Detalhes</a>
									<a class="btn btn-warning btn-xs" href="${contextPath}/bot/form?page=bot-editar&id=${bot.idBot}">Editar</a>
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