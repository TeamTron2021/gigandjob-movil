import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/app.dart';
import 'package:flutter_bloc_architecture/src/data_provider/interviews_provider.dart';
import 'package:flutter_bloc_architecture/src/repository/implementation/interviews_repository.dart';
import 'package:flutter_bloc_architecture/src/repository/interviews_repository.dart';


void main() async {
  /// El provider y repository solo sera inicializado solo una vez.
  final interviewsProvider = InterviewProvider();
  final interviewsRepository = InterviewRepository(interviewsProvider);

  /// Inyectamos el repository al arbol de widgets.
  runApp(
    RepositoryProvider<InterviewRepositoryBase>(
      create: (_) => interviewsRepository,
      child: MyApp(),
    ),
  );
}
