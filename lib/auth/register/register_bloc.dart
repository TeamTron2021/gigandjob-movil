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
	late Map<String, String> errors;

	RegisterCubitState({
		required this.model, 
	}): status = RegisterCubitStateStatus.Idle {
		errors = {};
	}

	RegisterCubitState._({
		required this.model, 
		required this.status,
		required this.errors
	});

	invalid(Map<String, String> errors) => RegisterCubitState._(model: model, status: RegisterCubitStateStatus.Invalid, errors: errors);
	success() => RegisterCubitState._(model: model, status: RegisterCubitStateStatus.Success, errors: {});
	inProgress() => RegisterCubitState._(model: model, status: RegisterCubitStateStatus.InProgress, errors: {});
	failure() => RegisterCubitState._(model: model, status: RegisterCubitStateStatus.Failure, errors: {});
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

	update({ void Function(RegisterModel model)? cb }) {
		if (cb != null) cb(state.model);
		Map<String, String> errors = {};
		final now = DateTime.now();

		if (state.model.firstname.trim().isEmpty) errors["firstname"] = "The firstname cannot be empty";
		if (state.model.lastname.trim().isEmpty) errors["lastname"] = "The lastname cannot be empty";
		if (state.model.email.trim().isEmpty) errors["email"] = "The email cannot be empty";
		if (state.model.password.trim().isEmpty) errors["password"] = "The password cannot be empty";
		if (state.model.password.length < 8) errors["password"] = "The password cannot be less than 8 characters";
		if (state.model.birthdate.isAfter(now) ||
			(state.model.birthdate.year == now.year &&
			 state.model.birthdate.month == now.month && 
			 state.model.birthdate.day == now.day)) errors["birthdate"] = "The birthday cannot be after today";

		emit(state.invalid(errors));
	}
}
