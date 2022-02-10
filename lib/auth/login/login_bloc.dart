import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/auth/auth_bloc.dart';
import 'package:gigandjob_movil/auth/auth_event.dart';
import 'package:gigandjob_movil/auth/auth_repository/auth_repository.dart';
import 'package:gigandjob_movil/auth/auth_state.dart';
import 'package:gigandjob_movil/auth/login/login_event.dart';
import 'package:gigandjob_movil/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository repository;
  final AuthenticationBloc authenticationBloc;
  final controller = StreamController<AuthenticationAuthenticated>();
  late StreamSubscription subscription;

  LoginBloc({required this.repository, required this.authenticationBloc}) 
  : assert(authenticationBloc != null),
  assert(repository != null), 
  super(LoginInitial()) {
    on<LoginButtonPressed>(_logginButton);

  
  }

  Future<void> _logginButton(LoginButtonPressed event, Emitter<LoginState> emmit) async {
    emmit(LoginLoading());
    try {
      
      final auth = await repository.headline(event.email, event.password);
      LoggedIn(
        event.email,
        event.password,
        auth: auth);
        authenticationBloc.emit(AuthenticationAuthenticated(auth));
    }
    catch (e) {
      emmit(LoginFaliure(error: e.toString()));
    }
  }

  @override
  void onEvent(LoginEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    super.onTransition(transition);
    print(transition);
  }

   @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }

}