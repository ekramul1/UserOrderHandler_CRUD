package user;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class hibernateWork1 {
	public void addUser(String firstName, String lastName,int empId )
	{
		Person person= new Person();
		person.setEmpId(empId);
		person.setFirstName(firstName);
		person.setLastName(lastName);
		@SuppressWarnings("deprecation")
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	    Session session= sessionFactory.openSession();
	    session.beginTransaction();
	    session.save(person);
	    session.getTransaction().commit();
	}

}
