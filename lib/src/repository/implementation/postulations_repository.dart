import 'package:flutter_bloc_architecture/src/data_provider/postulations_provider.dart';
import 'package:flutter_bloc_architecture/src/model/postulation.dart';
import 'package:flutter_bloc_architecture/src/repository/postulations_repository.dart';

class PostulationsRepository extends PostulationsRepositoryBase {
  final PostulationsProvider _provider;

  PostulationsRepository(this._provider);

  @override
  Future<List<Postulation>> topHeadlines() => _provider.topHeadlines();
}
