package DAO; /*Data Acess Object
(Objeto de Acesso a Dados) do Produto */

import java.sql.SQLException;
import java.util.List;

import javax.swing.JOptionPane;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Model.Produto; //Importação do Produto

public class ProdutoDao {
	
	private Connection connection;
	
	public ProdutoDao() { //Construtor(O mesmo nome da classe)
		this.connection = new ConectionFactory().getConnection();
		//Gera conexão com o banco toda vez que se instacia um objeto
	}
	
	//ADICIONAR Categoria Produto Banco De Dados
	public void adicionarCategoriaProduto(Produto categoriaProduto) throws SQLException {
		try {
			String sql = "insert into tbCategoriaProduto"+
				"(nomeCategoriaProduto)"+
				"values (?)";
			
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, categoriaProduto.getNomeCategoriaProduto());
			stmt.execute();
			stmt.close();
			JOptionPane.showMessageDialog(null,"Categoria Produto Cadastrado Com Sucesso");
		} 
		catch(SQLException e) {
			System.out.println("Erro ao registrar Categoria Produto: "+e);
		}
		finally {
			connection.close();
		}
	}
	
	//ADICIONAR Produto Banco De Dados
	public void adicionarProduto(Produto produto) throws SQLException {
		try {
			String sql = "insert into tbProduto"+
				"(nomeProduto, valorProduto, quantidadeProduto, categoriaProduto_id)"+
				"values (?, ?, ?, ?)";
			
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, produto.getNomeProduto());
			stmt.setDouble(2, produto.getValorProduto());
			stmt.setInt(3, produto.getQuantidadeProduto());
			stmt.setInt(4, produto.getIdCategoriaProduto());
			stmt.execute();
			stmt.close();
			JOptionPane.showMessageDialog(null,"Produto Cadastrado Com Sucesso");
		} 
		catch(SQLException e) {
			System.out.println("Erro ao registrar Produto: "+e);
		}
		finally {
			connection.close();
		}
	}
	
	//CONSULTA tbCategoriaProduto
		public List<Produto> getListaCategoria() throws SQLException{
			try {
				List<Produto> categoriaProdutos = new ArrayList<Produto>(); //Define a Lista
				
				PreparedStatement stmt = this.connection.prepareStatement("select * from tbCategoriaProduto"); //Prepara a instrução MySQL
				ResultSet rs = stmt.executeQuery(); //Armazena e Executa instrução em RS
				
				while(rs.next()) { // Busca todos o objetos armazenados no BD
					Produto categoriaProduto = new Produto();
					categoriaProduto.setIdCategoriaProduto(rs.getInt(1)); //Id Categoria
					categoriaProduto.setNomeCategoriaProduto(rs.getString(2)); //Nome Categoria

					categoriaProdutos.add(categoriaProduto); //Cria um objeto para cada produto buscado
				}	
				rs.close();
				stmt.close();	
				return categoriaProdutos;
			} 
			catch(SQLException e) {
				throw new RuntimeException("Erro ao consultar tabela", e);
			}
			finally {
				connection.close();
			}
		}
		//CONSULTA tbProduto
		public List<Produto> getListaProduto() throws SQLException{
			try {
				List<Produto> produtos = new ArrayList<Produto>(); //Define a Lista
				
				PreparedStatement stmt = this.connection.prepareStatement("select * from tbProduto"); //Prepara a instrução MySQL
				ResultSet rs = stmt.executeQuery(); //Armazena e Executa instrução em RS
				
				while(rs.next()) { // Busca todos o objetos armazenados no BD
					Produto produto = new Produto();
					produto.setNomeProduto(rs.getString(2)); //Nome Produto
					produto.setValorProduto(rs.getDouble(3)); //Valor Produto
					produto.setQuantidadeProduto(rs.getInt(4)); //Quantidade Produto
					produto.setIdCategoriaProduto(rs.getInt(5)); //Id Categoria

					produtos.add(produto); //Cria um objeto para cada produto buscado
				}	
				rs.close();
				stmt.close();	
				return produtos;
			} 
			catch(SQLException e) {
				throw new RuntimeException("Erro ao consultar tabela", e);
			}
			finally {
				connection.close();
			}
		}
	
	//UPDATE Banco De Dados
	public void alterar(Produto produto) throws SQLException{
		String sql = "update tbProduto set produto = ? , produtoValor = ? where idProduto = ?";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, produto.getProduto());
			stmt.setDouble(2, produto.getValorProduto());
			stmt.setInt(3, produto.getIdProduto());
			
			stmt.execute();
			stmt.close();
			System.out.println("Dados Alterados Com Sucesso");
		}
		catch(SQLException e) {
			throw new RuntimeException("Erro ao dar update na tabela", e);
		}
		finally {
			connection.close();
		}
	}
	
	//Exclusão Banco De Dados
	public void excluir(Produto produto) throws SQLException{
		
		String sql = "delete from tbProduto where idProduto = ?";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, produto.getIdProduto());
			stmt.execute();
			stmt.close();
			System.out.println("Dados excluidos com sucesso");
		}
		catch(SQLException e) {
			throw new RuntimeException("Erro ao excluir tabela", e);
		}
		finally {
			connection.close();
		}
	}
}
