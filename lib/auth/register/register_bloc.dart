import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/auth/register/register_model.dart';
import 'package:gigandjob_movil/auth/register/register_repository.dart';

enum RegisterCubitStateStatus {
	Idle,
	Invalid,
	InProgress,
	Success,
	Failure
}

class RegisterCubitState {
	final RegisterModel model;
	final RegisterCubitStateStatus status;

	const RegisterCubitState({
		required this.model, 
	}): status = RegisterCubitStateStatus.Idle;

	const RegisterCubitState._({
		required this.model, 
		required this.status
	});

	invalid() => RegisterCubitState._(model: model, status: RegisterCubitStateStatus.Invalid);
	success() => RegisterCubitState._(model: model, status: RegisterCubitStateStatus.Success);
	inProgress() => RegisterCubitState._(model: model, status: RegisterCubitStateStatus.InProgress);
	failure() => RegisterCubitState._(model: model, status: RegisterCubitStateStatus.Failure);
}

class RegisterCubit extends Cubit<RegisterCubitState> {
	RegisterRepository repository;
	RegisterCubit({ required this.repository }): super(RegisterCubitState(model: RegisterModel.empty()));

	save() async {
		if (state.status != RegisterCubitStateStatus.Invalid ||
			state.status != RegisterCubitStateStatus.InProgress) {

			emit(state.inProgress());
			await repository.save(state.model);
			emit(state.success());
		}
	}

	Map<String, String> update(void Function(RegisterModel model) cb) {
		cb(state.model);
		Map<String, String> errors = {};

		if (state.model.firstname.trim().isEmpty) errors["firstname"] = "The firstname cannot be empty";
		if (state.model.lastname.trim().isEmpty) errors["lastname"] = "The lastname cannot be empty";
		if (state.model.email.trim().isEmpty) errors["email"] = "The email cannot be empty";
		if (state.model.password.trim().isEmpty) errors["password"] = "The password cannot be empty";
		if (state.model.password.length < 8) errors["password"] = "The password cannot be less than 8 characters";
		if (state.model.birthdate.isAfter(DateTime.now())) errors["brithdate"] = "The birthday cannot be after today";

		return errors;
	}
}
