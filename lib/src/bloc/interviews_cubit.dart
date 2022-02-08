import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/data_provider/interviews_provider.dart';
import 'package:flutter_bloc_architecture/src/model/interview.dart';
import 'package:flutter_bloc_architecture/src/repository/interviews_repository.dart';

class InterviewsCubit extends Cubit<InterviewsState> {
  /// El repositorio debe ser inyectado al cubit
  final InterviewsRepositoryBase _repository;

  InterviewsCubit(this._repository) : super(InterviewsInitialState());

  /// La capa de presentacion sera quien llame a esta funcion
  Future<void> loadTopInterviews() async {
    try {
      /// Enviamos un nuevo estado a la capa de presentacion para decirle que estamos cargando las noticias
      emit(InterviewsLoadingState());

      /// Cargamos las noticias desde el repositorio
      final interviews = await _repository.topHeadlines();

      /// Enviamos un nuevo estado a la capa de presentacion para decirle que cargamos correctamente y
      /// tiene que mostar el listado
      emit(InterviewsLoadCompleteState(interviews));
    } on Exception catch (e) {
      /// En caso de cualquier excepcion la atrapamos y enviamos un nuevo estado a la capa de presentacion
      if (e is MissingApiKeyException) {
        emit(InterviewsErrorState('Please check the API key'));
      } else if (e is ApiKeyInvalidException) {
        emit(InterviewsErrorState('La api Key no es valida'));
      } else {
        emit(InterviewsErrorState('Unknown error'));
      }
    }
  }
}

abstract class InterviewsState extends Equatable {
  @override
  List<Object> get props => [];
}

/// Estado inicial.
class InterviewsInitialState extends InterviewsState {}

/// En este estado estamos haciendo la peticion a la REST API
class InterviewsLoadingState extends InterviewsState {}

/// En este estado la REST API a respondido correctamente una lista de 'Articles'
class InterviewsLoadCompleteState extends InterviewsState {
  final List<Interview> interviews;

  InterviewsLoadCompleteState(this.interviews);

  @override
  List<Object> get props => [interviews];
}

/// En este estado la peticion a la REST API tuvo un error
class InterviewsErrorState extends InterviewsState {
  final String message;

  InterviewsErrorState(this.message);

  @override
  List<Object> get props => [message];
}
