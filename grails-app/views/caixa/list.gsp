
<%@ page import="centercarservice.financeiro.Caixa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'caixa.label', default: 'Caixa')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Relatorio do Caixa" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'caixa.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="contasAPagar" title="${message(code: 'caixa.contasAPagar.label', default: 'Contas A Pagar')}" />
                        
                            <g:sortableColumn property="contasAReceber" title="${message(code: 'caixa.contasAReceber.label', default: 'Contas A Receber')}" />
                        
                            <g:sortableColumn property="totalAReceberEmServicos" title="${message(code: 'caixa.totalAReceberEmServicos.label', default: 'Total A Receber Em Servicos')}" />
                        
                            <g:sortableColumn property="totalAReceberEmVendas" title="${message(code: 'caixa.totalAReceberEmVendas.label', default: 'Total A Receber Em Vendas')}" />
                        
                            <g:sortableColumn property="totalEmServicos" title="${message(code: 'caixa.totalEmServicos.label', default: 'Total Em Servicos')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${caixaInstanceList}" status="i" var="caixaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${caixaInstance.id}">${fieldValue(bean: caixaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: caixaInstance, field: "contasAPagar")}</td>
                        
                            <td>${fieldValue(bean: caixaInstance, field: "contasAReceber")}</td>
                        
                            <td>${fieldValue(bean: caixaInstance, field: "totalAReceberEmServicos")}</td>
                        
                            <td>${fieldValue(bean: caixaInstance, field: "totalAReceberEmVendas")}</td>
                        
                            <td>${fieldValue(bean: caixaInstance, field: "totalEmServicos")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${caixaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
