import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/bloc/interviews_cubit.dart';
import 'package:flutter_bloc_architecture/src/model/interview.dart';
import 'package:flutter_bloc_architecture/src/navigation/routes.dart';
import 'package:flutter_bloc_architecture/src/repository/interviews_repository.dart';

class InterviewsScreen extends StatelessWidget {
  static Widget create(BuildContext context) {
    /// Inyectamos el Cubit al Widget InterviewsScreen
    return BlocProvider<InterviewsCubit>(
      /// Inicializamos el cubit y cargamos las noticias
      create: (_) => InterviewsCubit(context.read<InterviewsRepositoryBase>())..loadTopInterviews(),
      child: InterviewsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Interviews'),
      ),
      body: BlocBuilder<InterviewsCubit, InterviewsState>(
        builder: (context, state) {
          if (state is InterviewsLoadCompleteState) {
            /// Cuando las noticias cargaron exitosamente
            return ListView.builder(
              itemCount: state.interviews.length,
              itemBuilder: (_, int index) => _ListItemInterview(interview: state.interviews[index]),
            );
          } else if (state is InterviewsErrorState) {
            /// Cuando hubo un error al cargas las noticias
            return Text(state.message);
          } else {
            /// Cuando estamos cargando las noticias
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class _ListItemInterview extends StatelessWidget {
  final Interview interview;

  const _ListItemInterview({
    Key? key,
    required this.interview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.interviewDetails, arguments: interview),
      child: Card(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [

            Text(
              '${interview.title}',
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('${interview.title}', maxLines: 3),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
