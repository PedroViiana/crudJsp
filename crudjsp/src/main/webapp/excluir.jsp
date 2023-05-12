<%@ page import="com.crudjsp.dao.FuncionarioDAO, java.util.*"%>
<jsp:useBean id="f" class="com.crudjsp.bean.Funcionario"></jsp:useBean>
<jsp:setProperty property="*" name="f"/>

<%
	int i = FuncionarioDAO.deleteFuncionario(f);
	response.sendRedirect("index.jsp");
%>
