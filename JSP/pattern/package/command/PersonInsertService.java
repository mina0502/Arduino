package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PersonDao;
import dto.PersonDto;

public class PersonInsertService implements Service {

	@Override
	public ArrayList<PersonDto> execute(HttpServletRequest request, HttpServletResponse response) {
		PersonDao dao=PersonDao.getInstance();
		dao.personInsert();
		return null;
	}
	
	

}
