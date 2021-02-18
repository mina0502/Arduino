package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.PersonDto;

public class PersonDao {
	
	private static PersonDao instance= new PersonDao();
	
	public PersonDao() {
	}
	
	public static PersonDao getInstance() {
		return instance;
	}
	
	//DB ���� �ڵ�
	
	private Connection getConnection() throws Exception {
		
		Context context = new InitialContext();
		DataSource dataSource= (DataSource)context.lookup("java:comp/env/"+"jdbc/dbconn");
		Connection conn= dataSource.getConnection();
		System.out.println("DBCP���� �Ϸ�");
		
		return conn;
	}
	
	//ȸ������Ʈ�� DB�� �����ؼ� �������� �޼���
	public ArrayList<PersonDto> personsAll(){
		ArrayList<PersonDto> dtos=new ArrayList<>();
		Connection connection=null;
		PreparedStatement pstmt=null;
		ResultSet resultSet=null;
		String sql = "select * from person";
		
		try {
			connection=this.getConnection();
			pstmt=connection.prepareStatement(sql);
			resultSet=pstmt.executeQuery();
			
			System.out.println("personAll()");
			
			while(resultSet.next())
			{
				PersonDto dto= new PersonDto();
				dto.setId(resultSet.getString("id"));
				dto.setPw(resultSet.getString("pw"));
				dto.setName(resultSet.getString("name"));
				dto.setEmail(resultSet.getString("email"));
				dto.setAddress(resultSet.getString("address"));
				
				//������ ���鼭 ������ PersonDto ��ü�� ArrayList�� �߰��� �ϰ� ����
				dtos.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				resultSet.close();
				pstmt.close();
				connection.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}
	//ȸ�� ���� �޼���
	public boolean personInsert() {
		return true;
	}
}
