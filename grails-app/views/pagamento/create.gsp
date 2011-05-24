

<%@ page import="centercarservice.financeiro.Pagamento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pagamento.label', default: 'Pagamento')}" />
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
            <g:hasErrors bean="${pagamentoInstance}">
            <div class="errors">
                <g:renderErrors bean="${pagamentoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDoVencimento"><g:message code="pagamento.dataDoVencimento.label" default="Data Do Vencimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pagamentoInstance, field: 'dataDoVencimento', 'errors')}">
                                    <g:datePicker name="dataDoVencimento" precision="day" value="${pagamentoInstance?.dataDoVencimento}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDoRecebimento"><g:message code="pagamento.dataDoRecebimento.label" default="Data Do Recebimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pagamentoInstance, field: 'dataDoRecebimento', 'errors')}">
                                    <g:datePicker name="dataDoRecebimento" precision="day" value="${pagamentoInstance?.dataDoRecebimento}" default="none" noSelection="['': '']" />
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
