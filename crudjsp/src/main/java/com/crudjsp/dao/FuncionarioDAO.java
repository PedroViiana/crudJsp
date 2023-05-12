package com.crudjsp.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crudjsp.bean.Funcionario;
import com.mysql.jdbc.Driver;
import com.mysql.jdbc.PreparedStatement;

public class FuncionarioDAO {
	
	//METODO DE CONEXÃO COM O BANCO DE DADOS 
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudjsp","root","");
		}
		//EXCEÇÃO DE ERRO
		catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	//CRIAÇÃO DE METODO PARA SALVAR FUNCIONARIO
	public static int salvarFuncionario(Funcionario f) {
		//VARIAVEL VERIFICADORA
		int status = 0;
		try {
			//TAG DE CONEXÃO
			Connection con = getConnection();
			//INSERINDO OS REGISTROS NA TABELA FUNCIONARIO
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO funcionario (nome, setor, salario, email, idade) VALUES (?,?,?,?,?)");
			//RECEBENDO OS DADOS DO FORM
			ps.setString(1, f.getNome());
			ps.setString(2, f.getSetor());
			ps.setInt(3, f.getSalario());
			ps.setString(4, f.getEmail());
			ps.setInt(5, f.getIdade());
			status = ps.executeUpdate();
		}
		//EXCEÇÃO DE ERRO
		catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	

	//CRIAÇÃO DE METODO PARA BUSCAR ID FUNCIONARIOS
	public static Funcionario getRegistroById(int id){
		Funcionario funcionario = null;
		try {
			//TAG DE CONEXÃO
			Connection con = getConnection();
			//BUSCANDO TODOS OS REGISTROS DA TABELA FUNCIONARIO ONDE O ID É IGUAL AO NÚMERO RECEBIDO PELO FORM
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM funcionario WHERE id =?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			//RECEBENDO OS DADOS DO BANCO REFENTE AO ID FORNECIDO
			while(rs.next()) {
				funcionario = new Funcionario();
				funcionario.setId(rs.getInt("id"));
				funcionario.setNome(rs.getString("nome"));
				funcionario.setSetor(rs.getString("setor"));
				funcionario.setSalario(rs.getInt("salario"));
				funcionario.setEmail(rs.getString("email"));
				funcionario.setIdade(rs.getInt("idade"));
			}
		//EXCEÇÃO DE ERRO
		}catch (Exception e) {
			System.out.println(e);
		}
		return funcionario;
	}
	
	//CRIAÇÃO DE METODO PARA ALTERAR FUNCIONARIOS
	public static int updateFuncionario(Funcionario f) {
		//VARIAVEL VERIFICADORA
		int status = 0;
		try {
			//TAG DE CONEXÃO
			Connection con = getConnection();
			//ALTERANDO OS REGISTROS DA TABELA FUNCIONARIO
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE funcionario SET nome=?, setor=?, salario=?, email=?, idade=? WHERE id=?");
			//ALTERANDO OS DADOS DO FORM
			ps.setString(1, f.getNome());
			ps.setString(2, f.getSetor());
			ps.setInt(3, f.getSalario());
			ps.setString(4, f.getEmail());
			ps.setInt(5, f.getIdade());
			ps.setInt(6, f.getId());
			status = ps.executeUpdate();
		}
		//EXCEÇÃO DE ERRO
		catch (Exception e) {
			System.out.println(e);
		}return status;
	}
	
	//CRIAÇÃO DE METODO PARA EXCLUIR FUNCIONARIOS
	public static int deleteFuncionario(Funcionario f) {
		//VARIAVEL VERIFICADORA
		int status = 0;
		try {
			//TAG DE CONEXÃO
			Connection con = getConnection();
			//DELETANDO OS REGISTROS DA TABELA FUNCIONARIO ONDE O ID É IGUAL AO NÚMERO RECEBIDO PELO FORM
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("DELETE FROM funcionario WHERE id=? ");
			ps.setInt(1, f.getId());
			status = ps.executeUpdate();	
		}
		//EXCEÇÃO DE ERRO
		catch (Exception e) {
			System.out.println(e);
		}return status;
	}
	
	//CRIAÇÃO DE METODO PARA LISTAR FUNCIONARIOS
	public static List<Funcionario> getAllFuncionario(){
		//CRIAÇÃO DE LISTA PARA ARMAZENAR FUNCIONARIOS DO BANCO DE DADOS
		List<Funcionario> list = new ArrayList<Funcionario>();	
		try {
			//TAG DE CONEXÃO
			Connection con = getConnection();
			//BUSCANDO TODOS OS REGISTROS DA TABELA FUNCIONARIO
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM funcionario");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Funcionario funcionario = new Funcionario();
				funcionario.setId(rs.getInt("id"));
				funcionario.setNome(rs.getString("nome"));
				funcionario.setSetor(rs.getString("setor"));
				funcionario.setSalario(rs.getInt("salario"));
				funcionario.setEmail(rs.getString("email"));
				funcionario.setIdade(rs.getInt("idade"));
				list.add(funcionario);
			}
		//EXCEÇÃO DE ERRO
		}catch (Exception e) {
			System.out.println(e);
		} 
	return list;
}
}