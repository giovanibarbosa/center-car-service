
<%@ page import="centercarservice.Cliente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="Pagina Inicial"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="Cadastrar Novo Cliente" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Clientes Cadastrados" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'cliente.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="cpf" title="${message(code: 'cliente.cpf.label', default: 'Cpf')}" />
                        
                            <g:sortableColumn property="rg" title="${message(code: 'cliente.rg.label', default: 'Rg')}" />
                        
                            <g:sortableColumn property="dataNascimento" title="${message(code: 'cliente.dataNascimento.label', default: 'Data Nascimento')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'cliente.email.label', default: 'Email')}" />
                        
                            <th><g:message code="cliente.endereco.label" default="Endereco" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${clienteInstance.id}">${fieldValue(bean: clienteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "cpf")}</td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "rg")}</td>
                        
                            <td><g:formatDate date="${clienteInstance.dataNascimento}" /></td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "endereco")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${clienteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
