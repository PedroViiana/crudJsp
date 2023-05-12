<%@ page import="com.crudjsp.dao.FuncionarioDAO, com.crudjsp.bean.*, java.util.*"%>
<jsp:useBean id="f" class="com.crudjsp.bean.Funcionario"></jsp:useBean>
<jsp:setProperty property="*" name="f"/>

<%
	int i = FuncionarioDAO.updateFuncionario(f);
	response.sendRedirect("index.jsp");
%>
