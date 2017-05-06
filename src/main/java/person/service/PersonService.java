package person.service;

import java.util.List;

import person.Person;

public interface PersonService {

	List<Person> findPersons();
	Person findPersonById(int id);
	Person save(Person person);
	Person update(Person person);
	void delete(int id);
}
