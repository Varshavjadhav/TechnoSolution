import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:techosolution/view/splash/spalsh_view_model.dart';

import '../../constant/app_color.dart';
import '../../constant/app_images.dart';
import '../../constant/app_string.dart';
import '../../widgets/text_widget.dart';

@lazySingleton
class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onViewModelReady: (model) async {
        model.handleSplashView();
      },
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                splashImages,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(
                      radius: 120, backgroundImage: AssetImage(technoImage)),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextWidget(
                    text: splashtext,
                    fontSize: 20.sp,
                    color: ConstColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
