<html>
    <head>
        <title>Center Car Service</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:280px;
            margin-right:20px;
        }
        </style>
    </head>
    <body>
        <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">
                    <h1 align="left"><a href="http://localhost:8080/CenterCarService/funcionario/list">Gerenciamento dos Funcionarios</a></h1>
                    <ul>
                        <li>App version: <g:meta name="app.version"></g:meta></li>
                        <li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
                        <li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                        <li>JVM version: ${System.getProperty('java.version')}</li>
                        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                    </ul>
                </div>
                <div class="panelBtm"></div>
            </div>
        </div>
        <div id="pageBody">
            <h1>Center Car</h1>
            <p>A Center Car e uma loja de autopecas e de servicos gerais em veiculos automotivos</p>

            <div id="controllerList" class="dialog">
                <h2>Gerenciamentos Disponiveis:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                    
                    <p><a href="http://localhost:8080/CenterCarService/caixa/index">Ver Caixa</a></p>                    
                    <!--<p><a href="http://localhost:8080/CenterCarService/cliente">Gerenciar Clientes</a></p>
                    <p><a href="http://localhost:8080/CenterCarService/produto">Gerenciar Estoque de Produtos</a></p>
                    <p><a href="http://localhost:8080/CenterCarService/venda">Gerenciar Vendas</a></p>-->
                    <p><a href="http://localhost:8080/CenterCarService/estoque/index">Gerenciar Estoque</a></p>
                    <p><a href="http://localhost:8080/CenterCarService/funcionario/listSalariosAPagar">Total em salarios a pagar</a></p>
                    
                </ul>
            </div>
        </div>
    </body>
</html>
