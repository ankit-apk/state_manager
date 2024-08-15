import 'package:state_manager_example/features/people/data/model/employee_model.dart';

abstract class EmployeeRepository {
  Future<EmployeeModel> getEmployees();
}
