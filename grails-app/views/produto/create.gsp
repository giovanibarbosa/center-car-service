

<%@ page import="centercarservice.Produto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="Página inicial"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="Visualizar Estoque de Peças" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Adicionar Produto" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${produtoInstance}">
            <div class="errors">
                <g:renderErrors bean="${produtoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="carro"><g:message code="produto.carro.label" default="Carro" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'carro', 'errors')}">
                                    <g:select name="carro.id" from="${centercarservice.Carro.list()}" optionKey="id" value="${produtoInstance?.carro?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricao"><g:message code="produto.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'descricao', 'errors')}">
                                    <g:textField name="descricao" value="${produtoInstance?.descricao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lucro"><g:message code="produto.lucro.label" default="Lucro" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'lucro', 'errors')}">
                                    <g:textField name="lucro" value="${fieldValue(bean: produtoInstance, field: 'lucro')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="precoDeCompra"><g:message code="produto.precoDeCompra.label" default="Preco De Compra" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'precoDeCompra', 'errors')}">
                                    <g:textField name="precoDeCompra" value="${fieldValue(bean: produtoInstance, field: 'precoDeCompra')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="precoDeVenda"><g:message code="produto.precoDeVenda.label" default="Preco De Venda" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'precoDeVenda', 'errors')}">
                                    <g:textField name="precoDeVenda" value="${fieldValue(bean: produtoInstance, field: 'precoDeVenda')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="referencia"><g:message code="produto.referencia.label" default="Referencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'referencia', 'errors')}">
                                    <g:textField name="referencia" value="${produtoInstance?.referencia}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="validade"><g:message code="produto.validade.label" default="Validade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'validade', 'errors')}">
                                    <g:datePicker name="validade" precision="day" value="${produtoInstance?.validade}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Adicionar Peça" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
