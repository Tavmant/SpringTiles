package ua.lviv.lgs.dao;

import java.util.List;

import ua.lviv.lgs.domain.Author;
import ua.lviv.lgs.domain.Book;

public interface BaseDao<T> {
	List<T> findAll();
	Author findAuthorById(int authorId);
	Book findBookById(int bookId);
}
