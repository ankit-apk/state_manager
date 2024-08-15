import 'package:http/http.dart' as http;

import '../model/employee_model.dart';

class ApiService {
  static const String baseUrl = "https://dummy.restapiexample.com/api/v1/";
  static const String employeesUrl = "$baseUrl/employees"; // GET

  Future<EmployeeModel> getEmployees() async {
    final response = await http.get(Uri.parse(employeesUrl));
    if (response.statusCode == 200) {
      return employeeModelFromJson(response.body);
    } else {
      throw Exception("Failed to load employees");
    }
  }
}
