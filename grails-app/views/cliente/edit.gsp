

<%@ page import="centercarservice.cadastro.Cliente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
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
            <g:hasErrors bean="${clienteInstance}">
            <div class="errors">
                <g:renderErrors bean="${clienteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${clienteInstance?.id}" />
                <g:hiddenField name="version" value="${clienteInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="carros"><g:message code="cliente.carros.label" default="Carros" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'carros', 'errors')}">
                                    
<ul>
<g:each in="${clienteInstance?.carros?}" var="c">
    <li><g:link controller="carro" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="carro" action="create" params="['cliente.id': clienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'carro.label', default: 'Carro')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="compras"><g:message code="cliente.compras.label" default="Compras" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'compras', 'errors')}">
                                    
<ul>
<g:each in="${clienteInstance?.compras?}" var="c">
    <li><g:link controller="venda" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="venda" action="create" params="['cliente.id': clienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'venda.label', default: 'Venda')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cpf"><g:message code="cliente.cpf.label" default="Cpf" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'cpf', 'errors')}">
                                    <g:textField name="cpf" value="${clienteInstance?.cpf}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDeNascimento"><g:message code="cliente.dataDeNascimento.label" default="Data De Nascimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'dataDeNascimento', 'errors')}">
                                    <g:datePicker name="dataDeNascimento" precision="day" value="${clienteInstance?.dataDeNascimento}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endereco"><g:message code="cliente.endereco.label" default="Endereco" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'endereco', 'errors')}">
                                    <g:select name="endereco.id" from="${centercarservice.cadastro.Endereco.list()}" optionKey="id" value="${clienteInstance?.endereco?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="cliente.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${clienteInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rg"><g:message code="cliente.rg.label" default="Rg" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'rg', 'errors')}">
                                    <g:textField name="rg" value="${clienteInstance?.rg}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefone"><g:message code="cliente.telefone.label" default="Telefone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'telefone', 'errors')}">
                                    <g:textField name="telefone" value="${clienteInstance?.telefone}" />
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
