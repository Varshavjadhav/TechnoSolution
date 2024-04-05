// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;
import 'package:techosolution/models/emp_models.dart' as _i7;
import 'package:techosolution/view/emp_details/edit_emp.dart' as _i5;
import 'package:techosolution/view/emp_details/emp_details.dart' as _i4;
import 'package:techosolution/view/emp_list_view/emp_view.dart' as _i3;
import 'package:techosolution/view/splash/splash_view.dart' as _i2;

class Routes {
  static const splashView = '/';

  static const employeeView = '/employee-view';

  static const employeeDetailsView = '/employee-details-view';

  static const editEmployee = '/edit-employee';

  static const all = <String>{
    splashView,
    employeeView,
    employeeDetailsView,
    editEmployee,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.employeeView,
      page: _i3.EmployeeView,
    ),
    _i1.RouteDef(
      Routes.employeeDetailsView,
      page: _i4.EmployeeDetailsView,
    ),
    _i1.RouteDef(
      Routes.editEmployee,
      page: _i5.EditEmployee,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      final args = data.getArgs<SplashViewArguments>(
        orElse: () => const SplashViewArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.SplashView(key: args.key),
        settings: data,
      );
    },
    _i3.EmployeeView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.EmployeeView(),
        settings: data,
      );
    },
    _i4.EmployeeDetailsView: (data) {
      final args = data.getArgs<EmployeeDetailsViewArguments>(
        orElse: () => const EmployeeDetailsViewArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.EmployeeDetailsView(
            key: args.key,
            employeeId: args.employeeId,
            employeeDetails: args.employeeDetails),
        settings: data,
      );
    },
    _i5.EditEmployee: (data) {
      final args = data.getArgs<EditEmployeeArguments>(
        orElse: () => const EditEmployeeArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.EditEmployee(
            key: args.key, employeeDetails: args.employeeDetails),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class SplashViewArguments {
  const SplashViewArguments({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SplashViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class EmployeeDetailsViewArguments {
  const EmployeeDetailsViewArguments({
    this.key,
    this.employeeId,
    this.employeeDetails,
  });

  final _i6.Key? key;

  final int? employeeId;

  final _i7.EmployeeDetails? employeeDetails;

  @override
  String toString() {
    return '{"key": "$key", "employeeId": "$employeeId", "employeeDetails": "$employeeDetails"}';
  }

  @override
  bool operator ==(covariant EmployeeDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.employeeId == employeeId &&
        other.employeeDetails == employeeDetails;
  }

  @override
  int get hashCode {
    return key.hashCode ^ employeeId.hashCode ^ employeeDetails.hashCode;
  }
}

class EditEmployeeArguments {
  const EditEmployeeArguments({
    this.key,
    this.employeeDetails,
  });

  final _i6.Key? key;

  final _i7.EmployeeDetails? employeeDetails;

  @override
  String toString() {
    return '{"key": "$key", "employeeDetails": "$employeeDetails"}';
  }

  @override
  bool operator ==(covariant EditEmployeeArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.employeeDetails == employeeDetails;
  }

  @override
  int get hashCode {
    return key.hashCode ^ employeeDetails.hashCode;
  }
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToSplashView({
    _i6.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.splashView,
        arguments: SplashViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEmployeeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.employeeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEmployeeDetailsView({
    _i6.Key? key,
    int? employeeId,
    _i7.EmployeeDetails? employeeDetails,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.employeeDetailsView,
        arguments: EmployeeDetailsViewArguments(
            key: key, employeeId: employeeId, employeeDetails: employeeDetails),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditEmployee({
    _i6.Key? key,
    _i7.EmployeeDetails? employeeDetails,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editEmployee,
        arguments:
            EditEmployeeArguments(key: key, employeeDetails: employeeDetails),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView({
    _i6.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.splashView,
        arguments: SplashViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEmployeeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.employeeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEmployeeDetailsView({
    _i6.Key? key,
    int? employeeId,
    _i7.EmployeeDetails? employeeDetails,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.employeeDetailsView,
        arguments: EmployeeDetailsViewArguments(
            key: key, employeeId: employeeId, employeeDetails: employeeDetails),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditEmployee({
    _i6.Key? key,
    _i7.EmployeeDetails? employeeDetails,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editEmployee,
        arguments:
            EditEmployeeArguments(key: key, employeeDetails: employeeDetails),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
