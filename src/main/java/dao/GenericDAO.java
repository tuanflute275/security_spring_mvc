package dao;

import java.util.List;

import entities.Category;

public interface GenericDAO<T> {
	List<T> findAll();
	T getById(Integer id);
	List<T> search(String name);
	void insert (T t);
	void update (T t);
	void delete(Integer id);
}
