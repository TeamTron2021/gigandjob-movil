import 'package:flutter_bloc_architecture/src/data_provider/news_provider_employee.dart';
import 'package:flutter_bloc_architecture/src/model/employee.dart';
import 'package:flutter_bloc_architecture/src/repository/news_repository_employee.dart';

class EmployeeNewsRepository extends EmployeeNewsRepositoryBase {
  final EmployeeNewsProvider _provider;

  EmployeeNewsRepository(this._provider);

  @override
  Future<List<Employee>> topHeadlines() => _provider.topHeadlines();
}
