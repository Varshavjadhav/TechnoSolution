import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSize {
  static double getPhoneSize(double size) {
    return size * (ScreenUtil().screenWidth / 428);
  }

  static double getWebSize(double size) {
    return size * (ScreenUtil().screenWidth / 1920);
  }
}

// --- vertical spacing ---
const SizedBox xxsHeightSpan = SizedBox(height: 2);
const SizedBox xsHeightSpan = SizedBox(height: 4);
const SizedBox sHeightSpan = SizedBox(height: 10);
const SizedBox mHeightSpan = SizedBox(height: 16);
const SizedBox lHeightSpan = SizedBox(height: 24);
const SizedBox llHeightSpan = SizedBox(height: 30);
const SizedBox xlHeightSpan = SizedBox(height: 48);
const SizedBox xxlHeightSpan = SizedBox(height: 58);

// --- horizontal spacing ---
const SizedBox xsWidthSpan = SizedBox(width: 4);
const SizedBox sWidthSpan = SizedBox(width: 10);
const SizedBox mWidthSpan = SizedBox(width: 16);
const SizedBox lWidthSpan = SizedBox(width: 24);
const SizedBox xlWidthSpan = SizedBox(width: 48);

// --- page paddings ----
const EdgeInsets sPagePadding = EdgeInsets.all(16);
const EdgeInsets sXPagePadding = EdgeInsets.symmetric(horizontal: 16);
const EdgeInsets sYPagePadding = EdgeInsets.symmetric(vertical: 16);
const EdgeInsets mPagePadding =
    EdgeInsets.symmetric(horizontal: 24, vertical: 16);
const EdgeInsets mXPagePadding = EdgeInsets.symmetric(horizontal: 32);
const EdgeInsets mYPagePadding = EdgeInsets.symmetric(vertical: 32);
const EdgeInsets lPagePadding = EdgeInsets.symmetric(horizontal: 64);

// container padding
const EdgeInsets xsPadding = EdgeInsets.symmetric(horizontal: 5, vertical: 5);
const EdgeInsets xsXPadding = EdgeInsets.symmetric(horizontal: 5);
const EdgeInsets xsYPadding = EdgeInsets.symmetric(vertical: 5);
const EdgeInsets sPadding = EdgeInsets.symmetric(horizontal: 8, vertical: 8);
const EdgeInsets sXPadding = EdgeInsets.symmetric(horizontal: 8);
const EdgeInsets sYPadding = EdgeInsets.symmetric(vertical: 8);
const EdgeInsets mPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 12);
const EdgeInsets mXPadding = EdgeInsets.symmetric(horizontal: 12);
const EdgeInsets mYPadding = EdgeInsets.symmetric(vertical: 12);
const EdgeInsets lPadding = EdgeInsets.symmetric(horizontal: 18, vertical: 18);
const EdgeInsets lXPadding = EdgeInsets.symmetric(horizontal: 18);
const EdgeInsets lYPadding = EdgeInsets.symmetric(vertical: 18);
const EdgeInsets xlPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 18);
const EdgeInsets xlXPadding = EdgeInsets.symmetric(horizontal: 24);
const EdgeInsets xlYPadding = EdgeInsets.symmetric(vertical: 24);
const EdgeInsets sTopPadding = EdgeInsets.only(top: 5);
const EdgeInsets mTopPadding = EdgeInsets.only(top: 10);
const EdgeInsets xlTopPadding = EdgeInsets.only(top: 50);
const EdgeInsets sLeftPadding = EdgeInsets.only(left: 10);
