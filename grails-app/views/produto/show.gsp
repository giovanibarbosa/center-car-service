
<%@ page import="centercarservice.estoque.Produto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: produtoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.referencia.label" default="Referencia" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: produtoInstance, field: "referencia")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.descricao.label" default="Descricao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: produtoInstance, field: "descricao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.precoDeVenda.label" default="Preco De Venda" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: produtoInstance, field: "precoDeVenda")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.dataDaCompra.label" default="Data Da Compra" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${produtoInstance?.dataDaCompra}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.dataDePagamento.label" default="Data De Pagamento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${produtoInstance?.dataDePagamento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.dataDeVencimento.label" default="Data De Vencimento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${produtoInstance?.dataDeVencimento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.garantia.label" default="Garantia" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${produtoInstance?.garantia}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.lucro.label" default="Lucro" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: produtoInstance, field: "lucro")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.quitado.label" default="Quitado" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${produtoInstance?.quitado}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${produtoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
