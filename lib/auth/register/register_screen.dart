import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/auth/register/register_bloc.dart';
import 'package:gigandjob_movil/auth/register/register_repository.dart';
import 'package:gigandjob_movil/shared/input_text_component.dart';

class _RegisterScreen extends StatelessWidget {
	const _RegisterScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context){
		final bloc = BlocProvider.of<RegisterCubit>(context);

		final firstnameController = TextEditingController();
		final lastnameController = TextEditingController();
		final emailController = TextEditingController();
		final passwordController = TextEditingController();

		firstnameController.addListener(() {
			bloc.update((model) { 
				model.firstname = firstnameController.text; 
			});
		});
		lastnameController.addListener(() {
			bloc.update((model) { model.lastname = lastnameController.text; });
		});
		emailController.addListener(() {
			bloc.update((model) { model.email = emailController.text; });
		});
		passwordController.addListener(() {
			bloc.update((model) { model.password = passwordController.text; });
		});

		return BlocConsumer<RegisterCubit, RegisterCubitState>(
			listener: (context, state) {},
			bloc: bloc,
			builder: (context, state) => Scaffold(
			backgroundColor: Colors.white,
			body: Padding(
    			padding: const EdgeInsets.all(16.0),
    			child: ListView(
					children: <Widget>[
						Form(
							child: Column(
								children: [
									const Padding(
										padding: EdgeInsets.all(16.0),
										child: Text(
												"Register",
												textScaleFactor: 3.0,
										),
									),
									Padding(
										padding: const EdgeInsets.all(16.0),
										child: InputTextComponent(
												icon: Icons.account_box,
												placelholder: "Enter firstname",
												obscure: false,
												controller: firstnameController
										),
									),
									Padding(
										padding: const EdgeInsets.all(16.0),
										child: InputTextComponent(
												icon: Icons.account_box,
												placelholder: "Enter lastname",
												obscure: false,
												controller: lastnameController,
										),
									),
									Padding(
										padding: const EdgeInsets.all(16.0),
										child: InputTextComponent(
												icon: Icons.calendar_today,
												placelholder: "Enter birthday",
												obscure: false,
												controller: firstnameController,
										),
									),
									Padding(
										padding: const EdgeInsets.all(16.0),
										child: InputTextComponent(
												icon: Icons.email,
												placelholder: "Enter email",
												obscure: false,
												controller: emailController
										),
									),
									Padding(
										padding: const EdgeInsets.all(16.0),
										child: InputTextComponent(
												icon: Icons.lock,
												placelholder: "Enter password",
												obscure: true,
												controller: passwordController,
										),
									),
									Padding(
										padding: const EdgeInsets.all(16.0),
										child: ElevatedButton(
            								style: ElevatedButton.styleFrom(
												primary: Colors.deepPurpleAccent,
											),
            								onPressed: () async {
												print(state?.model);
												await bloc.save();
											},
            								child: const Text('Sing up'),
          								),
									),
								],
							),
						)
					],
				)
			)
		));
	}
}

class RegisterScreen extends StatelessWidget {
	RegisterScreen(): super();

	@override
  Widget build(BuildContext context) {
	return BlocProvider<RegisterCubit>(
			create: (context) => RegisterCubit(repository: RepositoryProvider.of<RegisterRepository>(context)),
			child: _RegisterScreen(),
	);
  }
}
