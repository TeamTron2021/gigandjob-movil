import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/data_provider/news_provider_employee.dart';
import 'package:flutter_bloc_architecture/src/model/employee.dart';
import 'package:flutter_bloc_architecture/src/repository/news_repository_employee.dart';

class EmployeeNewsCubit extends Cubit<NewsState> {
  /// El repositorio debe ser inyectado al cubit
  final EmployeeNewsRepositoryBase _repository;

  EmployeeNewsCubit(this._repository) : super(NewsInitialState());

  /// La capa de presentacion sera quien llame a esta funcion
  Future<void> loadTopNews({String country = 'us'}) async {
    try {
      /// Enviamos un nuevo estado a la capa de presentacion para decirle que estamos cargando las noticias
      emit(NewsLoadingState());

      /// Cargamos las noticias desde el repositorio
      final news = await _repository.topHeadlines();

      /// Enviamos un nuevo estado a la capa de presentacion para decirle que cargamos correctamente y
      /// tiene que mostar el listado
      emit(NewsLoadCompleteState(news));
    } on Exception catch (e) {
      /// En caso de cualquier excepcion la atrapamos y enviamos un nuevo estado a la capa de presentacion
      if (e is MissingApiKeyException) {
        emit(NewsErrorState('Please check the API key'));
      } else if (e is ApiKeyInvalidException) {
        emit(NewsErrorState('La api Key no es valida'));
      } else {
        emit(NewsErrorState('Unknown error'));
      }
    }
  }
}

abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

/// Estado inicial.
class NewsInitialState extends NewsState {}

/// En este estado estamos haciendo la peticion a la REST API
class NewsLoadingState extends NewsState {}

/// En este estado la REST API a respondido correctamente una lista de 'Articles'
class NewsLoadCompleteState extends NewsState {
  final List<Employee> news;

  NewsLoadCompleteState(this.news);

  @override
  List<Object> get props => [news];
}

/// En este estado la peticion a la REST API tuvo un error
class NewsErrorState extends NewsState {
  final String message;

  NewsErrorState(this.message);

  @override
  List<Object> get props => [message];
}
