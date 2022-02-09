import 'package:flutter_bloc_architecture/src/model/postulation.dart';

abstract class PostulationsRepositoryBase {
  Future<List<Postulation>> topHeadlines();
}
