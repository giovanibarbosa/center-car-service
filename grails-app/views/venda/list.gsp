
<%@ page import="centercarservice.financeiro.Venda" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
        <title>Vendas Cadastradas</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Inicial</a></span>
            <span class="menuButton"><g:link class="create" action="create">Cadastrar Nova Venda</g:link></span>
        </div>
        <div class="body">
            <h1>Vendas Cadastradas</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'venda.id.label', default: 'Id')}" />
                        
                            <th><g:message code="venda.funcionario.label" default="Funcionario" /></th>
                        
                            <th><g:message code="venda.cliente.label" default="Cliente" /></th>
                            
                            <g:sortableColumn property="dataDaVenda" title="${message(code: 'servico.dataDaVenda.label', default: 'Data Da Venda')}" />
                        
                            <g:sortableColumn property="tipoDePagamento" title="${message(code: 'venda.tipoDePagamento.label', default: 'Tipo De Pagamento')}" />
                        
                            <g:sortableColumn property="taxaDeDesconto" title="${message(code: 'venda.taxaDeDesconto.label', default: 'Taxa De Desconto')}" />
                                                
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${vendaInstanceList}" status="i" var="vendaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${vendaInstance.id}">${fieldValue(bean: vendaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: vendaInstance, field: "funcionario")}</td>
                        
                            <td>${fieldValue(bean: vendaInstance, field: "cliente")}</td>
                            
                            <td><g:formatDate date="${vendaInstance.dataDaVenda}" /></td>
                        
                            <td>${fieldValue(bean: vendaInstance, field: "tipoDePagamento")}</td>
                        
                            <td>${fieldValue(bean: vendaInstance, field: "taxaDeDesconto")}</td>
                                                
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${vendaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
