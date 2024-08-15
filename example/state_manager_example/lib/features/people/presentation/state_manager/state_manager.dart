import 'package:state_manager/state_manager.dart';

import '../../data/model/employee_model.dart';
import '../../domain/usecase/employee_usecase.dart';

class EmployeeStateManager extends AsyncStateContainer<EmployeeModel> {
  final EmployeeUsecase _employeeUsecase = EmployeeUsecase();

  EmployeeStateManager() : super();

  Future<void> fetchEmployees() async {
    setState(_fetchEmployeesLogic());
  }

  Future<EmployeeModel> _fetchEmployeesLogic() async {
    try {
      return await _employeeUsecase.getEmployees();
    } catch (e) {
      throw Exception("Failed to fetch employees: $e");
    }
  }
}
