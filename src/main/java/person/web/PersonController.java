package person.web;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import person.ErrorDTO;
import person.JsonResponse;
import person.Person;
import person.service.PersonService;

@Controller
//@RequestMapping({"/persons"})
public class PersonController {

	private PersonService personService;
	
	@Autowired
	public PersonController(PersonService personService) {
		this.personService = personService;
	}
	
	@RequestMapping(value="/person", method=RequestMethod.GET)
	public String persons(Model model) {
        model.addAttribute(personService.findPersons());
		model.addAttribute(new Person());
		return "persons";
	}

	@RequestMapping(value="/update", method=GET)
	public String showUpdateForm(Model model, HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Person person = personService.findPersonById(id);
		model.addAttribute(person);
		return "update";
	}

	@RequestMapping(value="/add", method=POST)
	public @ResponseBody JsonResponse processRegistractionAdd(@Valid Person person, BindingResult result) {
		JsonResponse response = new JsonResponse();
		if(result.hasErrors()) {
			System.out.println("count: "+result.getFieldErrorCount());
			response.setStatus("FAIL");
			List<ErrorDTO> errors = new ArrayList<ErrorDTO>();
			for(ObjectError error : result.getAllErrors()) {
				errors.add(new ErrorDTO(((FieldError)error).getField(), error.getDefaultMessage()));
			}
			response.setResult(errors);
		} else {
			person = personService.save(person);
			response.setStatus("SUCCESS");
			response.setResult(person);
	}
		return response;
	}

	@RequestMapping(value="/update", method=POST)
	public String processRegistractionUpdate(@Valid Person person, Errors errors) {
		if(errors.hasErrors()) {
			return "update";
		}
		personService.update(person);
		return "redirect:/person";
	}

	@RequestMapping(value="/delete", method=GET)
	public String deleteRegistraction(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		personService.delete(id);
		return "redirect:/person";
	}

	@RequestMapping(value="/back", method=GET)
	public String processRegistraction() {
		return "redirect:/person";
	}

}
