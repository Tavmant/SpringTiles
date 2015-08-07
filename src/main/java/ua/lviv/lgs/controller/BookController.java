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
import ua.lviv.lgs.domain.Book;
import ua.lviv.lgs.service.AuthorService;
import ua.lviv.lgs.service.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService service;
	
	@Autowired
	private AuthorService authorService;

	@Secured({"ROLE_ADMIN", "ROLE_AUTHOR"})
	@RequestMapping(value = "/addBook")
	public String addNewBook(Model model) {
		List<Author> authors = authorService.getAllAuthors();
		model.addAttribute("authors", authors);
		return "newBook";
	}

	@Secured({"ROLE_ADMIN", "ROLE_AUTHOR"})
	@RequestMapping(value = "/addBookHome", method = RequestMethod.POST)
	public String addingBook(Model model,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "authorId", required = false, defaultValue = "0") int authorId) {
		if (title.length() < 3) {
			model.addAttribute("message", "\"" + title + "\" - it's name too short.");
			return "badParam";
		}
		if (title.length() > 50) {
			model.addAttribute("message", "\"" + title + "\" - it's name too long.");
			return "badParam";
		}
		if (authorId == 0) {
			List<Author> authorList = authorService.getAllAuthors();
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
		Book book = new Book(title);
		book.setAuthor(authorService.findAuthorById(authorId));
		service.addNewBook(book, authorId);
		return "home-page";
	}
	
	@Secured({"ROLE_ADMIN", "ROLE_AUTHOR"})
	@RequestMapping(value = "/removeBook")
	public String removeBook(Model model) {
		Author author;
		List<Author> authorList = authorService.getAllAuthors();
		String authorName = SecurityContextHolder
								.getContext()
								.getAuthentication()
								.getName(); 
		for (Author a : authorList) {
			if (a.getName().equalsIgnoreCase(authorName)) {
				author = authorService.findAuthorById(a.getId());
				List<Book> authorBooks = author.getBooks();
				model.addAttribute("authorBooks", authorBooks);
			}
		}
		List<Book> books = service.getAllBooks();
		model.addAttribute("books", books);
		return "removeBook";
	}
	
	@Secured({"ROLE_ADMIN", "ROLE_AUTHOR"})
	@RequestMapping(value = "/removeBookHome")
	public String removingBook(Model model,
			@RequestParam(value = "bookId") int bookId) {
		service.removeBook(bookId);
		return "home-page";
	}
}
