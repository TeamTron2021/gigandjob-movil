import 'package:flutter_bloc_architecture/src/data_provider/interview_provider.dart';
import 'package:flutter_bloc_architecture/src/model/interview.dart';
import 'package:flutter_bloc_architecture/src/repository/interview_repository.dart';

class InterviewsRepository extends InterviewsRepositoryBase {
  final InterviewsProvider _provider;

  InterviewsRepository(this._provider);

  @override
  Future<List<Interview>> topHeadlines() => _provider.topHeadlines();
}
