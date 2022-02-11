import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/auth/auth_api/auth_api.dart';
import 'package:gigandjob_movil/auth/auth_bloc.dart';
import 'package:gigandjob_movil/auth/auth_event.dart';
import 'package:gigandjob_movil/auth/auth_repository/auth_repository.dart';
import 'package:gigandjob_movil/auth/auth_state.dart';
import 'package:gigandjob_movil/jobOffers/api/jobOffer.api.dart';
import 'package:gigandjob_movil/jobOffers/bloc/jobOfferBloc.dart';
import 'package:gigandjob_movil/jobOffers/bloc/jobOfferStatus.dart';
import 'package:gigandjob_movil/jobOffers/jobOffer.view.dart';
import 'package:gigandjob_movil/jobOffers/repository/jobOfferRepository.dart';
import 'package:gigandjob_movil/navigation_bar/navigation_bar.dart';
import 'package:gigandjob_movil/postulation/bloc/PostulationBloc.dart';
import 'package:gigandjob_movil/postulation/bloc/PostulationEvent.dart';

import 'auth/auth_model/auth_model.dart';
import 'auth/login/login_page.dart';
import 'jobOffers/bloc/jobOfferEvents.dart';

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
  final authProvider = AuthenticationApiProvider();
  final authRepository = AuthenticationRepository(authProvider);
  final jobOfferProvider = JobOfferApiProvider();
  final jobRepository = JobOfferRepository(jobOfferProvider);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
        return AuthenticationBloc(repository: authRepository)
        ..add(InitialEvent());
        }),
        BlocProvider(create: (context) {
          return JobOfferBloc(PostulationBloc(), repository: jobRepository)
          ..add(JobOfferLoaded());
        }) ,
        BlocProvider(create:  (context) {
          return PostulationBloc()..add(PostulationSended());
        })
      ], 
      child:  App(repository: authRepository),
      )

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
        '/first': (context) => JobOfferView(),
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