import 'package:gigandjob_movil/interviews/api/Interview.api.dart';
import 'package:gigandjob_movil/interviews/models/interview.model.dart';

abstract class IInterviewRepository {
  Future<List<Interview>> headline();
}

class InterviewRepository extends IInterviewRepository {
  final InterviewApiProvider _apiProvider;

  InterviewRepository(this._apiProvider);

  @override
  Future<List<Interview>> headline() async {
    List collection = await _apiProvider.headline();
    return collection.map((json) => Interview.fromJson(json)).toList();
  }
}