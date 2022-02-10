import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String id;
  const LoginSuccess({required this.id});
  
 @override
  List<Object> get props => [id];

}

class LoginFaliure extends LoginState {
  final String error;

  const LoginFaliure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => ' LoginFaliure { error: $error }';
}