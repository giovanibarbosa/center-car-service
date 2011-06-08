
<%@ page import="centercarservice.cadastro.Carro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'carro.label', default: 'Carro')}" />
        <title>Informacoes do Carro</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Principal</a></span>
            <span class="menuButton"><g:link class="list" action="list">Carros Cadastrados</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Cadastrar Novo Carro</g:link></span>
        </div>
        <div class="body">
            <h1>Informacoes do Carro</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="carro.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: carroInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="carro.nome.label" default="Nome" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: carroInstance, field: "nome")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="carro.ano.label" default="Ano" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: carroInstance, field: "ano")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="carro.motor.label" default="Motor" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: carroInstance, field: "motor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="carro.cor.label" default="Cor" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: carroInstance, field: "cor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="carro.placa.label" default="Placa" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: carroInstance, field: "placa")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="carro.tipoDeCombustivel.label" default="Tipo De Combustivel" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: carroInstance, field: "tipoDeCombustivel")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="carro.cliente.label" default="Cliente" /></td>
                            
                            <td valign="top" class="value"><g:link controller="cliente" action="show" id="${carroInstance?.cliente?.id}">${carroInstance?.cliente?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="carro.servicos.label" default="Servicos" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${carroInstance.servicos}" var="s">
                                    <li><g:link controller="servico" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${carroInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'Alterar', default: 'Alterar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Remover', default: 'Remover')}" onclick="return confirm('${message(code: 'Tem certeza?', default: 'Tem certeza?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
