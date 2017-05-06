package person.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import person.Person;
import person.data.PersonRepository;

@Service
@Transactional
public class PersonServiceImpl implements PersonService{

	private PersonRepository personRepo;
	
	@Autowired
	public PersonServiceImpl(PersonRepository personRepo) {
		this.personRepo = personRepo;
	}
	
	public List<Person> findPersons() {
		return personRepo.findPersons();
	}

	public Person findPersonById(int id) {
		return personRepo.findPersonById(id);
	}

	public Person save(Person person) {
		return personRepo.save(person);
	}

	public Person update(Person person) {
		return personRepo.update(person);
	}

	public void delete(int id) {
		personRepo.delete(id);
		
	}

}
