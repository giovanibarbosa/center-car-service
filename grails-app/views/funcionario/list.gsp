
<%@ page import="centercarservice.cadastro.Funcionario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'funcionario.label', default: 'Funcionario')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'funcionario.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'funcionario.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="cpf" title="${message(code: 'funcionario.cpf.label', default: 'Cpf')}" />
                        
                            <g:sortableColumn property="rg" title="${message(code: 'funcionario.rg.label', default: 'Rg')}" />
                        
                            <g:sortableColumn property="dataDeNascimento" title="${message(code: 'funcionario.dataDeNascimento.label', default: 'Data De Nascimento')}" />
                        
                            <g:sortableColumn property="telefone" title="${message(code: 'funcionario.telefone.label', default: 'Telefone')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${funcionarioInstanceList}" status="i" var="funcionarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${funcionarioInstance.id}">${fieldValue(bean: funcionarioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: funcionarioInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: funcionarioInstance, field: "cpf")}</td>
                        
                            <td>${fieldValue(bean: funcionarioInstance, field: "rg")}</td>
                        
                            <td><g:formatDate date="${funcionarioInstance.dataDeNascimento}" /></td>
                        
                            <td>${fieldValue(bean: funcionarioInstance, field: "telefone")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${funcionarioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
