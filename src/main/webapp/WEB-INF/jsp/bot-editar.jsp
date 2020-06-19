<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>

<head>

    <title>Bot - Editar</title>
    
    <spring:url value="/css" var="css"/>
    <spring:url value="/js" var="js"/>
    
    <c:set value="${pageContext.request.contextPath}" var="contextPath"/>
    
    <link href="${css}/bootstrap.css" rel="stylesheet">
    <link href="${css}/small-business.css" rel="stylesheet">

</head>

<body>
    
    
    
    <div class="container">

        
        <div class="row">
            <div class="col-lg-12">
                <div class="well">
					
					<h1 class="text-center">Editar Bot</h1>
					
					<form:form modelAttribute="botModel" action="${contextPath}/bot/${botModel.idBot}" method="put">
					
						<spring:hasBindErrors name="botModel">
							<div class="alert alert-danger" role="alert">
								<form:errors path="*" class="has-error" />
							</div>
						</spring:hasBindErrors>
					
						<div class="form-group">
							<label class="control-label" for="nameBot">Nome:</label>
							<form:input type="text" path="nameBot" id="nameBot"  class="form-control"/>
							<font color="red"><form:errors path="nameBot"/></font><br/>
							
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="welcomeMsg">WelcomeMSG:</label>
							<form:input type="text" path="welcomeMsg" id="welcomeMsg" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="welcomeMsg"/></font><br/>
							
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="farewellMsg">farewellMsg:</label>
							<form:input type="text" path="farewellMsg" id="farewellMsg" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="farewellMsg"/></font><br/>
							
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="downtime">downtime:</label>
							<form:input type="text" path="downtime" id="downtime" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="downtime"/></font><br/>
							
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="defaultAnswer">Nome:</label>
							<form:input type="text" path="defaultAnswer" id="defaultAnswer" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="defaultAnswer"/></font><br/>
							
                        </div>
						<a class="btn btn-default btn-lg" href="${contextPath}/bot">Cancelar</a>
						<button type="submit" class="btn btn-primary btn-lg">Gravar</button>    
                        <br>
                        <br>
					</form:form>
					
                </div>
            </div>
        </div>
    </div>
    <script src="${js}/jquery.js"></script>
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>