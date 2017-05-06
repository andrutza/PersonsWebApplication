package person.data;

import person.User;

public interface UserRepository {

	User findUserByUsername(String username);
	User save(User user);
}
