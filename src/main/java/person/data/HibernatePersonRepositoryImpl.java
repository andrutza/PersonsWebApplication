package person.data;

import java.util.List;

import javax.inject.Inject;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import person.Person;

//@Transactional
@Repository
public class HibernatePersonRepositoryImpl implements PersonRepository {

	private SessionFactory sessionFactory;

    //@Autowired
	@Inject
	public HibernatePersonRepositoryImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	public List<Person> findPersons() {
		return (List<Person>) currentSession().createCriteria(Person.class).list();
	}

	public Person findPersonById(int id) {
		return (Person) currentSession().createCriteria(Person.class)
				.add(Restrictions.eq("id", id)).list().get(0);
	}

	public Person save(Person person) {
		currentSession().persist(person);
		return person;
	}

	public Person update(Person person) {
		currentSession().update(person);
		return person;
	}

	public void delete(int id) {
		Person person = (Person) currentSession().load(Person.class, new Integer(id));
		if(person != null) {
			currentSession().delete(person);
		}
	}

}
