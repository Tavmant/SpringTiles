package ua.lviv.lgs.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.dao.BookDao;
import ua.lviv.lgs.domain.Book;
import ua.lviv.lgs.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookDao dao;

	@Transactional
	public void addNewBook(Book book, int authorId) {
		dao.addBook(book, authorId);
	}

	public List<Book> getAllBooks() {
		return dao.findAll();
	}
	
	@Transactional
	public void removeBook(int bookId) {
		dao.removeBook(bookId);
	}
}
