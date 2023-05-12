<%@page import = "com.crudjsp.dao.FuncionarioDAO"%>
<jsp:useBean id="f" class="com.crudjsp.bean.Funcionario"></jsp:useBean>
<jsp:setProperty property="*" name="f"/>

<%
	//UTILIZAÇÃO DO METODO SALVAR FUNCIONARIO
	int i = FuncionarioDAO.salvarFuncionario(f);
	if(i > 0){
		//TELA DE REGISTRO FEITO COM SUCESSO
		response.sendRedirect("addfuncionario-sucess.jsp");
	}else{
		//TELA DE REGISTRO NÃO REALIZADO
		response.sendRedirect("addfuncionario-error.jsp");
	}
%>