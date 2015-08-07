package ua.lviv.lgs.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.dao.AuthorDao;
import ua.lviv.lgs.domain.Author;
import ua.lviv.lgs.service.AuthorService;

@Service
public class AuthorServiceImpl implements AuthorService {
	@Autowired
	private AuthorDao dao;

	@Transactional
	public void addAuthor(Author author) {
		dao.create(author);
	}

	public List<Author> getAllAuthors() {
		return dao.findAll();
	}
	
	@Transactional
	public void removeAuthor(int authorId) {
		dao.removeAuthor(authorId);
	}
	
	public Author findAuthorById(int authorId) {
		return dao.findAuthorById(authorId);
	}
}
