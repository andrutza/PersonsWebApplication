package person;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="persoane")
public class Person {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="nume")
	@NotEmpty (message="{firstName.empty}")
	@Size(min=3, message="{firstName.size}")
	private String firstName;

	@Column(name="prenume")
	@NotEmpty (message="{lastName.empty}")
	@Size(min=3, message="{lastName.size}")
	private String lastName;

	@Column(name="adresa")
	@NotEmpty (message="{address.empty}")
	@Size(min=3, message="{address.size}")
	private String address;

	@Column(name="email")
	@NotEmpty (message="{email.empty}")
    @Email (message="{email.valid}")
	private String email;

	@Column(name="nr_telefon")
	@NotEmpty (message="{number.empty}")
	@Pattern(regexp="(^$|[0-9]{10})", message="{number.size}")
	private String number;
		
	public Person() {}
	
	public Person(int id, String firstName, String lastName, String address, String email, String number) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.email = email;
		this.number = number;
	}
	
//	public Person(String firstName, String lastName, String address, String email, String number) {
//		this(0, firstName, lastName, address, email, number);
//	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	
}
