
<%@ page import="centercarservice.financeiro.Pagamento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pagamento.label', default: 'Pagamento')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'pagamento.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="valor" title="${message(code: 'pagamento.valor.label', default: 'Valor')}" />
                        
                            <g:sortableColumn property="dataDoVencimento" title="${message(code: 'pagamento.dataDoVencimento.label', default: 'Data Do Vencimento')}" />
                        
                            <g:sortableColumn property="dataDoRecebimento" title="${message(code: 'pagamento.dataDoRecebimento.label', default: 'Data Do Recebimento')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pagamentoInstanceList}" status="i" var="pagamentoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pagamentoInstance.id}">${fieldValue(bean: pagamentoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: pagamentoInstance, field: "valor")}</td>
                        
                            <td><g:formatDate date="${pagamentoInstance.dataDoVencimento}" /></td>
                        
                            <td><g:formatDate date="${pagamentoInstance.dataDoRecebimento}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pagamentoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
