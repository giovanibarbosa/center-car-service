
<%@ page import="centercarservice.cadastro.Carro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'carro.label', default: 'Carro')}" />
        <title>Carros</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Principal</a></span>
            <span class="menuButton"><g:link class="create" action="create">Cadastrar</g:link></span>
        </div>
        <div class="body">
            <h1>Carros Cadastrados</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'carro.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'carro.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="ano" title="${message(code: 'carro.ano.label', default: 'Ano')}" />
                        
                            <g:sortableColumn property="motor" title="${message(code: 'carro.motor.label', default: 'Motor')}" />
                        
                            <g:sortableColumn property="cor" title="${message(code: 'carro.cor.label', default: 'Cor')}" />
                        
                            <g:sortableColumn property="placa" title="${message(code: 'carro.placa.label', default: 'Placa')}" />
                            
                            <g:sortableColumn property="tipoDeCombustivel" title="${message(code: 'carro.tipoDeCombustivel.label', default: 'Tipo de Combustivel')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${carroInstanceList}" status="i" var="carroInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${carroInstance.id}">${fieldValue(bean: carroInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: carroInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: carroInstance, field: "ano")}</td>
                        
                            <td>${fieldValue(bean: carroInstance, field: "motor")}</td>
                        
                            <td>${fieldValue(bean: carroInstance, field: "cor")}</td>
                        
                            <td>${fieldValue(bean: carroInstance, field: "placa")}</td>
                            
                            <td>${fieldValue(bean: carroInstance, field: "tipoDeCombustivel")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${carroInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
