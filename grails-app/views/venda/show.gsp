
<%@ page import="centercarservice.financeiro.Venda" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
        <title>Informacoes da Venda</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Inicial</a></span>
            <span class="menuButton"><g:link class="list" action="list">Vendas Cadastradas</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Cadastrar Nova Venda</g:link></span>
        </div>
        <div class="body">
            <h1>Informacoes da Venda</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="venda.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: vendaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="venda.funcionario.label" default="Funcionario" /></td>
                            
                            <td valign="top" class="value"><g:link controller="funcionario" action="show" id="${vendaInstance?.funcionario?.id}">${vendaInstance?.funcionario?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="venda.cliente.label" default="Cliente" /></td>
                            
                            <td valign="top" class="value"><g:link controller="cliente" action="show" id="${vendaInstance?.cliente?.id}">${vendaInstance?.cliente?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="venda.dataDaVenda.label" default="Data Da Venda" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${vendaInstance?.dataDaVenda}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="venda.tipoDePagamento.label" default="Tipo De Pagamento" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: vendaInstance, field: "tipoDePagamento")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="venda.taxaDeDesconto.label" default="Taxa De Desconto" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: vendaInstance, field: "taxaDeDesconto")}</td>
                            
                        </tr>
                    
                       
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="venda.produtos.label" default="Produtos" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${vendaInstance.produtos}" var="p">
                                    <li><g:link controller="produto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${vendaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'Alterar', default: 'Alterar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Remover', default: 'Remover')}" onclick="return confirm('${message(code: 'Tem Certeza?', default: 'Tem Certeza?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
