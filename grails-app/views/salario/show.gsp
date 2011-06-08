
<%@ page import="centercarservice.financeiro.Salario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'salario.label', default: 'Salario')}" />
        <title>Salario de Funcionario</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Inicial</a></span>
            <span class="menuButton"><g:link class="list" action="list">Salarios de Funcionarios</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Cadastrar Novo Salario</g:link></span>
        </div>
        <div class="body">
            <h1>Salario de Funcionarios</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="salario.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salarioInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="salario.valorBase.label" default="Valor Base" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salarioInstance, field: "valorBase")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="salario.taxaDeComissao.label" default="Taxa De Comissao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salarioInstance, field: "taxaDeComissao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="salario.dataDeVencimento.label" default="Data De Vencimento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${salarioInstance?.dataDeVencimento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="salario.dataDePagamento.label" default="Data De Pagamento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${salarioInstance?.dataDePagamento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="salario.pago.label" default="Pago" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salarioInstance, field: "pago")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="salario.funcionario.label" default="Funcionario" /></td>
                            
                            <td valign="top" class="value"><g:link controller="funcionario" action="show" id="${salarioInstance?.funcionario?.id}">${salarioInstance?.funcionario?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${salarioInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'Alterar', default: 'Alterar')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'Remover', default: 'Remover')}" onclick="return confirm('${message(code: 'Tem Certeza?', default: 'Tem Certeza?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
