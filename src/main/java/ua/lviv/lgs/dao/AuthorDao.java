package ua.lviv.lgs.dao;

import ua.lviv.lgs.domain.Author;

public interface AuthorDao extends BaseDao<Author> {
	void removeAuthor(int authorId);
	void create(Author author);
}
