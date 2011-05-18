

<%@ page import="centercarservice.cadastro.Carro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'carro.label', default: 'Carro')}" />
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
            <g:hasErrors bean="${carroInstance}">
            <div class="errors">
                <g:renderErrors bean="${carroInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${carroInstance?.id}" />
                <g:hiddenField name="version" value="${carroInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="carro.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carroInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${carroInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ano"><g:message code="carro.ano.label" default="Ano" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carroInstance, field: 'ano', 'errors')}">
                                    <g:textField name="ano" value="${fieldValue(bean: carroInstance, field: 'ano')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="motor"><g:message code="carro.motor.label" default="Motor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carroInstance, field: 'motor', 'errors')}">
                                    <g:textField name="motor" value="${carroInstance?.motor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cor"><g:message code="carro.cor.label" default="Cor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carroInstance, field: 'cor', 'errors')}">
                                    <g:textField name="cor" value="${carroInstance?.cor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="placa"><g:message code="carro.placa.label" default="Placa" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carroInstance, field: 'placa', 'errors')}">
                                    <g:textField name="placa" value="${carroInstance?.placa}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoDeCombustivel"><g:message code="carro.tipoDeCombustivel.label" default="Tipo De Combustivel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carroInstance, field: 'tipoDeCombustivel', 'errors')}">
                                    <g:select name="tipoDeCombustivel" from="${carroInstance.constraints.tipoDeCombustivel.inList}" value="${carroInstance?.tipoDeCombustivel}" valueMessagePrefix="carro.tipoDeCombustivel"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cliente"><g:message code="carro.cliente.label" default="Cliente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carroInstance, field: 'cliente', 'errors')}">
                                    <g:select name="cliente.id" from="${centercarservice.cadastro.Cliente.list()}" optionKey="id" value="${carroInstance?.cliente?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="servicos"><g:message code="carro.servicos.label" default="Servicos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: carroInstance, field: 'servicos', 'errors')}">
                                    <g:select name="servicos" from="${centercarservice.financeiro.Servico.list()}" multiple="yes" optionKey="id" size="5" value="${carroInstance?.servicos*.id}" />
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
