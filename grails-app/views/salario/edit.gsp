

<%@ page import="centercarservice.financeiro.Salario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'salario.label', default: 'Salario')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${salarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${salarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${salarioInstance?.id}" />
                <g:hiddenField name="version" value="${salarioInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="valorBase"><g:message code="salario.valorBase.label" default="Valor Base" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salarioInstance, field: 'valorBase', 'errors')}">
                                    <g:textField name="valorBase" value="${fieldValue(bean: salarioInstance, field: 'valorBase')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="valorComissionado"><g:message code="salario.valorComissionado.label" default="Valor Comissionado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salarioInstance, field: 'valorComissionado', 'errors')}">
                                    <g:textField name="valorComissionado" value="${fieldValue(bean: salarioInstance, field: 'valorComissionado')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDeVencimento"><g:message code="salario.dataDeVencimento.label" default="Data De Vencimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salarioInstance, field: 'dataDeVencimento', 'errors')}">
                                    <g:datePicker name="dataDeVencimento" precision="day" value="${salarioInstance?.dataDeVencimento}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDePagamento"><g:message code="salario.dataDePagamento.label" default="Data De Pagamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salarioInstance, field: 'dataDePagamento', 'errors')}">
                                    <g:datePicker name="dataDePagamento" precision="day" value="${salarioInstance?.dataDePagamento}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pago"><g:message code="salario.pago.label" default="Pago" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salarioInstance, field: 'pago', 'errors')}">
                                    <g:checkBox name="pago" value="${salarioInstance?.pago}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="funcionario"><g:message code="salario.funcionario.label" default="Funcionario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salarioInstance, field: 'funcionario', 'errors')}">
                                    <g:select name="funcionario.id" from="${centercarservice.cadastro.Funcionario.list()}" optionKey="id" value="${salarioInstance?.funcionario?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
