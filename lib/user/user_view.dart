import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/auth/auth_bloc.dart';
import 'package:gigandjob_movil/auth/auth_event.dart';
import 'package:gigandjob_movil/auth/auth_state.dart';

class UserView extends StatelessWidget {

  
  const UserView({Key? key,}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<AuthenticationBloc>(context);
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
              'Welcome ${state.state}',
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
