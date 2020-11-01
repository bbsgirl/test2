package com.min.myapp;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DummyDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void insertDummy(Dummy dummy) {
		Session session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		session.save(dummy);
		trans.commit();
	}
	
	public void selectDummy(Dummy dummy) {
		Session session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		
		Dummy d = (Dummy) session.get(Dummy.class, dummy.getIdx());
		System.out.println("re:"+d.getContent());
		
		trans.commit();
	}
}
