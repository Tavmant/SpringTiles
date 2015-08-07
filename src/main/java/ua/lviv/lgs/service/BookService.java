package ua.lviv.lgs.service;

import java.util.List;

import ua.lviv.lgs.domain.Book;

public interface BookService {
	void addNewBook(Book book, int authorId);
	
	List<Book> getAllBooks();
	
	void removeBook(int bookId);
}
