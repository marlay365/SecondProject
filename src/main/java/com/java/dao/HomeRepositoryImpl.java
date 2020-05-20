//package com.java.dao;
//
//import org.hibernate.query.Query;
//
//import java.util.List;
//
//import org.hibernate.Criteria;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.criterion.Restrictions;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.java.dto.HomeDetails;
//
//@Repository
//public class HomeRepositoryImpl implements HomeRepository {
//	
//	@Autowired SessionFactory sf;
//	
//	public int saveProperty(HomeDetails houseDet) {
//		Session s = sf.openSession();
//		System.out.println("I got here");
//		s.beginTransaction();
//		s.save(houseDet);
//		s.getTransaction().commit();
//		s.close();
//		return 1;
//	}
//
//	public List<HomeDetails> getDetails(String city, String propType) {
//		Session s = sf.openSession();
//		s.beginTransaction();
//		Criteria crit = s.createCriteria(HomeDetails.class);
//		crit.add(Restrictions.eq("city", city));
//		crit.add(Restrictions.eq("propertyType", propType));
//		List<HomeDetails> list = (List<HomeDetails>) crit.list();
//		s.getTransaction().commit();
//		if(list.size() == 0)
//		{
//			s.close();
//			return null;
//		}
//		s.close();
//		return list;
//	}
//
//	@Override
//	public HomeDetails getPropertyDetailsbyId(int id) {
//		Session s = sf.openSession();
//		s.beginTransaction();
//		Criteria crit = s.createCriteria(HomeDetails.class);
//		crit.add(Restrictions.eq("id", id));
//		HomeDetails obj = (HomeDetails) crit.uniqueResult();
//		s.getTransaction().commit();
//		s.close();
//		return obj;
//	}
//
//	@Override
//	public List<HomeDetails> getMyProperties(int id) {
//		Session s = sf.openSession();
//		s.beginTransaction();
//		Criteria crit = s.createCriteria(HomeDetails.class);
//		crit.add(Restrictions.eq("owner.id", id));
//		List<HomeDetails> list = (List<HomeDetails>) crit.list();
//		s.getTransaction().commit();
//		if(list.size() == 0)
//		{
//			s.close();
//			return null;
//		}
//		s.close();
//		return list;
//	}
//
//}
