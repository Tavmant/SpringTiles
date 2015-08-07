package ua.lviv.lgs.dao.impl;

import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import ua.lviv.lgs.dao.BookDao;
import ua.lviv.lgs.domain.Book;
import ua.lviv.lgs.domain.Author;

@Repository
public class BookDaoImpl extends BaseDaoImpl<Book> implements BookDao {
	@Transactional
	public void addBook(Book book, int authorId) {
		Author author = findAuthorById(authorId);
		book.setAuthor(author);
		getEm().persist(book);
		author.getBooks().add(book);
		getEm().merge(author);
	}
	
	@Transactional
	public void removeBook(int bookId) {
		Book book = findBookById(bookId);
		Author author = findAuthorById(book.getAuthor().getId());
		author.getBooks().remove(book);
		getEm().merge(author);
		book.setAuthor(null);
		getEm().remove(book);
	}
}
