package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PersonDto;

public interface Service {

	public ArrayList<PersonDto> execute(HttpServletRequest request,HttpServletResponse response);	
}
