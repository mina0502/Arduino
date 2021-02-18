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
	
	//DB 접속 코드
	
	private Connection getConnection() throws Exception {
		
		Context context = new InitialContext();
		DataSource dataSource= (DataSource)context.lookup("java:comp/env/"+"jdbc/dbconn");
		Connection conn= dataSource.getConnection();
		System.out.println("DBCP연동 완료");
		
		return conn;
	}
	
	//회원리스트를 DB에 접속해서 가져오는 메서드
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
				
				//루프를 돌면서 생성된 PersonDto 객체를 ArrayList에 추가를 하고 있음
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
	//회원 삽입 메서드
	public boolean personInsert() {
		return true;
	}
}
