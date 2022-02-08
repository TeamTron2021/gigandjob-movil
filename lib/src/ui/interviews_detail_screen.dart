import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/model/article.dart';
import 'package:flutter_bloc_architecture/src/model/employee.dart';
import 'package:url_launcher/url_launcher.dart';


class EmployeeNewsDetailScreen extends StatelessWidget {
  static Widget create(Object employee) => EmployeeNewsDetailScreen(employee: employee as Employee);

  final Employee employee;

  const EmployeeNewsDetailScreen({Key? key, required this.employee}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Details'),
      ),
      body: Column(
        children: [

          Text(
            '${employee.companyMail}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text('${employee.companyMail}'),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => launch(employee.companyMail),
            child: Text('Ver mas'),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
