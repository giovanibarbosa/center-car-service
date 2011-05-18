

<%@ page import="centercarservice.cadastro.Funcionario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'funcionario.label', default: 'Funcionario')}" />
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
            <g:hasErrors bean="${funcionarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${funcionarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${funcionarioInstance?.id}" />
                <g:hiddenField name="version" value="${funcionarioInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cpf"><g:message code="funcionario.cpf.label" default="Cpf" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'cpf', 'errors')}">
                                    <g:textField name="cpf" value="${funcionarioInstance?.cpf}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDeNascimento"><g:message code="funcionario.dataDeNascimento.label" default="Data De Nascimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'dataDeNascimento', 'errors')}">
                                    <g:datePicker name="dataDeNascimento" precision="day" value="${funcionarioInstance?.dataDeNascimento}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endereco"><g:message code="funcionario.endereco.label" default="Endereco" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'endereco', 'errors')}">
                                    <g:select name="endereco.id" from="${centercarservice.cadastro.Endereco.list()}" optionKey="id" value="${funcionarioInstance?.endereco?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="funcionario.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${funcionarioInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rg"><g:message code="funcionario.rg.label" default="Rg" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'rg', 'errors')}">
                                    <g:textField name="rg" value="${funcionarioInstance?.rg}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="salarios"><g:message code="funcionario.salarios.label" default="Salarios" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'salarios', 'errors')}">
                                    
<ul>
<g:each in="${funcionarioInstance?.salarios?}" var="s">
    <li><g:link controller="salario" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="salario" action="create" params="['funcionario.id': funcionarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'salario.label', default: 'Salario')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefone"><g:message code="funcionario.telefone.label" default="Telefone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'telefone', 'errors')}">
                                    <g:textField name="telefone" value="${funcionarioInstance?.telefone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="totalEmSalariosAtrasados"><g:message code="funcionario.totalEmSalariosAtrasados.label" default="Total Em Salarios Atrasados" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'totalEmSalariosAtrasados', 'errors')}">
                                    <g:textField name="totalEmSalariosAtrasados" value="${fieldValue(bean: funcionarioInstance, field: 'totalEmSalariosAtrasados')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="vendas"><g:message code="funcionario.vendas.label" default="Vendas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'vendas', 'errors')}">
                                    
<ul>
<g:each in="${funcionarioInstance?.vendas?}" var="v">
    <li><g:link controller="venda" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="venda" action="create" params="['funcionario.id': funcionarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'venda.label', default: 'Venda')])}</g:link>

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
