import 'dart:convert';

class EmployeeResponseModel {
  String? status;
  List<EmployeeDetails>? data;
  String? message;

  EmployeeResponseModel({
    this.status,
    this.data,
    this.message,
  });

  EmployeeResponseModel copyWith({
    String? status,
    List<EmployeeDetails>? data,
    String? message,
  }) =>
      EmployeeResponseModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory EmployeeResponseModel.fromJson(String str) =>
      EmployeeResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EmployeeResponseModel.fromMap(Map<String, dynamic> json) =>
      EmployeeResponseModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<EmployeeDetails>.from(json["data"]!.map((x) => EmployeeDetails.fromMap(x))),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
      };
}

class EmployeeDetails {
  int? id;
  String? employeeName;
  int? employeeSalary;
  int? employeeAge;
  String? profileImage;

  EmployeeDetails({
    this.id,
    this.employeeName,
    this.employeeSalary,
    this.employeeAge,
    this.profileImage,
  });

  EmployeeDetails copyWith({
    int? id,
    String? employeeName,
    int? employeeSalary,
    int? employeeAge,
    String? profileImage,
  }) =>
      EmployeeDetails(
        id: id ?? this.id,
        employeeName: employeeName ?? this.employeeName,
        employeeSalary: employeeSalary ?? this.employeeSalary,
        employeeAge: employeeAge ?? this.employeeAge,
        profileImage: profileImage ?? this.profileImage,
      );

  factory EmployeeDetails.fromJson(String str) => EmployeeDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EmployeeDetails.fromMap(Map<String, dynamic> json) => EmployeeDetails(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "employee_name": employeeName,
        "employee_salary": employeeSalary,
        "employee_age": employeeAge,
        "profile_image": profileImage,
      };
}
