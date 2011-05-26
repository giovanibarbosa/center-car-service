

<%@ page import="centercarservice.financeiro.CartaoDeCredito" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cartaoDeCredito.label', default: 'CartaoDeCredito')}" />
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
            <g:hasErrors bean="${cartaoDeCreditoInstance}">
            <div class="errors">
                <g:renderErrors bean="${cartaoDeCreditoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="valor"><g:message code="cartaoDeCredito.valor.label" default="Valor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cartaoDeCreditoInstance, field: 'valor', 'errors')}">
                                    <g:textField name="valor" value="${fieldValue(bean: cartaoDeCreditoInstance, field: 'valor')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDoVencimento"><g:message code="cartaoDeCredito.dataDoVencimento.label" default="Data Do Vencimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cartaoDeCreditoInstance, field: 'dataDoVencimento', 'errors')}">
                                    <g:datePicker name="dataDoVencimento" precision="day" value="${cartaoDeCreditoInstance?.dataDoVencimento}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDoRecebimento"><g:message code="cartaoDeCredito.dataDoRecebimento.label" default="Data Do Recebimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cartaoDeCreditoInstance, field: 'dataDoRecebimento', 'errors')}">
                                    <g:datePicker name="dataDoRecebimento" precision="day" value="${cartaoDeCreditoInstance?.dataDoRecebimento}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="venda"><g:message code="cartaoDeCredito.venda.label" default="Venda" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cartaoDeCreditoInstance, field: 'venda', 'errors')}">
                                    <g:select name="venda.id" from="${centercarservice.financeiro.Venda.list()}" optionKey="id" value="${cartaoDeCreditoInstance?.venda?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="servico"><g:message code="cartaoDeCredito.servico.label" default="Servico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cartaoDeCreditoInstance, field: 'servico', 'errors')}">
                                    <g:select name="servico.id" from="${centercarservice.financeiro.Servico.list()}" optionKey="id" value="${cartaoDeCreditoInstance?.servico?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantidadeDeParcelas"><g:message code="cartaoDeCredito.quantidadeDeParcelas.label" default="Quantidade De Parcelas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cartaoDeCreditoInstance, field: 'quantidadeDeParcelas', 'errors')}">
                                    <g:textField name="quantidadeDeParcelas" value="${fieldValue(bean: cartaoDeCreditoInstance, field: 'quantidadeDeParcelas')}" />
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
