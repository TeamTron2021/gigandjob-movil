import 'package:flutter_bloc_architecture/src/model/interview.dart';

abstract class InterviewsRepositoryBase {
  Future<List<Interview>> topHeadlines();
}
