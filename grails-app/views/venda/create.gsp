

<%@ page import="centercarservice.Venda" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="Pagina Inicial"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="Exibir Vendas" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Cadastrar Vendas" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${vendaInstance}">
            <div class="errors">
                <g:renderErrors bean="${vendaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cliente"><g:message code="venda.cliente.label" default="Cliente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendaInstance, field: 'cliente', 'errors')}">
                                    <g:select name="cliente.id" from="${centercarservice.Cliente.list()}" optionKey="id" value="${vendaInstance?.cliente?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDoServico"><g:message code="venda.dataDoServico.label" default="Data Do Servico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendaInstance, field: 'dataDoServico', 'errors')}">
                                    <g:datePicker name="dataDoServico" precision="day" value="${vendaInstance?.dataDoServico}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="produto"><g:message code="venda.produto.label" default="Produto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendaInstance, field: 'produto', 'errors')}">
                                    <g:select name="produto.id" from="${centercarservice.Produto.list()}" optionKey="id" value="${vendaInstance?.produto?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="servico"><g:message code="venda.servico.label" default="Servico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendaInstance, field: 'servico', 'errors')}">
                                    <g:select name="servico.id" from="${centercarservice.Servico.list()}" optionKey="id" value="${vendaInstance?.servico?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoDePagamento"><g:message code="venda.tipoDePagamento.label" default="Tipo De Pagamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendaInstance, field: 'tipoDePagamento', 'errors')}">
                                    <g:select name="tipoDePagamento" from="${centercarservice.TipoDePagamento?.values()}" keys="${centercarservice.TipoDePagamento?.values()*.name()}" value="${vendaInstance?.tipoDePagamento?.name()}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vendedor"><g:message code="venda.vendedor.label" default="Vendedor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendaInstance, field: 'vendedor', 'errors')}">
                                    <g:select name="vendedor.id" from="${centercarservice.Funcionario.list()}" optionKey="id" value="${vendaInstance?.vendedor?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Confirmar Venda" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
