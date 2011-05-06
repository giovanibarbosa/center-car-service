

<%@ page import="centercarservice.Funcionario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'funcionario.label', default: 'Funcionario')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="Pagina Inicial"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="Exibir Funcionarios" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Cadastrar Funcionario" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${funcionarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${funcionarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
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
                                    <label for="dataNascimento"><g:message code="funcionario.dataNascimento.label" default="Data Nascimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'dataNascimento', 'errors')}">
                                    <g:datePicker name="dataNascimento" precision="day" value="${funcionarioInstance?.dataNascimento}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endereco"><g:message code="funcionario.endereco.label" default="Endereco" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'endereco', 'errors')}">
                                    <g:select name="endereco.id" from="${centercarservice.Endereco.list()}" optionKey="id" value="${funcionarioInstance?.endereco?.id}"  />
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
                                    <label for="salario"><g:message code="funcionario.salario.label" default="Salario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'salario', 'errors')}">
                                    <g:textField name="salario" value="${fieldValue(bean: funcionarioInstance, field: 'salario')}" />
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
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Confirmar Cadastro" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
