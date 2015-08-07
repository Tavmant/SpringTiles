package ua.lviv.lgs.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import ua.lviv.lgs.dao.BaseDao;
import ua.lviv.lgs.domain.Author;
import ua.lviv.lgs.domain.Book;

public abstract class BaseDaoImpl<T> implements BaseDao<T> {
	@PersistenceContext(unitName = "primary")
	private EntityManager em;
	private Class<?> entityClass;
	
	public BaseDaoImpl() {
		entityClass = getEntityClass();
	}
	
	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}
	
	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		return em.createQuery("From " + entityClass.getName()).getResultList();
	}

	public Author findAuthorById(int authorId) {
		return getEm().find(Author.class, authorId);
	}
	
	public Book findBookById(int bookId) {
		return getEm().find(Book.class, bookId);
	}
	
	@SuppressWarnings("unchecked")
	protected final Class<T> getEntityClass() {
		final Type type = getClass().getGenericSuperclass() instanceof ParameterizedType ? getClass().getGenericSuperclass()
				: getClass().getSuperclass().getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			final ParameterizedType paramType = (ParameterizedType) type;
			return (Class<T>) paramType.getActualTypeArguments()[0];
		} else
			throw new IllegalArgumentException("Could not guess entity class by reflection");
	}

}
