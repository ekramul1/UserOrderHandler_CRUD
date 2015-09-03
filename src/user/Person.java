package user;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Person {
	@Id
	private int empId;
	private String firstName;
	private String lastName;
	
	/*public Person(int empId, String firstName, String lastName)
	{
		this.empId= empId;
		this.firstName= firstName;
		this.lastName= lastName;
	}*/
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	

}