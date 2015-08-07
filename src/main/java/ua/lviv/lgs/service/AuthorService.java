package ua.lviv.lgs.service;

import java.util.List;

import ua.lviv.lgs.domain.Author;

public interface AuthorService {
	void addAuthor(Author author);
	
	List <Author> getAllAuthors();
	
	void removeAuthor(int authorId);
	
	Author findAuthorById(int authorId);
}
