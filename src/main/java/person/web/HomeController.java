package person.web;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import person.User;

@Controller
@RequestMapping({"/"})
public class HomeController {
	
	@RequestMapping(method=GET)
	public String login(Model model) {
		model.addAttribute(new User());
		return "login";
	}

}
