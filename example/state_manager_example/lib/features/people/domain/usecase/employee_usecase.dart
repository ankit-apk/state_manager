import '../../data/model/employee_model.dart';
import '../../data/repository/employee_repository_impl.dart';
import '../repository/employee_repository.dart';

class EmployeeUsecase {
  Future<EmployeeModel> getEmployees() async {
    EmployeeRepository employeeRepository = EmployeeRepositoryImpl();
    return await employeeRepository.getEmployees();
  }
}
