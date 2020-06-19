<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>

    <title>Bot - Detalhe</title>
    
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
            <div class="col-lg-12">
                <div class="">
					
					<h2 class="text-center">Detalhes do Bot</h2>
					
					<div class="bg-dark text-light">
					
					    <div class="form-group">
							<label class="control-label" for="nomeBot">Nome:</label>
							<b>${bot.nameBot}</b>
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="nome">Mensagem de boas vindas:</label>
							<b>${bot.welcomeMsg}</b>
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="nome">Mensagem farewell:</label>
							<b>${bot.farewellMsg}</b>
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="nome">Downtime:</label>
							<b>${bot.downtime}</b>
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="nome">Mensagem Padrão:</label>
							<b>${bot.defaultAnswer}</b>
                        </div>
					
					
					</div>
						
                        
                        
						<hr>
						
						<a class="btn btn-default btn-lg outline-button-danger" href="${contextPath}/bot">Voltar</a>
                            
                        <br>
                        <br>
					
                </div>
            </div>
        </div>
    </div>

  
    <script src="${js}/jquery.js"></script>
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>