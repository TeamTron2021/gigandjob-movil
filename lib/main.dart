import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/auth/auth_api/auth_api.dart';
import 'package:gigandjob_movil/auth/auth_bloc.dart';
import 'package:gigandjob_movil/auth/auth_event.dart';
import 'package:gigandjob_movil/auth/auth_repository/auth_repository.dart';
import 'package:gigandjob_movil/auth/auth_state.dart';

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
    BlocProvider(create: (context) {
      return AuthenticationBloc(repository: repository)
      ..add(InitialEvent());
    },
    child: App(repository: repository),
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
            return HomePage(state: state,);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return LoginPage(authenticationRepository: repository);
        },
      )
    );
  }
}


class HomePage extends StatelessWidget {
  final AuthenticationAuthenticated state;
  const HomePage({Key? key, required this.state} ) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home | Home Hub'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 30.0),
            child: Text(
              'Welcome ${state}',
              style: TextStyle(
                fontSize: 24.0,
              ),
            )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(34.0, 20.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.width * 0.16,
                child: RaisedButton(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggeOut());
                  },
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(),
      );
}