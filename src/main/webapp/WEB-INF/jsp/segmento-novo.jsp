<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

    <title>Segmento - Cadastro</title>
    
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
					
					<h2>SEGMENTO</h2>
					
					<form:form modelAttribute="segmentModel" action="${contextPath}/segment" method="post">
					
						<spring:hasBindErrors name="segmentModel">
							<div class="alert alert-danger" role="alert">
								<form:errors path="*" class="has-error" />
							</div>
						</spring:hasBindErrors>
					
						<div class="form-group">
							<label class="control-label" for="name">Nome:</label>
							<form:input type="text" path="name" id="name" class="form-control"/>
							<font color="red"><form:errors path="name"/></font><br/>
                        </div>
                        
                     
						<div class="form-group">
							<label class="control-label" for="bot">Bot:</label>
							<form:select path="bot.idBot" class="form-control">
								<form:options items="${bots}" itemLabel="nameBot" itemValue="idBot" />
							</form:select>
						</div>
						
						<a class="btn btn-default btn-lg" href="${contextPath}/segment">Cancelar</a>
						<button type="submit" class="btn btn-primary btn-lg">Gravar</button>
                            
                       
                        <br>
					</form:form>
					
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="${js}/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>