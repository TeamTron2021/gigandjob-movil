import 'dart:convert';

import 'package:gigandjob_movil/auth/auth_api/auth_api.dart';
import 'package:gigandjob_movil/auth/auth_model/auth_model.dart';

abstract class AuthenticationRepositoryBase {
  Future<Authentication> headline(String email, String password);
}

class AuthenticationRepository extends AuthenticationRepositoryBase {
  final AuthenticationApiProvider _provider;

  AuthenticationRepository(this._provider);

  @override
  Future<Authentication> headline(String email, String password) => _provider.headline(email, password);

}