package person.data;

import java.util.List;

import person.Person;

public interface PersonRepository {
	
	List<Person> findPersons();
	Person findPersonById(int id);
	Person save(Person person);
	Person update(Person person);
	void delete(int id);

}
