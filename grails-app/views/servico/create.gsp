

<%@ page import="centercarservice.financeiro.Servico" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'servico.label', default: 'Servico')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${servicoInstance}">
            <div class="errors">
                <g:renderErrors bean="${servicoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="carro"><g:message code="servico.carro.label" default="Carro" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: servicoInstance, field: 'carro', 'errors')}">
                                    <g:select name="carro.id" from="${centercarservice.cadastro.Carro.list()}" optionKey="id" value="${servicoInstance?.carro?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricao"><g:message code="servico.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: servicoInstance, field: 'descricao', 'errors')}">
                                    <g:textField name="descricao" value="${servicoInstance?.descricao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDoServico"><g:message code="servico.dataDoServico.label" default="Data Do Servico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: servicoInstance, field: 'dataDoServico', 'errors')}">
                                    <g:datePicker name="dataDoServico" precision="day" value="${servicoInstance?.dataDoServico}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="observacoes"><g:message code="servico.observacoes.label" default="Observacoes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: servicoInstance, field: 'observacoes', 'errors')}">
                                    <g:textArea name="observacoes" cols="40" rows="5" value="${servicoInstance?.observacoes}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="formaDePagamento"><g:message code="servico.formaDePagamento.label" default="Forma De Pagamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: servicoInstance, field: 'formaDePagamento', 'errors')}">
                                    <g:select name="formaDePagamento" from="${servicoInstance.constraints.formaDePagamento.inList}" value="${servicoInstance?.formaDePagamento}" valueMessagePrefix="servico.formaDePagamento"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="valorDaMaoDeObra"><g:message code="servico.valorDaMaoDeObra.label" default="Valor Da Mao De Obra" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: servicoInstance, field: 'valorDaMaoDeObra', 'errors')}">
                                    <g:textField name="valorDaMaoDeObra" value="${fieldValue(bean: servicoInstance, field: 'valorDaMaoDeObra')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="taxaDeDesconto"><g:message code="servico.taxaDeDesconto.label" default="Taxa De Desconto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: servicoInstance, field: 'taxaDeDesconto', 'errors')}">
                                    <g:textField name="taxaDeDesconto" value="${fieldValue(bean: servicoInstance, field: 'taxaDeDesconto')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="produtos"><g:message code="servico.produtos.label" default="Produtos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: servicoInstance, field: 'produtos', 'errors')}">
                                    <g:select name="produtos" from="${centercarservice.estoque.Produto.findAllByVendidoNotEqual('sim')}" multiple="yes" optionKey="id" size="10" value="${servicoInstance?.produtos*.id}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
