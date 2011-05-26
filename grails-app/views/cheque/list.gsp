
<%@ page import="centercarservice.financeiro.Cheque" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cheque.label', default: 'Cheque')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'cheque.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="valor" title="${message(code: 'cheque.valor.label', default: 'Valor')}" />
                        
                            <g:sortableColumn property="dataDoVencimento" title="${message(code: 'cheque.dataDoVencimento.label', default: 'Data Do Vencimento')}" />
                        
                            <g:sortableColumn property="dataDoRecebimento" title="${message(code: 'cheque.dataDoRecebimento.label', default: 'Data Do Recebimento')}" />
                        
                            <th><g:message code="cheque.venda.label" default="Venda" /></th>
                        
                            <th><g:message code="cheque.servico.label" default="Servico" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${chequeInstanceList}" status="i" var="chequeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${chequeInstance.id}">${fieldValue(bean: chequeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: chequeInstance, field: "valor")}</td>
                        
                            <td><g:formatDate date="${chequeInstance.dataDoVencimento}" /></td>
                        
                            <td><g:formatDate date="${chequeInstance.dataDoRecebimento}" /></td>
                        
                            <td>${fieldValue(bean: chequeInstance, field: "venda")}</td>
                        
                            <td>${fieldValue(bean: chequeInstance, field: "servico")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${chequeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
