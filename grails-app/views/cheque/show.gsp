
<%@ page import="centercarservice.financeiro.Cheque" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cheque.label', default: 'Cheque')}" />
        <title>Informacoes do Cheque</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Principal</a></span>
            <span class="menuButton"><g:link class="list" action="list">Cheques Cadastrados</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Cadastrar Novo Cheque</g:link></span>
        </div>
        <div class="body">
            <h1>Informacoes do Cheque</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cheque.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chequeInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cheque.valor.label" default="Valor" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chequeInstance, field: "valor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cheque.dataDoVencimento.label" default="Data Do Vencimento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${chequeInstance?.dataDoVencimento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cheque.dataDoRecebimento.label" default="Data Do Recebimento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${chequeInstance?.dataDoRecebimento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cheque.venda.label" default="Venda" /></td>
                            
                            <td valign="top" class="value"><g:link controller="venda" action="show" id="${chequeInstance?.venda?.id}">${chequeInstance?.venda?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cheque.servico.label" default="Servico" /></td>
                            
                            <td valign="top" class="value"><g:link controller="servico" action="show" id="${chequeInstance?.servico?.id}">${chequeInstance?.servico?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cheque.numeroDoCheque.label" default="Numero Do Cheque" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chequeInstance, field: "numeroDoCheque")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cheque.banco.label" default="Banco" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: chequeInstance, field: "banco")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cheque.dataDeDeposito.label" default="Data De Deposito" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${chequeInstance?.dataDeDeposito}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cheque.dataDeCompensacao.label" default="Data De Compensacao" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${chequeInstance?.dataDeCompensacao}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${chequeInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'Alterar', default: 'Alterar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Remover', default: 'Remover')}" onclick="return confirm('${message(code: 'Tem Certeza?', default: 'Tem Certeza?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
