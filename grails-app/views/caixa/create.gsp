

<%@ page import="centercarservice.financeiro.Caixa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'caixa.label', default: 'Caixa')}" />
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
            <g:hasErrors bean="${caixaInstance}">
            <div class="errors">
                <g:renderErrors bean="${caixaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contasAPagar"><g:message code="caixa.contasAPagar.label" default="Contas AP agar" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caixaInstance, field: 'contasAPagar', 'errors')}">
                                    <g:textField name="contasAPagar" value="${fieldValue(bean: caixaInstance, field: 'contasAPagar')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contasAReceber"><g:message code="caixa.contasAReceber.label" default="Contas AR eceber" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caixaInstance, field: 'contasAReceber', 'errors')}">
                                    <g:textField name="contasAReceber" value="${fieldValue(bean: caixaInstance, field: 'contasAReceber')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="totalAReceberEmServicos"><g:message code="caixa.totalAReceberEmServicos.label" default="Total AR eceber Em Servicos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caixaInstance, field: 'totalAReceberEmServicos', 'errors')}">
                                    <g:textField name="totalAReceberEmServicos" value="${fieldValue(bean: caixaInstance, field: 'totalAReceberEmServicos')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="totalAReceberEmVendas"><g:message code="caixa.totalAReceberEmVendas.label" default="Total AR eceber Em Vendas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caixaInstance, field: 'totalAReceberEmVendas', 'errors')}">
                                    <g:textField name="totalAReceberEmVendas" value="${fieldValue(bean: caixaInstance, field: 'totalAReceberEmVendas')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="totalEmServicos"><g:message code="caixa.totalEmServicos.label" default="Total Em Servicos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caixaInstance, field: 'totalEmServicos', 'errors')}">
                                    <g:textField name="totalEmServicos" value="${fieldValue(bean: caixaInstance, field: 'totalEmServicos')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="totalRecebidoEmServicos"><g:message code="caixa.totalRecebidoEmServicos.label" default="Total Recebido Em Servicos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caixaInstance, field: 'totalRecebidoEmServicos', 'errors')}">
                                    <g:textField name="totalRecebidoEmServicos" value="${fieldValue(bean: caixaInstance, field: 'totalRecebidoEmServicos')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="totalRecebidoEmVendas"><g:message code="caixa.totalRecebidoEmVendas.label" default="Total Recebido Em Vendas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caixaInstance, field: 'totalRecebidoEmVendas', 'errors')}">
                                    <g:textField name="totalRecebidoEmVendas" value="${fieldValue(bean: caixaInstance, field: 'totalRecebidoEmVendas')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="totalSalariosAPagar"><g:message code="caixa.totalSalariosAPagar.label" default="Total Salarios AP agar" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caixaInstance, field: 'totalSalariosAPagar', 'errors')}">
                                    <g:textField name="totalSalariosAPagar" value="${fieldValue(bean: caixaInstance, field: 'totalSalariosAPagar')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="totalVendido"><g:message code="caixa.totalVendido.label" default="Total Vendido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caixaInstance, field: 'totalVendido', 'errors')}">
                                    <g:textField name="totalVendido" value="${fieldValue(bean: caixaInstance, field: 'totalVendido')}" />
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
