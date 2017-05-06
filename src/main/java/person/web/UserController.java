package person.web;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import person.User;
import person.service.UserService;

@Controller
public class UserController {

	private UserService userService;
	
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value="/signup", method=GET)
	public String showSignUpForm(Model model) {
		model.addAttribute(new User());
		return "signup";
	}

	@RequestMapping(value="/signup", method=POST)
	public String processRegistractionSignUp(HttpServletRequest request,
            final RedirectAttributes redirectAttributes, @Valid User user, Errors errors) {
		if(errors.hasErrors()) {
			return "signup";
		}
		String password = request.getParameter("confirmPassword");
		if(password.equals(user.getPassword())) {
			userService.save(user);
			redirectAttributes.addFlashAttribute("message","Sign up successfully.");
		} else {
			redirectAttributes.addFlashAttribute("message","Passwords must be equal.");
			return "redirect:/signup";
		}
		return "redirect:/";
	}

	@RequestMapping(value="/cancel", method=GET)
	public String processCancel() {
		return "redirect:/";
	}
}
