package ua.lviv.lgs.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import ua.lviv.lgs.dao.AuthorDao;
import ua.lviv.lgs.domain.Author;
import ua.lviv.lgs.domain.Book;

@Repository
public class AuthorDaoImpl extends BaseDaoImpl<Author> implements AuthorDao {
	@Transactional
	public void create(Author author) {
		getEm().persist(author);
	}
	
	@Transactional
	public void removeAuthor(int authorId) {
		Author author = findAuthorById(authorId);
		List<Book> books = author.getBooks();
		for (Book b : books) {
			getEm().remove(b);
		}
		getEm().remove(author);
	}
}
