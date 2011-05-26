
<%@ page import="centercarservice.financeiro.CartaoDeCredito" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cartaoDeCredito.label', default: 'CartaoDeCredito')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'cartaoDeCredito.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="valor" title="${message(code: 'cartaoDeCredito.valor.label', default: 'Valor')}" />
                        
                            <g:sortableColumn property="dataDoVencimento" title="${message(code: 'cartaoDeCredito.dataDoVencimento.label', default: 'Data Do Vencimento')}" />
                        
                            <g:sortableColumn property="dataDoRecebimento" title="${message(code: 'cartaoDeCredito.dataDoRecebimento.label', default: 'Data Do Recebimento')}" />
                        
                            <th><g:message code="cartaoDeCredito.venda.label" default="Venda" /></th>
                        
                            <th><g:message code="cartaoDeCredito.servico.label" default="Servico" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cartaoDeCreditoInstanceList}" status="i" var="cartaoDeCreditoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${cartaoDeCreditoInstance.id}">${fieldValue(bean: cartaoDeCreditoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: cartaoDeCreditoInstance, field: "valor")}</td>
                        
                            <td><g:formatDate date="${cartaoDeCreditoInstance.dataDoVencimento}" /></td>
                        
                            <td><g:formatDate date="${cartaoDeCreditoInstance.dataDoRecebimento}" /></td>
                        
                            <td>${fieldValue(bean: cartaoDeCreditoInstance, field: "venda")}</td>
                        
                            <td>${fieldValue(bean: cartaoDeCreditoInstance, field: "servico")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cartaoDeCreditoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
