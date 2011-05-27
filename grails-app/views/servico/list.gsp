
<%@ page import="centercarservice.financeiro.Servico" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'servico.label', default: 'Servico')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'servico.id.label', default: 'Id')}" />
                        
                            <th><g:message code="servico.carro.label" default="Carro" /></th>
                        
                            <g:sortableColumn property="descricao" title="${message(code: 'servico.descricao.label', default: 'Descricao')}" />
                        
                            <g:sortableColumn property="dataDoServico" title="${message(code: 'servico.dataDoServico.label', default: 'Data Do Servico')}" />
                        
                            <g:sortableColumn property="observacoes" title="${message(code: 'servico.observacoes.label', default: 'Observacoes')}" />
                        
                            <g:sortableColumn property="formaDePagamento" title="${message(code: 'servico.formaDePagamento.label', default: 'Forma De Pagamento')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${servicoInstanceList}" status="i" var="servicoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${servicoInstance.id}">${fieldValue(bean: servicoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: servicoInstance, field: "carro")}</td>
                        
                            <td>${fieldValue(bean: servicoInstance, field: "descricao")}</td>
                        
                            <td><g:formatDate date="${servicoInstance.dataDoServico}" /></td>
                        
                            <td>${fieldValue(bean: servicoInstance, field: "observacoes")}</td>
                        
                            <td>${fieldValue(bean: servicoInstance, field: "formaDePagamento")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${servicoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
