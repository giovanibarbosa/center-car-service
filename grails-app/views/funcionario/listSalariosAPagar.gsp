
<%@ page import="centercarservice.cadastro.Funcionario"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'funcionario.label', default: 'Funcionario')}" />
<title><g:message code="default.list.label" args="[entityName]" />
</title>
</head>
<body>
	<div class="nav">
		<span class="menuButton"><a class="home"
			href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /> </a> </span> <span class="menuButton"><g:link
				class="create" action="create">
				<g:message code="default.new.label" args="[entityName]" />
			</g:link> </span>
	</div>
	<div class="body">
		<h1>
			<g:message code="Funcionarios com Salarios Atrasados" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<div class="list">
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="id"
							title="${message(code: 'funcionario.id.label', default: 'Id')}" />

						<g:sortableColumn property="nome"
							title="${message(code: 'funcionario.nome.label', default: 'Nome')}" />

						<g:sortableColumn property="salarios atrasados" title="Salarios Atrasados" />
						
						<g:sortableColumn property="valor total a ser pago" title="Valor Total a ser pago" />

					</tr>
				</thead>
				<tbody>
					<g:each in="${funcionariosInstanceList}" status="i"
						var="funcionarioInstance">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

							<td><g:link action="show" id="${funcionarioInstance.id}">
									${fieldValue(bean: funcionarioInstance, field: "id")}
								</g:link></td>

							<td>
								${fieldValue(bean: funcionarioInstance, field: "nome")}
							</td>
							<td>
								${funcionarioInstance.calculaSalariosAtrasados()}
							</td>
							<td>
								${funcionarioInstance.calculaValorTotalAtrasado()}
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
		<div class="paginateButtons">
			<g:paginate total="${funcionariosInstanceListTotal}" />
		</div>
	</div>
</body>
</html>
