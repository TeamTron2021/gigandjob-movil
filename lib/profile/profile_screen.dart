import 'package:flutter/material.dart';
import 'package:gigandjob_movil/shared/input_text_component.dart';

class ProfileScreen extends StatelessWidget {
	const ProfileScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context){
		return Scaffold(
			backgroundColor: Colors.white,
			body: Padding(
    			padding: EdgeInsets.all(16.0),
    			child: ListView(
					children: <Widget>[
						Form(
							child: Column(
								children: [
									const Padding(
										padding: EdgeInsets.all(16.0),
										child: Text(
											"Jotaro Kujoh",
											textScaleFactor: 3.0,
										),
									),
									Row(
										children: const [
											Icon(Icons.logout, color: Colors.purpleAccent),
											Padding(
												padding: EdgeInsets.all(8.0),
												child: Text("Log out"),
											),
										],
									),
          							const Divider(),
									Row(
										children: const [
											Icon(Icons.create_outlined, color: Colors.blueAccent,),
											Padding(
												padding: EdgeInsets.all(8.0),
												child: Text("Edit profile"),
											),
										],
									),
          							const Divider(),
									Row(
										children: const [
											Icon(Icons.delete, color: Colors.redAccent),
											Padding(
												padding: EdgeInsets.all(8.0),
												child: Text("Delete account"),
											),
										],
									),
									const Padding(
										padding: EdgeInsets.all(15.0),
										child: Text(
											"General Info",
											textScaleFactor: 1.5,
										),
									),
									Row(
										children: const [
											Icon(Icons.account_box, color: Colors.grey),
											Padding(
												padding: EdgeInsets.all(8.0),
												child: Text("Jotaro"),
											),
										],
									),
									Row(
										children: const [
											Icon(Icons.account_box, color: Colors.grey,),
											Padding(
												padding: EdgeInsets.all(8.0),
												child: Text("Kujo"),
											),
										],
									),
									Row(
										children: const [
											Icon(Icons.email, color: Colors.blueAccent,),
											Padding(
												padding: EdgeInsets.all(8.0),
												child: Text("jotaro-kujoh@joestar.com"),
											),
										],
									),
									Row(
										children: const [
											Icon(Icons.cake, color: Colors.pinkAccent,),
											Padding(
												padding: EdgeInsets.all(8.0),
												child: Text("1970/02/03"),
											),
										],
									),
								],
							),
						)
					],
				)
			)
		);
	}
}
