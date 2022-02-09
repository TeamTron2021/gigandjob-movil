import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/bloc/postulations_cubit.dart';
import 'package:flutter_bloc_architecture/src/model/postulation.dart';
import 'package:flutter_bloc_architecture/src/navigation/routes.dart';
import 'package:flutter_bloc_architecture/src/repository/postulations_repository.dart';

class PostulationsScreen extends StatelessWidget {
  static Widget create(BuildContext context) {
    /// Inyectamos el Cubit al Widget PostulationsScreen
    return BlocProvider<PostulationsCubit>(
      /// Inicializamos el cubit y cargamos las noticias
      create: (_) => PostulationsCubit(context.read<PostulationsRepositoryBase>())..loadTopPostulations(),
      child: PostulationsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Postulations'),
      ),
      body: BlocBuilder<PostulationsCubit, PostulationsState>(
        builder: (context, state) {
          if (state is PostulationsLoadCompleteState) {
            /// Cuando las noticias cargaron exitosamente
            return ListView.builder(
              itemCount: state.postulations.length,
              itemBuilder: (_, int index) => _ListItemPostulation(postulation: state.postulations[index]),
            );
          } else if (state is PostulationsErrorState) {
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

class _ListItemPostulation extends StatelessWidget {
  final Postulation postulation;

  const _ListItemPostulation({
    Key? key,
    required this.postulation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Card(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [

            Text(
              '${postulation.date}',
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('${postulation.date}', maxLines: 3),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
