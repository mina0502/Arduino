package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PersonDao;
import dto.PersonDto;

public class PersonListService implements Service {

	@Override
	public ArrayList<PersonDto> execute(HttpServletRequest request, HttpServletResponse response) {
		//Dao 객체를 얻음
		PersonDao dao = PersonDao.getInstance();
		
		//DB에 있는 person테이블에 있는 데이터를 다 ArrayList<PersonDto>에 저장해서 리턴을 함
		ArrayList<PersonDto> dtos=dao.personsAll();
		
		return dtos;
	}
	

}
