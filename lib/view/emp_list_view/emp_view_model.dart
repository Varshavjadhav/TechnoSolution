import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../constant/api/api_endpoints.dart';
import '../../constant/api/api_exception.dart';
import '../../constant/api/api_manager.dart';
import '../../models/emp_models.dart';
import '../../routes/routes.locator.dart';
import '../../routes/routes.router.dart';

@lazySingleton
class EmployeeViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();

  final _apiManager = ApiManager();

  List<EmployeeDetails> _employeeList = [];
  List<EmployeeDetails> get employeeList => _employeeList;

  List<EmployeeDetails> _filteredEmployeeList = [];
  List<EmployeeDetails> get filteredEmployeeList => _filteredEmployeeList;

  String? _selectedAlphabet; // Track the selected alphabet
  String? get selectedAlphabet => _selectedAlphabet;
  bool _isSearching = false;
  bool get isSearching => _isSearching;

  void toggleSearch() {
    _isSearching = !_isSearching;
    if (_isSearching) {
      _selectedAlphabet = null;
    }
    notifyListeners();
  }

  List<String> generateAlphabets() {
    return List.generate(26, (index) => String.fromCharCode(index + 65));
  }

  TextEditingController _employeeNameController = TextEditingController();
  TextEditingController _employeeSalaryController = TextEditingController();
  TextEditingController _employeeAgeController = TextEditingController();

  TextEditingController get employeeNameController => _employeeNameController;
  TextEditingController get employeeSalaryController =>
      _employeeSalaryController;
  TextEditingController get employeeAgeController => _employeeAgeController;

  void initialize(EmployeeDetails? employeeDetails) {
    if (employeeDetails != null) {
      employeeNameController.text = employeeDetails.employeeName ?? '';
      employeeSalaryController.text =
          employeeDetails.employeeSalary?.toString() ?? '';
      employeeAgeController.text =
          employeeDetails.employeeAge?.toString() ?? '';
    }
  }

  Future<void> getAllEmployeeList() async {
    try {
      var response = await _apiManager.get(ApiEndPoints.employeeList);
      print(response);

      var jsonData = response;

      if (jsonData['status'] == 'success') {
        var dataList = jsonData['data'] as List;
        _employeeList =
            dataList.map((item) => EmployeeDetails.fromMap(item)).toList();

        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching employee list: $error');
    } finally {
      notifyListeners();
    }
  }

  Future gotoEmployeeDetailsView(EmployeeDetails emp) async {
    await navigationService.navigateTo(Routes.employeeDetailsView,
        arguments: EmployeeDetailsViewArguments(
          employeeDetails: emp,
        ));
  }

  Future gotoEditEmployeeDetailsView(EmployeeDetails emp) async {
    await navigationService.clearTillFirstAndShow(Routes.editEmployee,
        arguments: EditEmployeeArguments(
          employeeDetails: emp,
        ));
  }

  void selectAlphabet(String alphabet) {
    _selectedAlphabet = alphabet;
    notifyListeners();
  }

  List<EmployeeDetails> getFilteredEmployeeList() {
    if (_selectedAlphabet == null) {
      return _employeeList;
    } else {
      // Get employees whose names start with the selected alphabet
      List<EmployeeDetails> filteredList = _employeeList
          .where((employee) =>
              employee.employeeName!.startsWith(_selectedAlphabet!))
          .toList();

      // Get remaining employees
      List<EmployeeDetails> remainingList = _employeeList
          .where((employee) =>
              !employee.employeeName!.startsWith(_selectedAlphabet!))
          .toList();

      // Combine and return the two lists
      return filteredList..addAll(remainingList);
    }
  }

  void filterEmployees(String query) {
    if (query.isEmpty) {
      _filteredEmployeeList = _employeeList;
    } else if (RegExp(r'^[a-zA-Z]$').hasMatch(query)) {
      _filteredEmployeeList = _employeeList
          .where((employee) => employee.employeeName!
              .toLowerCase()
              .startsWith(query.toLowerCase()))
          .toList();
    } else {
      _filteredEmployeeList = _employeeList
          .where((employee) => employee.employeeName!
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<void> updateEmployeeById(int id) async {
    try {
      String employeeName = employeeNameController.text;
      int employeeSalary = int.tryParse(employeeSalaryController.text) ?? 0;
      int employeeAge = int.tryParse(employeeAgeController.text) ?? 0;

      Map<String, dynamic> updatedData = {
        "name": employeeName,
        "salary": employeeSalary,
        "age": employeeAge,
      };
      var response = await _apiManager.put(
          '${ApiEndPoints.updateEmpDetails}/$id', updatedData);

      if (response != null) {
        EmployeeDetails updatedEmployee = EmployeeDetails(
          id: id,
          employeeName: employeeName,
          employeeSalary: employeeSalary,
          employeeAge: employeeAge,
        );
        int index = _employeeList.indexWhere((emp) => emp.id == id);
        if (index != -1) {
          _employeeList[index] = updatedEmployee;
        }
        await navigationService.back();
      } else {
        throw Exception('Failed to update employee details');
      }
    } catch (error) {
      print('Error updating employee details: $error');
    }
  }

  Future<void> deleteEmployee(int id) async {
    try {
      final response =
          await _apiManager.delete("${ApiEndPoints.deleteEmpDetails}/$id");

      if (response != null) {
        print('Employee with ID $id deleted successfully');
      } else {
        print('Failed to delete employee with ID $id');
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print('Error deleting employee: $e');
    }
  }
}
