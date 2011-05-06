
<%@ page import="centercarservice.Produto" %>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="Página inicial"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="Adicionar novo produto" args="[entityName]" />			
</g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Estoque de Peças" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'produto.id.label', default: 'Id')}" />
                        
                            <th><g:message code="produto.carro.label" default="Id do Carro" /></th>
                        
                            <g:sortableColumn property="descricao" title="${message(code: 'produto.descricao.label', default: 'Descricao')}" />
                        
                            <g:sortableColumn property="lucro" title="${message(code: 'produto.lucro.label', default: 'Lucro')}" />
                        
                            <g:sortableColumn property="precoDeCompra" title="${message(code: 'produto.precoDeCompra.label', default: 'Preco De Compra')}" />
                        
                            <g:sortableColumn property="precoDeVenda" title="${message(code: 'produto.precoDeVenda.label', default: 'Preco De Venda')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${produtoInstanceList}" status="i" var="produtoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${produtoInstance.id}">${fieldValue(bean: produtoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: produtoInstance, field: "carro")}</td>
                        
                            <td>${fieldValue(bean: produtoInstance, field: "descricao")}</td>
                        
                            <td>${fieldValue(bean: produtoInstance, field: "lucro")}</td>
                        
                            <td>${fieldValue(bean: produtoInstance, field: "precoDeCompra")}</td>
                        
                            <td>${fieldValue(bean: produtoInstance, field: "precoDeVenda")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${produtoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
