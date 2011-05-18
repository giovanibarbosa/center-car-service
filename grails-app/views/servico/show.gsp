
<%@ page import="centercarservice.financeiro.Servico" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'servico.label', default: 'Servico')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
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
                            <td valign="top" class="name"><g:message code="servico.descricao.label" default="Descricao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: servicoInstance, field: "descricao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="servico.dataDoServico.label" default="Data Do Servico" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${servicoInstance?.dataDoServico}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="servico.dataDeVencimento.label" default="Data De Vencimento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${servicoInstance?.dataDeVencimento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="servico.dataDePagamento.label" default="Data De Pagamento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${servicoInstance?.dataDePagamento}" /></td>
                            
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
                            <td valign="top" class="name"><g:message code="servico.quitado.label" default="Quitado" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${servicoInstance?.quitado}" /></td>
                            
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
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="servico.valor.label" default="Valor" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: servicoInstance, field: "valor")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${servicoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
