
<%@ page import="centercarservice.cadastro.Cliente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title>Clientes Cadastrados</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Principal</a></span>
            <span class="menuButton"><g:link class="create" action="create">Cadastrar Novo Cliente</g:link></span>
        </div>
        <div class="body">
            <h1>Clientes Cadastrados</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'cliente.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'cliente.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="cpf" title="${message(code: 'cliente.cpf.label', default: 'Cpf')}" />
                        
                            <g:sortableColumn property="rg" title="${message(code: 'cliente.rg.label', default: 'Rg')}" />
                        
                            <g:sortableColumn property="dataDeNascimento" title="${message(code: 'cliente.dataDeNascimento.label', default: 'Data De Nascimento')}" />
                        
                            <g:sortableColumn property="telefone" title="${message(code: 'cliente.telefone.label', default: 'Telefone')}" />
                            
                            <g:sortableColumn property="endereco" title="${message(code: 'cliente.endereco.label', default: 'Endereco')}" />
                            
                            <g:sortableColumn property="email" title="${message(code: 'e-mail', default: 'e-mail')}" />
                            
                            <g:sortableColumn property="observacoes" title="${message(code: 'Observacoes', default: 'Observacoes')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${clienteInstance.id}">${fieldValue(bean: clienteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "cpf")}</td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "rg")}</td>
                        
                            <td><g:formatDate date="${clienteInstance.dataDeNascimento}" /></td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "telefone")}</td>
                            
                            <td>${fieldValue(bean: clienteInstance, field: "endereco")}</td>
                            
                            <td>${fieldValue(bean: clienteInstance, field: "email")}</td>
                            
                            <td>${fieldValue(bean: clienteInstance, field: "observacoes")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${clienteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
