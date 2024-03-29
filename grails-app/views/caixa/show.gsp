
<%@ page import="centercarservice.financeiro.Caixa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'caixa.label', default: 'Caixa')}" />
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
                            <td valign="top" class="name"><g:message code="caixa.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caixaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caixa.contasAPagar.label" default="Contas AP agar" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caixaInstance, field: "contasAPagar")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caixa.contasAReceber.label" default="Contas AR eceber" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caixaInstance, field: "contasAReceber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caixa.totalAReceberEmServicos.label" default="Total AR eceber Em Servicos" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caixaInstance, field: "totalAReceberEmServicos")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caixa.totalAReceberEmVendas.label" default="Total AR eceber Em Vendas" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caixaInstance, field: "totalAReceberEmVendas")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caixa.totalEmServicos.label" default="Total Em Servicos" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caixaInstance, field: "totalEmServicos")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caixa.totalRecebidoEmServicos.label" default="Total Recebido Em Servicos" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caixaInstance, field: "totalRecebidoEmServicos")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caixa.totalRecebidoEmVendas.label" default="Total Recebido Em Vendas" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caixaInstance, field: "totalRecebidoEmVendas")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caixa.totalSalariosAPagar.label" default="Total Salarios AP agar" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caixaInstance, field: "totalSalariosAPagar")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caixa.totalVendido.label" default="Total Vendido" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caixaInstance, field: "totalVendido")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${caixaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
