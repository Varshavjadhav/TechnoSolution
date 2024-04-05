import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:techosolution/routes/routes.locator.dart';
import 'package:techosolution/routes/routes.router.dart';

@lazySingleton
class SplashViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  void handleSplashView() {
    Timer(const Duration(seconds: 3), () {
      navigationService.clearStackAndShow(Routes.employeeView);
    });
  }
}
