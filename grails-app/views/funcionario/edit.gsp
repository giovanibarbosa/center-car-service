

<%@ page import="centercarservice.cadastro.Funcionario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'funcionario.label', default: 'Funcionario')}" />
        <title>Alterar Funcionario</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Principal</a></span>
            <span class="menuButton"><g:link class="list" action="list">Funcionarios Cadastrados</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Cadastrar Novo Funcionario</g:link></span>
        </div>
        <div class="body">
            <h1>Alterar Funcionario</h1>
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
                                  <label for="nome"><g:message code="funcionario.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${funcionarioInstance?.nome}" />
                                </td>
                            </tr>
                        
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
                                  <label for="rg"><g:message code="funcionario.rg.label" default="Rg" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'rg', 'errors')}">
                                    <g:textField name="rg" value="${funcionarioInstance?.rg}" />
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
                                  <label for="telefone"><g:message code="funcionario.telefone.label" default="Telefone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'telefone', 'errors')}">
                                    <g:textField name="telefone" value="${funcionarioInstance?.telefone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endereco"><g:message code="funcionario.endereco.label" default="Endereco" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'endereco', 'errors')}">
                                    <g:textField name="endereco" value="${funcionarioInstance?.endereco}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDeIngresso"><g:message code="funcionario.dataDeIngresso.label" default="Data De Ingresso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'dataDeIngresso', 'errors')}">
                                    <g:datePicker name="dataDeIngresso" precision="day" value="${funcionarioInstance?.dataDeIngresso}"  />
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
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'Confirmar', default: 'Confirmar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Remover', default: 'Remover')}" onclick="return confirm('${message(code: 'Tem Certeza?', default: 'Tem Certeza?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
