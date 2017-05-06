package person.data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import person.Person;

@Repository
public class PersonRepositoryImpl implements PersonRepository{

	  private JdbcOperations jdbc;

	  @Autowired
	  public PersonRepositoryImpl(JdbcOperations jdbc) {
	    this.jdbc = jdbc;
	  }

	  public List<Person> findPersons() {
		return jdbc.query(
		    "select id, nume, prenume, adresa, email, nr_telefon" +
		    " from persoane" +
		    " order by nume asc",
		    new PersonRowMapper());
	  }

	  public List<Person> findPersonById(int id) {
		return jdbc.query(
		    "select *" +
		    " from persoane" +
		    " where id=" + id,
		    new PersonRowMapper());
	  }

	  public Person save(Person person) {
			jdbc.update(
			    "insert into persoane (nume, prenume, adresa, email, nr_telefon)" +
			    " values (?, ?, ?, ?, ?)",
			    person.getFirstName(),
			    person.getLastName(),
			    person.getAddress(),
			    person.getEmail(),
			    person.getNumber());
			return person;
	  }
	  
	  public Person update(Person person) {
			jdbc.update(
			    "update persoane set nume=?, prenume=?, adresa=?, email=?, nr_telefon=?" +
			    " where id=?",
			    person.getFirstName(),
			    person.getLastName(),
			    person.getAddress(),
			    person.getEmail(),
			    person.getNumber(), person.getId());
			return person;
	  }
	  
	  public void delete(int id) {
			jdbc.update("delete from persoane where id=?", id);
	  }

	  private static class PersonRowMapper implements RowMapper<Person> {
		    public Person mapRow(ResultSet rs, int rowNum) throws SQLException {
		      return new Person(
		          rs.getInt("id"),
		          rs.getString("nume"), 
		          rs.getString("prenume"), 
		          rs.getString("adresa"), 
		          rs.getString("email"),
		    	  rs.getString("nr_telefon"));
		    }
	  }
}
