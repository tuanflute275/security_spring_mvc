package dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.ICategoryDAO;
import entities.Category;

@Repository
public class CategoryDAO implements ICategoryDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	// lấy ra tất cả dữ liêu
	public List<Category> findAll() {
		Session session = sessionFactory.openSession();
		List<Category> results = session.createQuery("from Category").getResultList();
		return results;
	}

	@Override
	// lấy theo id
	public Category getById(Integer id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Category item = session.get(Category.class, id);
		session.getTransaction().commit();
		return item;
	}

	@Override
	// tìm kiếm theo tên
	public List<Category> search(String name) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Category where name like :name");
		query.setParameter("name", "%" + name + "%");
		return query.getResultList();
	}

	@Override
	public void insert(Category category) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(category);
		session.getTransaction().commit();
	}

	@Override
	public void update(Category category) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(category);
		session.getTransaction().commit();
	}

	@Override
	public void delete(Integer id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		var item = session.get(Category.class, id);
		session.remove(item);
		session.getTransaction().commit();
	}

}
