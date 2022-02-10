import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/auth/auth_api/auth_api.dart';
import 'package:gigandjob_movil/auth/auth_bloc.dart';
import 'package:gigandjob_movil/auth/auth_event.dart';
import 'package:gigandjob_movil/auth/auth_repository/auth_repository.dart';
import 'package:gigandjob_movil/auth/auth_state.dart';
import 'package:gigandjob_movil/jobOffers/jobOffer.view.dart';
import 'package:gigandjob_movil/navigation_bar/navigation_bar.dart';

import 'auth/auth_model/auth_model.dart';
import 'auth/login/login_page.dart';

class SimpleBlocObeserver extends BlocObserver {

  // @override
  // void onEvent(Bloc bloc, Object event) {
  //   super.onEvent(bloc, event);
  //   print(event);
  // }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onEvent(bloc, transition);
    print(transition);
  }

  // @override
  // void onError(Bloc bloc, Object error, StackTrace stacktrace) {
  //   super.onError(bloc, error, stacktrace);
  // }

} 

void main() {
  Bloc.observer = SimpleBlocObeserver();
  final provider = AuthenticationApiProvider();
  final repository = AuthenticationRepository(provider);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
        return AuthenticationBloc(repository: repository)
        ..add(InitialEvent());
        }),
      ], 
      child:  App(repository: repository),
      )
    // BlocProvider(create: (context) {
    //   return AuthenticationBloc(repository: repository)
    //   ..add(InitialEvent());
    // },
  );
}

class App extends StatelessWidget {
  final AuthenticationRepository repository;
  const App({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
        
          if (state is AuthenticationAuthenticated) {
            return MainMenu();
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return LoginPage(authenticationRepository: repository);
        },
      ), 
      initialRoute: '/',
      routes: {
        '/first': (context) => const JobOfferView(),
        // '/second': (context) => MainScreen3(),
      },
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(),
      );
}