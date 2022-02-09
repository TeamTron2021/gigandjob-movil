import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/ui/interviews_detail_screen.dart';
import 'package:flutter_bloc_architecture/src/ui/interviews_screen.dart';

import 'package:flutter_bloc_architecture/src/ui/postulations_screen.dart';

/// Esta clase se encargara de administrar las rutas
class Routes {
  static const topNews = '/';
  static const postulations = '/postulations';
  static const interviewDetails = '/details';

  static Route routes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case topNews:
        return MaterialPageRoute(builder: (context) => InterviewsScreen.create(context));
      case postulations:
        return MaterialPageRoute(builder: (context) => PostulationsScreen.create(context));
      case interviewDetails:
        return MaterialPageRoute(builder: (_) => InterviewsDetailScreen.create(args!));
    }
    throw Exception('This route does not exists');
  }
}
