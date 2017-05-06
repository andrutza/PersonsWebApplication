package person;

public class ErrorDTO {

	private String field;
	private String defaultMessage;
	
	public ErrorDTO(String field, String defaultMessage) {
		this.field = field;
		this.defaultMessage = defaultMessage;
	}
	public String getDefaultMessage() {
		return defaultMessage;
	}
	public void setDefaultMessage(String defaultMessage) {
		this.defaultMessage = defaultMessage;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	
	
}
