import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/data_provider/postulations_provider.dart';
import 'package:flutter_bloc_architecture/src/model/postulation.dart';
import 'package:flutter_bloc_architecture/src/repository/postulations_repository.dart';

class PostulationsCubit extends Cubit<PostulationsState> {
  /// El repositorio debe ser inyectado al cubit
  final PostulationsRepositoryBase _repository;

  PostulationsCubit(this._repository) : super(PostulationsInitialState());

  /// La capa de presentacion sera quien llame a esta funcion
  Future<void> loadTopPostulations() async {
    try {
      /// Enviamos un nuevo estado a la capa de presentacion para decirle que estamos cargando las noticias
      emit(PostulationsLoadingState());

      /// Cargamos las noticias desde el repositorio
      final postulations = await _repository.topHeadlines();

      /// Enviamos un nuevo estado a la capa de presentacion para decirle que cargamos correctamente y
      /// tiene que mostar el listado
      emit(PostulationsLoadCompleteState(postulations));
    } on Exception catch (e) {
      /// En caso de cualquier excepcion la atrapamos y enviamos un nuevo estado a la capa de presentacion
      if (e is MissingApiKeyException) {
        emit(PostulationsErrorState('Please check the API key'));
      } else if (e is ApiKeyInvalidException) {
        emit(PostulationsErrorState('La api Key no es valida'));
      } else {
        emit(PostulationsErrorState('Unknown error'));
      }
    }
  }
}

abstract class PostulationsState extends Equatable {
  @override
  List<Object> get props => [];
}

/// Estado inicial.
class PostulationsInitialState extends PostulationsState {}

/// En este estado estamos haciendo la peticion a la REST API
class PostulationsLoadingState extends PostulationsState {}

/// En este estado la REST API a respondido correctamente una lista de 'Articles'
class PostulationsLoadCompleteState extends PostulationsState {
  final List<Postulation> postulations;

  PostulationsLoadCompleteState(this.postulations);

  @override
  List<Object> get props => [postulations];
}

/// En este estado la peticion a la REST API tuvo un error
class PostulationsErrorState extends PostulationsState {
  final String message;

  PostulationsErrorState(this.message);

  @override
  List<Object> get props => [message];
}
