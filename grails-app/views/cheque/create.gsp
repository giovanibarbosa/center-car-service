

<%@ page import="centercarservice.financeiro.Cheque" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cheque.label', default: 'Cheque')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${chequeInstance}">
            <div class="errors">
                <g:renderErrors bean="${chequeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="valor"><g:message code="cheque.valor.label" default="Valor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chequeInstance, field: 'valor', 'errors')}">
                                    <g:textField name="valor" value="${fieldValue(bean: chequeInstance, field: 'valor')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDoVencimento"><g:message code="cheque.dataDoVencimento.label" default="Data Do Vencimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chequeInstance, field: 'dataDoVencimento', 'errors')}">
                                    <g:datePicker name="dataDoVencimento" precision="day" value="${chequeInstance?.dataDoVencimento}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDoRecebimento"><g:message code="cheque.dataDoRecebimento.label" default="Data Do Recebimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chequeInstance, field: 'dataDoRecebimento', 'errors')}">
                                    <g:datePicker name="dataDoRecebimento" precision="day" value="${chequeInstance?.dataDoRecebimento}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="venda"><g:message code="cheque.venda.label" default="Venda" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chequeInstance, field: 'venda', 'errors')}">
                                    <g:select name="venda.id" from="${centercarservice.financeiro.Venda.list()}" optionKey="id" value="${chequeInstance?.venda?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="servico"><g:message code="cheque.servico.label" default="Servico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chequeInstance, field: 'servico', 'errors')}">
                                    <g:select name="servico.id" from="${centercarservice.financeiro.Servico.list()}" optionKey="id" value="${chequeInstance?.servico?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="numeroDoCheque"><g:message code="cheque.numeroDoCheque.label" default="Numero Do Cheque" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chequeInstance, field: 'numeroDoCheque', 'errors')}">
                                    <g:textField name="numeroDoCheque" value="${chequeInstance?.numeroDoCheque}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="banco"><g:message code="cheque.banco.label" default="Banco" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chequeInstance, field: 'banco', 'errors')}">
                                    <g:textField name="banco" value="${chequeInstance?.banco}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDeDeposito"><g:message code="cheque.dataDeDeposito.label" default="Data De Deposito" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chequeInstance, field: 'dataDeDeposito', 'errors')}">
                                    <g:datePicker name="dataDeDeposito" precision="day" value="${chequeInstance?.dataDeDeposito}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDeCompensacao"><g:message code="cheque.dataDeCompensacao.label" default="Data De Compensacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: chequeInstance, field: 'dataDeCompensacao', 'errors')}">
                                    <g:datePicker name="dataDeCompensacao" precision="day" value="${chequeInstance?.dataDeCompensacao}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
