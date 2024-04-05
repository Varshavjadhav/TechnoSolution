import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:techosolution/constant/api/api_endpoints.dart';

import '../constant/api/api_exception.dart';
import '../constant/api/api_manager.dart';
import '../constant/utils/failure.dart';
import '../models/emp_models.dart';

class EmployeeService {
  final _apiManager = ApiManager();

  Future<Either<Failure, EmployeeDetails>> updateEmpData(
    Map<String, dynamic> parameter,
    int? empId,
  ) async {
    try {
      var jsonResponse = await _apiManager.put(
        "${ApiEndPoints.updateEmpDetails}/$empId",
        parameter,
      );
      var response = EmployeeDetails.fromJson(jsonResponse);
      log("${jsonResponse.toString()}---------------------------------");
      log(response.toString());
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
