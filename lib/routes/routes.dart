import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:techosolution/view/splash/splash_view.dart';
import '../view/emp_details/edit_emp.dart';
import '../view/emp_details/emp_details.dart';
import '../view/emp_list_view/emp_view.dart';
import '../view/emp_list_view/emp_view_model.dart';
import '../view/splash/spalsh_view_model.dart';

@StackedApp(logger: StackedLogger(), routes: <StackedRoute>[
  MaterialRoute(
    page: SplashView,
    initial: true,
  ),
  MaterialRoute(
    page: EmployeeView,
  ),
  MaterialRoute(
    page: EmployeeDetailsView,
  ),
    MaterialRoute(
    page: EditEmployee,
  ),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: SplashViewModel),
  LazySingleton(classType: EmployeeViewModel),
])
class AppSetup {}
