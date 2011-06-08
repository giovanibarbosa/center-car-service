

<%@ page import="centercarservice.financeiro.Venda" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
        <title>Cadastrar Venda</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Pagina Inicial</a></span>
            <span class="menuButton"><g:link class="list" action="list">Vendas Cadastradas</g:link></span>
        </div>
        <div class="body">
            <h1>Cadastrar Venda</h1>
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
                                    <label for="funcionario"><g:message code="venda.funcionario.label" default="Funcionario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendaInstance, field: 'funcionario', 'errors')}">
                                    <g:select name="funcionario.id" from="${centercarservice.cadastro.Funcionario.list()}" optionKey="id" value="${vendaInstance?.funcionario?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cliente"><g:message code="venda.cliente.label" default="Cliente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendaInstance, field: 'cliente', 'errors')}">
                                    <g:select name="cliente.id" from="${centercarservice.cadastro.Cliente.list()}" optionKey="id" value="${vendaInstance?.cliente?.id}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDaVenda"><g:message code="venda.dataDaVenda.label" default="Data Da Venda" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendaInstance, field: 'dataDaVenda', 'errors')}">
                                    <g:datePicker name="dataDaVenda" precision="day" value="${vendaInstance?.dataDaVenda}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoDePagamento"><g:message code="venda.tipoDePagamento.label" default="Tipo De Pagamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendaInstance, field: 'tipoDePagamento', 'errors')}">
                                    <g:select name="tipoDePagamento" from="${vendaInstance.constraints.tipoDePagamento.inList}" value="${vendaInstance?.tipoDePagamento}" valueMessagePrefix="venda.tipoDePagamento"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="taxaDeDesconto"><g:message code="venda.taxaDeDesconto.label" default="Taxa De Desconto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendaInstance, field: 'taxaDeDesconto', 'errors')}">
                                    <g:textField name="taxaDeDesconto" value="${fieldValue(bean: vendaInstance, field: 'taxaDeDesconto')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="produtos"><g:message code="venda.produtos.label" default="Produtos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendaInstance, field: 'produtos', 'errors')}">
                                    <g:select name="produtos" from="${centercarservice.estoque.Produto.findAllByVendidoNotEqual('sim')}" multiple="yes" optionKey="id" size="10" value="${vendaInstance?.produtos*.id}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'Cadastrar', default: 'Cadastrar')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
