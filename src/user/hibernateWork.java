package user;
import org.hibernate.SessionFactory;
import org.hibernate.*;
import org.hibernate.cfg.*;


public class hibernateWork {
private static SessionFactory sessionFactory;

   private Session getSession() {
       Session s = null;
       try {
           sessionFactory = new Configuration().configure(
                   "com\\xml\\hibernate.cfg.xml").buildSessionFactory();
           s = sessionFactory.openSession();
       } catch (HibernateException e) {
           System.out.println(e.getMessage());
       }
       return s;
   }
public void adduser(String firstName,String lastName,int empId)
throws Exception{
try
{
Session s=getSession();
Transaction tx = s.beginTransaction();
Person add=new Person();
add.setEmpId(empId);
add.setFirstName(firstName);
add.setLastName(lastName);
   s.save(add);
   
           tx.commit();
           System.out.println("\n\n Details Added \n");
       } catch (HibernateException e) {
           System.out.println(e.getMessage());
           System.out.println("error");
       }
}	

}