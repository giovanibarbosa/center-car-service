

<%@ page import="centercarservice.financeiro.Salario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'salario.label', default: 'Salario')}" />
        <title>Cadastrar Salario de Funcionario</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Inicial</a></span>
            <span class="menuButton"><g:link class="list" action="list">Salarios dos Funcionarios</g:link></span>
        </div>
        <div class="body">
            <h1>Cadastrar Salario de Funcionario</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${salarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${salarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
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
                                    <label for="taxaDeComissao"><g:message code="salario.taxaDeComissao.label" default="Taxa De Comissao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salarioInstance, field: 'taxaDeComissao', 'errors')}">
                                    <g:textField name="taxaDeComissao" value="${fieldValue(bean: salarioInstance, field: 'taxaDeComissao')}" />
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
                                    <g:select name="pago" from="${salarioInstance.constraints.pago.inList}" value="${salarioInstance?.pago}" valueMessagePrefix="salario.pago"  />
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'Cadastrar', default: 'Cadastrar')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
