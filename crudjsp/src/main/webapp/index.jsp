
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Cache-Control" content="no-store" />
		<link rel="shortcut icon" href="img/favicon.ico"/>
		<title>Funcionários</title>
		<!-- IMPORTANDO BOOTSTRAP -->
		<link href="${contextPath}css/bootstrap.min.css" rel="stylesheet">
		<link href="css/index.css" rel="stylesheet">
	</head>
	<body>
		<!-- IMPORTANDO OBJETO FUNCIONARIO E METODOS -->
		<%@ page import="com.crudjsp.dao.FuncionarioDAO, com.crudjsp.bean.*, java.util.*"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	  	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
		 <div class="container-fluid table">
		 <br>
		 <h2>Lista dos Funcionários</h2>
		 	<div class="box">
			<!-- UTLIZANDO METODO GETALLFUNCIONARIO PARA EXIBIR A LISTA DE FUNCIONARIOS EXISTENTES NO BANCO DE DADOS -->
		 	<%
			 	List<Funcionario> list = FuncionarioDAO.getAllFuncionario();
			 	request.setAttribute("list", list);
			 %>
		 
		 	<table>
				  <tr>
					<th>Nome</th>
					<th>Setor</th>
					<th>Salário</th>
					<th>Email</th>
					<th>Idade</th>
					<th>Editar</th>
					<th>Excluir</th>
				  </tr>
				  
				  <c:forEach items="${list}" var="funcionario">
				  
				  <tr>
				  <!-- NA METODO getAllFuncionario(), TEMOS O OBEJTO FUNCIONARIO, ONDE ARMAZENA TODOS OS REGISTROS DO FUNCIONARIO-->
				  <!-- OBTENDO OS DADOS ATRAVÉS DO .GET NO DO OBJETO FUNCIONARIO-->
				  	<td>${funcionario.getNome()}</td>
				  	<td>${funcionario.getSetor()}</td>
				  	<td>${funcionario.getSalario()}</td>
				  	<td>${funcionario.getEmail()}</td>
				  	<td>${funcionario.getIdade()}</td>
				  	
				  	<!-- REDIRECIONANDO PARA PAGINA DE EDIÇÃO, FORNCENDO O NÚMERO DO ID CLICADO-->
				  	<td><a href="editar.jsp?id=${funcionario.getId()}"><img src="img/lapis.png" width="40" height="40"/></a></td>
				  	
				  	<!-- REDIRECIONANDO PARA PAGINA DE EXCLUSÃO, FORNCENDO O NÚMERO DO ID CLICADO-->
				  	 <td><a href="excluir.jsp?id=${funcionario.getId()}"><img src="img/excluir.png" width="40" height="40" /></a></td>
				  
				  	
				  </tr>
				  </c:forEach>
			</table>
				<br>
				<!-- REDIRECIONANDO PARA PAGINA DE CADASTRO-->
		 	</div>
		 	<a href="cadastrar.jsp" class="botao" style="text-decoration:none"><button type="submit" class="btn btn-dark" >Cadastro de funcionário</button></a>
		 </div>
	</body>
</html>