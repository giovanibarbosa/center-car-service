
<%@ page import="centercarservice.financeiro.Servico" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'servico.label', default: 'Servico')}" />
        <title>Informaocoes do Servico</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Inicial</a></span>
            <span class="menuButton"><g:link class="list" action="list">Servicos Cadastrados</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Cadastrar Novo Servico</g:link></span>
        </div>
        <div class="body">
            <h1>Informacoes do Servico</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="servico.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: servicoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="servico.carro.label" default="Carro" /></td>
                            
                            <td valign="top" class="value"><g:link controller="carro" action="show" id="${servicoInstance?.carro?.id}">${servicoInstance?.carro?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="servico.descricao.label" default="Descricao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: servicoInstance, field: "descricao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="servico.dataDoServico.label" default="Data Do Servico" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${servicoInstance?.dataDoServico}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="servico.observacoes.label" default="Observacoes" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: servicoInstance, field: "observacoes")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="servico.formaDePagamento.label" default="Forma De Pagamento" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: servicoInstance, field: "formaDePagamento")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="servico.valorDaMaoDeObra.label" default="Valor Da Mao De Obra" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: servicoInstance, field: "valorDaMaoDeObra")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="servico.taxaDeDesconto.label" default="Taxa De Desconto" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: servicoInstance, field: "taxaDeDesconto")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="servico.produtos.label" default="Produtos" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${servicoInstance.produtos}" var="p">
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
                    <g:hiddenField name="id" value="${servicoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'Alterar', default: 'Alterar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Remover', default: 'Remover')}" onclick="return confirm('${message(code: 'Tem Certeza?', default: 'Tem Certeza?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
