package ua.lviv.lgs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ua.lviv.lgs.domain.Author;
import ua.lviv.lgs.service.AuthorService;

@Controller
public class AuthorController {
	@Autowired
	private AuthorService service;

	@RequestMapping(value = "/showAllAuthors")
	public String getAllAuthors(Model model) {
		List<Author> authors = service.getAllAuthors();
		model.addAttribute("authors", authors);
		return "authors";
	}
	
	@RequestMapping(value = "/authorProfile")
	public String viewProfile(Model model,
			@RequestParam(value = "authorId") int authorId) {
		Author author = service.findAuthorById(authorId);
		model.addAttribute("author", author);
		return "profile";
	}

	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/createAuthor")
	public String createPage() {
		return "newAuthor";
	}

	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/createAuthorHome", method = RequestMethod.POST)
	public String creatingAuthor(Model model,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "age") int age,
			@RequestParam(value = "face", required = false,
				defaultValue = "http://cs5294.vk.me/u132090174/153213547/x_b0e2113f.jpg") String face, 
			@RequestParam(value = "biography", required = false,
				defaultValue = "no biography") String biography) {
		if (name.length() < 3) {
			model.addAttribute("message", "\"" + name + "\" - it's wrong name.");
			return "badParam";
		}
		if (age < 6) {
			model.addAttribute("message", "People preschool can't wright books.");
			return "badParam";
		}
		if (age > 100) {
			model.addAttribute("message", "So old people can't wright books.");
			return "badParam";
		}
		service.addAuthor(new Author(name, age, biography, face));
		return "home-page";
	}
	
	@Secured({"ROLE_ADMIN", "ROLE_AUTHOR"})
	@RequestMapping(value = "/removeAuthor")
	public String removeAuthor(Model model) {
		List<Author> authors = service.getAllAuthors();
		model.addAttribute("authors", authors);
		return "removeAuthor";
	}
	
	@Secured({"ROLE_ADMIN", "ROLE_AUTHOR"})
	@RequestMapping(value = "/removeAuthorHome")
	public String removingAuthor(Model model,
			@RequestParam(value = "authorId", required = false, defaultValue = "0") int authorId) {
		if (authorId == 0) {
			List<Author> authorList = service.getAllAuthors();
			String authorName = SecurityContextHolder
									.getContext()
									.getAuthentication()
									.getName(); 
			for (Author author : authorList) {
				if (author.getName().equalsIgnoreCase(authorName)) {
					authorId = author.getId();
				}
			}
		}
		service.removeAuthor(authorId);
		return "home-page";
	}
}
