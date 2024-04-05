import 'package:flutter/material.dart';
import 'package:techosolution/constant/app_color.dart';
import 'package:techosolution/widgets/text_widget.dart';
import '../constant/app_sizes.dart';

class EmployeeListViewItem extends StatelessWidget {
  final String fullName;
  final VoidCallback? onTap;
  final Color? cardColor;

  const EmployeeListViewItem(
      {Key? key, required this.fullName, this.onTap, this.cardColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: cardColor ?? kWhiteColor,
      margin: EdgeInsets.all(AppSize.getPhoneSize(10)), 
      child: ListTile(
        onTap: onTap, 
        leading: CircleAvatar(
          backgroundColor: kblackColor,
          radius: AppSize.getPhoneSize(20), 
          child: Icon(Icons.person, color: kWhiteColor),
        ),
        title: TextWidget(
          text:fullName,
          fontSize: AppSize.getPhoneSize(16),
          
         
        ),
      ),
    );
  }
}
