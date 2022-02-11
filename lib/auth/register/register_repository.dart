import 'package:gigandjob_movil/auth/register/register_model.dart';
import 'package:http/http.dart' as http;

abstract class RegisterRepository {
	Future<void> save(RegisterModel model);
}

class EndpointRegisterRepository extends RegisterRepository {
	final Uri uri;
	final http.Client httpClient;

	EndpointRegisterRepository({ required String url }): 
		uri = Uri.parse(url),
		httpClient = http.Client();

	@override
  Future<void> save(RegisterModel model) async {
		final response = await httpClient.post(uri, body: {
			"firstname": model.firstname,
			"lastname": model.lastname,
			"email": model.email,
			"birthday": model.birthdate.toString(),
			"password": model.password
		});

		print(response);
  }
}
