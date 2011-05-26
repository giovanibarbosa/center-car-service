
<%@ page import="centercarservice.financeiro.PagamentoAVista" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pagamentoAVista.label', default: 'PagamentoAVista')}" />
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
                            <td valign="top" class="name"><g:message code="pagamentoAVista.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: pagamentoAVistaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pagamentoAVista.valor.label" default="Valor" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: pagamentoAVistaInstance, field: "valor")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pagamentoAVista.dataDoVencimento.label" default="Data Do Vencimento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${pagamentoAVistaInstance?.dataDoVencimento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pagamentoAVista.dataDoRecebimento.label" default="Data Do Recebimento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${pagamentoAVistaInstance?.dataDoRecebimento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pagamentoAVista.venda.label" default="Venda" /></td>
                            
                            <td valign="top" class="value"><g:link controller="venda" action="show" id="${pagamentoAVistaInstance?.venda?.id}">${pagamentoAVistaInstance?.venda?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pagamentoAVista.servico.label" default="Servico" /></td>
                            
                            <td valign="top" class="value"><g:link controller="servico" action="show" id="${pagamentoAVistaInstance?.servico?.id}">${pagamentoAVistaInstance?.servico?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${pagamentoAVistaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
