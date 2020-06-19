<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>

    <title>Segmento - Detalhe</title>
    
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
                <div >
					
					    <h2 class="text-center">Segmento - Detalhes</h2>
					    <div class="bg-dark text-light">
					    	<div class="form-group text-center">
								<label class="control-label" for="nome">Nome:</label>
								<b>${segmento.name}</b>
                            </div>

						    <div class="form-group text-center">
								<label class="control-label" for="categoria">Bot:</label>
								<label class="label label-default">${segmento.bot.nameBot}</label>
						    </div>
					    </div>
						
						
						
						<a class="btn btn-default btn-outline-danger btn-lg" href="${contextPath}/segment">Voltar</a>
                            
                        
					
                </div>
            </div>
        </div>
    </div>

    
    <script src="${js}/jquery.js"></script>
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>