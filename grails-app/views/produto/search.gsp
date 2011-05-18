<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;
			charset=UTF-8" />
		<meta name="layout" content="main" />
		<title>Pesquisar por Produtos</title>
	</head>
	<body>
		<div class="body">
			<h1>Pesquisar por Produtos</h1>
			<g:if test="${flash.message}">
				<div class="message">
				${flash.message}
				</div>
			</g:if>
			<g:form action="search" method="post">
				<div class="dialog">
					<table>
						<tr class='prop'>
							<td valign='top' class='Produto'><label for='descricao'>Descricao:</label>
							</td>
							<td valign='top' class='value'><input type="text"
								maxlength='30' name='descricao'> </input>
							</td>
						</tr>
					</table>
				</div>
				<div class="buttons">
					<input type="submit" value="Search" class="formbutton"> </input>
				</div>
			</g:form>
		</div>
	</body>
</html>