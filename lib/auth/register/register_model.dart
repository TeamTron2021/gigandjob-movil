class RegisterModel {
	String firstname;
	String lastname;
	DateTime birthdate;
	String email;
	String password;

	RegisterModel({
		required this.email, 
		required this.firstname, 
		required this.lastname, 
		required this.birthdate, 
		required this.password
	});

	factory RegisterModel.empty() => RegisterModel(email: "", firstname: "", lastname: "", birthdate: DateTime.now().subtract(const Duration(days: 1)), password: "");
}
