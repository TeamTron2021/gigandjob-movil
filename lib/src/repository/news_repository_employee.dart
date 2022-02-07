import 'package:flutter_bloc_architecture/src/model/employee.dart';

abstract class EmployeeNewsRepositoryBase {
  Future<List<Employee>> topHeadlines();
}
