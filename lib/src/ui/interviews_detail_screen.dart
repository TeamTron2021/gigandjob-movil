import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/model/interview.dart';
import 'package:url_launcher/url_launcher.dart';


class InterviewsDetailScreen extends StatelessWidget {
  static Widget create(Object interview) => InterviewsDetailScreen(interview: interview as Interview);

  final Interview interview;

  const InterviewsDetailScreen({Key? key, required this.interview}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Details'),
      ),
      body: Column(
        children: [

          Text(
            '${interview.title}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text('${interview.title}'),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => launch(interview.title),
            child: Text('Ver mas'),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
