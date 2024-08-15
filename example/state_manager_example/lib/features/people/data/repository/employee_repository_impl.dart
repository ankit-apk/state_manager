import '../../domain/repository/employee_repository.dart';
import '../api_service/api_service.dart';
import '../model/employee_model.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  @override
  Future<EmployeeModel> getEmployees() async {
    ApiService apiService = ApiService();
    return await apiService.getEmployees();
  }
}
