package validators;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import entity.Users;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> c) {
		
		return c.isAssignableFrom(Users.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "uname", "uname.empty", "Please enter username");
		ValidationUtils.rejectIfEmpty(errors, "pwd", "pwd.empty", "Please enter password");
		
	}

}
