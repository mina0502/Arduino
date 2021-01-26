<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB데이터 수정</title>
</head>
<body>
<%@include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String username= request.getParameter("username");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql="select id,pw from members where id=? ";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			
			if(rs.next())
			{
				String rId=rs.getString("id");
				String rPw=rs.getString("pw");
				if(id.equals(rId) && pw.equals(rPw))
				{
					
					sql="update members set username=? where id=?";
					if(pstmt!=null)
						pstmt.close();
					pstmt=connection.prepareStatement(sql);
					pstmt.setString(1, username);
					pstmt.setString(2, id);
					pstmt.executeUpdate();
					out.println(rId +"님의 정보가 수정되었습니다<br/>");
				}
				else	
				{
					out.println("ID와 PW를 확인해주세요<br/>");
				}
			}
			else{
				out.println("일치하는 ID가 없습니다<br/>");
			}
			
		}
		catch(SQLException e){
			out.println("SQLException : "+e.getMessage());
		}
		finally{
			if(rs !=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(connection !=null)
				connection.close();
		}
		%>
		<br/>
		<a href="select_preparestatement.jsp"><button>리스트 보기</button></a>&nbsp;&nbsp;&nbsp;
		<a href="insert_form_preparestatement.jsp"><button>회원가입창으로 가기</button></a>
</body>
</html>