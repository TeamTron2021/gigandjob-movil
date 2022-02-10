import 'package:equatable/equatable.dart';
import 'package:gigandjob_movil/auth/auth_model/auth_model.dart';
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override 
  List<Object> get props => [];
}


class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final Authentication auth;
  const AuthenticationAuthenticated(this.auth);

   @override 
  List<Object> get props => [auth];
}

class AuthenticationNotAuthenticated extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  const AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}