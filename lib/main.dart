import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/app.dart';
import 'package:flutter_bloc_architecture/src/data_provider/interviews_provider.dart';
import 'package:flutter_bloc_architecture/src/repository/implementation/interviews_repository.dart';
import 'package:flutter_bloc_architecture/src/repository/interviews_repository.dart';

import 'package:flutter_bloc_architecture/src/data_provider/postulations_provider.dart';
import 'package:flutter_bloc_architecture/src/repository/implementation/postulations_repository.dart';
import 'package:flutter_bloc_architecture/src/repository/postulations_repository.dart';

void main() async {
  /// El provider y repository solo sera inicializado solo una vez.
  final interviewsProvider = InterviewsProvider();
  final interviewsRepository = InterviewsRepository(interviewsProvider);

  final postulationsProvider = PostulationsProvider();
  final postulationsRepository = PostulationsRepository(postulationsProvider);

  /// Inyectamos el repository al arbol de widgets.
  runApp(
    RepositoryProvider<InterviewsRepositoryBase>(
      create: (_) => interviewsRepository,
      child: MyApp(),
    ),

  );

}
