
<%@ page import="centercarservice.financeiro.Salario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'salario.label', default: 'Salario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'salario.id.label', default: 'Id')}" />
                        
                        	<g:sortableColumn property="nome" title="${message(code: 'salario.id.label', default: 'Id')}" />
                                                
                        	<g:sortableColumn property="salario base" title="Salario Base" />
                        
                        	<g:sortableColumn property="salario comissionado" title="Salario Comissionado" />
                            
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${salarioInstanceList}" status="i" var="salarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${salarioInstance.id}">${fieldValue(bean: salarioInstance, field: "id")}</g:link></td>
                        
                           <td> ${salarioInstance.getFuncionario().getNome()}</td>
                        
                           <td>${salarioInstance.calculaSalarioBase() }
                           </td>
                           
                           <td>${salarioInstance.calculaSalarioComissionado()}
                           </td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${salarioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
