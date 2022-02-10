import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/auth/auth_event.dart';
import 'package:gigandjob_movil/auth/auth_repository/auth_repository.dart';
import 'package:gigandjob_movil/auth/auth_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final AuthenticationRepository repository;
  AuthenticationBloc({required this.repository}) : 
  assert(repository != null),
  super(AuthenticationInitial())
  {
    on<InitialEvent>((event, emmit) => emmit(AuthenticationInitial()));
    on<LoggedIn>(_loggedInEvent);
    on<LoggeOut>(_loggedOutEvent);
  }

  Future<void> _loggedInEvent (LoggedIn event, Emitter<AuthenticationState> emmit) async {
    emmit(AuthenticationLoading());
    final auth = await repository.headline(event.email, event.password);
    emmit(AuthenticationAuthenticated(auth));
  }

  Future<void> _loggedOutEvent (LoggeOut event, Emitter<AuthenticationState> emmit) async {
    emmit(AuthenticationLoading());
    emmit(AuthenticationNotAuthenticated());
  }

  // Future<void> _loginBlocEvent (LoginButtomPressed event, Emitter<AuthenticationState> emmit) async {
    
  //   try {
  //     emmit(AuthenticationLoading());

  //     final auth = await _repository.headline();
  //     emmit(AuthenticationAuthenticated(auth));
  //   } catch (e) {
  //     emmit(const AuthenticationFailure(message: 'Unknown error'));
  //   }


  // }

  @override
  void onEvent(AuthenticationEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onTransition(Transition<AuthenticationEvent, AuthenticationState> transition) {
    super.onTransition(transition);
    print(transition);
  }

   @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }

}