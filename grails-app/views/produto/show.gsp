
<%@ page import="centercarservice.estoque.Produto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
        <title>Informacoes do Produto</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Iniciaç</a></span>
            <span class="menuButton"><g:link class="list" action="list">Produtos Cadastrados</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Cadastrar Novo Produto</g:link></span>
        </div>
        <div class="body">
            <h1>Informacoes do Produto</h1>
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
                            <td valign="top" class="name"><g:message code="produto.precoDeCompra.label" default="Preco De Compra" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: produtoInstance, field: "precoDeCompra")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="Lucro" default="Lucro" /></td>
                            
                            <td valign="top" class="value">${produtoInstance.calcularLucro()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.dataDeVencimento.label" default="Data De Vencimento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${produtoInstance?.dataDeVencimento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.dataDePagamento.label" default="Data De Pagamento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${produtoInstance?.dataDePagamento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.vendido.label" default="Vendido" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: produtoInstance, field: "vendido")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.garantia.label" default="Garantia" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${produtoInstance?.garantia}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="produto.dataDaCompra.label" default="Data Da Compra" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${produtoInstance?.dataDaCompra}" /></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="Esta Quitado" default="Esta Quitado" /></td>
                            
                            <td valign="top" class="value">${produtoInstance.estaQuitado()}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="Pagamento Esta Vencido" default="Pagamento Esta Vencido" /></td>
                            
                            <td valign="top" class="value">${produtoInstance.pgtoEstaVencido()}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${produtoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'Confirmar', default: 'Confirmar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Remover', default: 'Remover')}" onclick="return confirm('${message(code: 'Tem Certeza?', default: 'Tem Certeza?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
