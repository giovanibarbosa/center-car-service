
<%@ page import="centercarservice.estoque.Produto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'produto.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="referencia" title="${message(code: 'produto.referencia.label', default: 'Referencia')}" />
                        
                            <g:sortableColumn property="descricao" title="${message(code: 'produto.descricao.label', default: 'Descricao')}" />
                        
                            <g:sortableColumn property="precoDeVenda" title="${message(code: 'produto.precoDeVenda.label', default: 'Preco De Venda')}" />
                        
                            <g:sortableColumn property="dataDaCompra" title="${message(code: 'produto.dataDaCompra.label', default: 'Data Da Compra')}" />
                        
                            <g:sortableColumn property="dataDePagamento" title="${message(code: 'produto.dataDePagamento.label', default: 'Data De Pagamento')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${produtoInstanceList}" status="i" var="produtoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${produtoInstance.id}">${fieldValue(bean: produtoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: produtoInstance, field: "referencia")}</td>
                        
                            <td>${fieldValue(bean: produtoInstance, field: "descricao")}</td>
                        
                            <td>${fieldValue(bean: produtoInstance, field: "precoDeVenda")}</td>
                        
                            <td><g:formatDate date="${produtoInstance.dataDaCompra}" /></td>
                        
                            <td><g:formatDate date="${produtoInstance.dataDePagamento}" /></td>
                        
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
