<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Funcionário </title>
	<link href="${contextPath}css/bootstrap.min.css" rel="stylesheet">
	<link href="css/index.css" rel="stylesheet">
</head>
<body>
 <%@ page import="com.crudjsp.dao.FuncionarioDAO, com.crudjsp.bean.*, java.util.*"%>

		<%
			String id = request.getParameter("id");
			Funcionario funcionario = FuncionarioDAO.getRegistroById(Integer.parseInt(id));
		%>
		
		<div class="container-fluid table" >
		<br>
		<h2>Editar Funcionário</h2>
		
		<form action="editarfuncionario.jsp" method="post">
			<div class="form-group">
			<div class="box">
			  <input type="hidden" class="form-control" name="id" value="<%=funcionario.getId()%>">
			  
			  <table>
			  	<tr>
			  		<td>Nome:</td>
			  		<td><input type="text" class="form-control" name="nome" value="<%=funcionario.getNome()%>"></td>
			  	</tr>
			  	<tr>
			  		<td>Setor:</td>
			  		<td><input type="text" class="form-control" name="setor" value="<%=funcionario.getSetor()%>"></td>
			  	</tr>
			  	<tr>
			  		<td>Salario:</td>
			  		<td><input type="number" class="form-control" name="salario" value="<%=funcionario.getSalario()%>"></td>
			  	</tr>
			  	
			  	<tr>
			  		<td>E-mail:</td>
			  		<td><input type="email" class="form-control" name="email" value="<%=funcionario.getEmail()%>"></td>
			  	</tr>
			  	
			  	<tr>
			  		<td>Idade:</td>
			  		<td><input type="number" class="form-control" name="idade" value="<%=funcionario.getIdade()%>"></td>
			  	</tr>
			  	
			  	<tr>
				<td><input type="submit" class="btn btn-dark" value="Editar Funcionário"></input></td>
				<td><a href="index.jsp"><button type="submit" class="btn btn-dark">Voltar</button></a></td>
			  	</tr>	
				  	
			  </table>
			 	
			</div>
			 </div>
		</form>	
		
	</div>
</body>
</html>





