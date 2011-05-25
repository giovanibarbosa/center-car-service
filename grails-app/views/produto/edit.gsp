

<%@ page import="centercarservice.estoque.Produto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
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
            <g:hasErrors bean="${produtoInstance}">
            <div class="errors">
                <g:renderErrors bean="${produtoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${produtoInstance?.id}" />
                <g:hiddenField name="version" value="${produtoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
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
                                  <label for="descricao"><g:message code="produto.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'descricao', 'errors')}">
                                    <g:textField name="descricao" value="${produtoInstance?.descricao}" />
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
                                  <label for="precoDeCompra"><g:message code="produto.precoDeCompra.label" default="Preco De Compra" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'precoDeCompra', 'errors')}">
                                    <g:textField name="precoDeCompra" value="${fieldValue(bean: produtoInstance, field: 'precoDeCompra')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDeVencimento"><g:message code="produto.dataDeVencimento.label" default="Data De Vencimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'dataDeVencimento', 'errors')}">
                                    <g:datePicker name="dataDeVencimento" precision="day" value="${produtoInstance?.dataDeVencimento}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDePagamento"><g:message code="produto.dataDePagamento.label" default="Data De Pagamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'dataDePagamento', 'errors')}">
                                    <g:datePicker name="dataDePagamento" precision="day" value="${produtoInstance?.dataDePagamento}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="vendido"><g:message code="produto.vendido.label" default="Vendido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'vendido', 'errors')}">
                                    <g:select name="vendido" from="${produtoInstance.constraints.vendido.inList}" value="${produtoInstance?.vendido}" valueMessagePrefix="produto.vendido"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="garantia"><g:message code="produto.garantia.label" default="Garantia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'garantia', 'errors')}">
                                    <g:datePicker name="garantia" precision="day" value="${produtoInstance?.garantia}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDaCompra"><g:message code="produto.dataDaCompra.label" default="Data Da Compra" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: produtoInstance, field: 'dataDaCompra', 'errors')}">
                                    <g:datePicker name="dataDaCompra" precision="day" value="${produtoInstance?.dataDaCompra}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="produtos"><g:message code="venda.produtos.label" default="Produtos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendaInstance, field: 'produtos', 'errors')}">
                                    <g:select name="produtos" from="${centercarservice.estoque.Produto.list()}" multiple="yes" optionKey="id" size="10" value="${vendaInstance?.produtos*.id}" />
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
