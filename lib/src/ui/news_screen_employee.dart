import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/bloc/news_cubit_employee.dart';
import 'package:flutter_bloc_architecture/src/model/employee.dart';
import 'package:flutter_bloc_architecture/src/navigation/routes.dart';
import 'package:flutter_bloc_architecture/src/repository/news_repository_employee.dart';

class EmployeeNewsScreen extends StatelessWidget {
  static Widget create(BuildContext context) {
    /// Inyectamos el Cubit al Widget NewsScreen
    return BlocProvider<EmployeeNewsCubit>(
      /// Inicializamos el cubit y cargamos las noticias
      create: (_) => EmployeeNewsCubit(context.read<EmployeeNewsRepositoryBase>())..loadTopNews(),
      child: EmployeeNewsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top news'),
      ),
      body: BlocBuilder<EmployeeNewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadCompleteState) {
            /// Cuando las noticias cargaron exitosamente
            return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (_, int index) => _ListItemEmployee(employee: state.news[index]),
            );
          } else if (state is NewsErrorState) {
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

class _ListItemEmployee extends StatelessWidget {
  final Employee employee;

  const _ListItemEmployee({
    Key? key,
    required this.employee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.newsDetails, arguments: employee),
      child: Card(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [

            Text(
              '${employee.companyMail}',
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('${employee.companyMail}', maxLines: 3),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
