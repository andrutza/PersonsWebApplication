package person.data;

import javax.inject.Inject;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import person.Person;
import person.User;

@Repository
public class HibernateUserRepositoryImpl implements UserRepository{

	private SessionFactory sessionFactory;
	
	@Inject
	public HibernateUserRepositoryImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	private Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	public User findUserByUsername(String username) {
		User user = (User) currentSession().createCriteria(User.class).add(Restrictions.eq("username", username)).list().get(0);
		return user;
	}

	public User save(User user) {
		currentSession().persist(user);
		return user;
	}

}
