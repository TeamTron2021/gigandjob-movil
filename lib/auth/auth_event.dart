import 'package:equatable/equatable.dart';
import 'package:gigandjob_movil/auth/auth_model/auth_model.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialEvent extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final Authentication auth;
  final String email;
  final String password;
  LoggedIn(this.email, this.password, {required this.auth});

  @override
  List<Object> get props => [auth, email, password];

  @override
  String toString() => 'LoggedIn { user: $auth.id.toString() }';
}

class LoggeOut extends AuthenticationEvent {

}

// class LoginButtomPressed extends AuthenticationEvent {
//   final String email;
//   final String password;

//   LoginButtomPressed({required this.email, required this.password});
// }