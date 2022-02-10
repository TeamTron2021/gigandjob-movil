import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/auth/register/register_bloc.dart';
import 'package:gigandjob_movil/auth/register/register_repository.dart';
import 'package:gigandjob_movil/shared/input_text_component.dart';

class _RegisterScreen extends StatelessWidget {
	final GlobalKey<FormState> formState = GlobalKey();
	_RegisterScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context){
		final bloc = BlocProvider.of<RegisterCubit>(context);

		final firstnameController = TextEditingController();
		final lastnameController = TextEditingController();
		final emailController = TextEditingController();
		final passwordController = TextEditingController();
		final birthdateController = TextEditingController();

		firstnameController.addListener(() {
			bloc.update(cb: (model) { 
				model.firstname = firstnameController.text; 
			});
		});
		lastnameController.addListener(() {
			bloc.update(cb: (model) { model.lastname = lastnameController.text; });
		});
		emailController.addListener(() {
			bloc.update(cb: (model) { model.email = emailController.text; });
		});
		passwordController.addListener(() {
			bloc.update(cb: (model) { model.password = passwordController.text; });
		});
		bloc.update();

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
							key: formState,
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
												validator: (_) => state.errors["firstname"],
												controller: firstnameController
										),
									),
									Padding(
										padding: const EdgeInsets.all(16.0),
										child: InputTextComponent(
												icon: Icons.account_box,
												placelholder: "Enter lastname",
												obscure: false,
												validator: (_) => state.errors["lastname"],
												controller: lastnameController,
										),
									),
									Padding(
										padding: const EdgeInsets.all(16.0),
										child: InputTextComponent(
												icon: Icons.calendar_today,
												placelholder: "Enter birthday",
												obscure: false,
												readOnly: true,
												validator: (_) => state.errors["birthdate"],
												onTap: () async {
													final DateTime? selectedDate = await showDatePicker(
														context: context, 
														initialDate: state.model.birthdate, 
														firstDate: DateTime.now().subtract(const Duration(days: 2022 * 365)), 
														lastDate: DateTime.now().subtract(const Duration(days: 1))
													);
													if (selectedDate != null) {
														bloc.update(cb: (model) { model.birthdate = selectedDate; });
														birthdateController.text = "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
													};
												},
												controller: birthdateController,
										),
									),
									Padding(
										padding: const EdgeInsets.all(16.0),
										child: InputTextComponent(
												icon: Icons.email,
												placelholder: "Enter email",
												obscure: false,
												validator: (_) => state.errors["email"],
												controller: emailController
										),
									),
									Padding(
										padding: const EdgeInsets.all(16.0),
										child: InputTextComponent(
												icon: Icons.lock,
												placelholder: "Enter password",
												validator: (_) => state.errors["password"],
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
												if (formState.currentState!.validate()) {
													await bloc.save();
												}
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
