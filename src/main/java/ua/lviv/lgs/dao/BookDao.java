package ua.lviv.lgs.dao;

import ua.lviv.lgs.domain.Book;

public interface BookDao extends BaseDao<Book> {
	void addBook(Book book, int authorId);
	
	void removeBook(int bookId);
}
