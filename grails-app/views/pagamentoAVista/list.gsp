
<%@ page import="centercarservice.financeiro.PagamentoAVista" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pagamentoAVista.label', default: 'PagamentoAVista')}" />
        <title>Pagamentos A Vista</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Principal</a></span>            
        </div>
        <div class="body">
            <h1>Pagamentos A Vista</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'pagamentoAVista.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="valor" title="${message(code: 'pagamentoAVista.valor.label', default: 'Valor')}" />
                        
                            <g:sortableColumn property="dataDoVencimento" title="${message(code: 'pagamentoAVista.dataDoVencimento.label', default: 'Data Do Vencimento')}" />
                        
                            <g:sortableColumn property="dataDoRecebimento" title="${message(code: 'pagamentoAVista.dataDoRecebimento.label', default: 'Data Do Recebimento')}" />
                        
                            <th><g:message code="pagamentoAVista.venda.label" default="Venda" /></th>
                        
                            <th><g:message code="pagamentoAVista.servico.label" default="Servico" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pagamentoAVistaInstanceList}" status="i" var="pagamentoAVistaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pagamentoAVistaInstance.id}">${fieldValue(bean: pagamentoAVistaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: pagamentoAVistaInstance, field: "valor")}</td>
                        
                            <td><g:formatDate date="${pagamentoAVistaInstance.dataDoVencimento}" /></td>
                        
                            <td><g:formatDate date="${pagamentoAVistaInstance.dataDoRecebimento}" /></td>
                        
                            <td>${fieldValue(bean: pagamentoAVistaInstance, field: "venda")}</td>
                        
                            <td>${fieldValue(bean: pagamentoAVistaInstance, field: "servico")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pagamentoAVistaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
