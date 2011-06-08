
<%@ page import="centercarservice.financeiro.Cheque" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cheque.label', default: 'Cheque')}" />
        <title>Cheques Cadastrados</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Principal</a></span>
            <span class="menuButton"><g:link class="create" action="create">Cadastrar Novo Cheque</g:link></span>
        </div>
        <div class="body">
            <h1>Cheques Cadastrados</h1>
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
                            
                            <th><g:message code="cheque.numeroDoCheque.label" default="Numero do Cheque" /></th>
                            
                            <th><g:message code="cheque.banco.label" default="Banco" /></th>
                            
                            <th><g:message code="cheque.dataDeDeposito.label" default="Data de Deposito" /></th>
                            
                            <th><g:message code="cheque.dataDeCompensacao.label" default="Data de Compensacao" /></th>
                        
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
                            
                            <td>${fieldValue(bean: chequeInstance, field: "numeroDoCheque")}</td>
                            
                            <td>${fieldValue(bean: chequeInstance, field: "banco")}</td>
                            
                            <td><g:formatDate date="${chequeInstance.dataDeDeposito}" /></td>
                            
                            <td><g:formatDate date="${chequeInstance.dataDeCompensacao}" /></td>                            
                        
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
