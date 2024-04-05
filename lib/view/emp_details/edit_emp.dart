import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:techosolution/constant/app_string.dart';

import '../../constant/app_color.dart';
import '../../constant/app_sizes.dart';
import '../../models/emp_models.dart';
import '../../widgets/text_widget.dart';
import '../emp_list_view/emp_view_model.dart';

@lazySingleton
class EditEmployee extends StatelessWidget {
  final EmployeeDetails? employeeDetails;
  const EditEmployee({Key? key, this.employeeDetails}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployeeViewModel>.reactive(
      viewModelBuilder: () => EmployeeViewModel(),
      onViewModelReady: (model) async {
        model.initialize(employeeDetails);
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
            title: TextWidget(
              text: editemptext,
              color: kWhiteColor,
              fontSize: 16.sp,
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: kWhiteColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: kblackColor),
        backgroundColor: ConstColors.whiteColor,
        body: Padding(
          padding: mPadding,
          child: Column(
            children: <Widget>[
              lHeightSpan,
              TextFormField(
                controller: model.employeeNameController,
                decoration: const InputDecoration(
                  labelText: 'Employee Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              lHeightSpan,
              TextFormField(
                controller: model.employeeSalaryController,
                decoration: const InputDecoration(
                  labelText: 'Employee Salary',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              lHeightSpan,
              TextFormField(
                controller: model.employeeAgeController,
                decoration: const InputDecoration(
                  labelText: 'Employee Age',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              xlHeightSpan,
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    model.navigationService.back();
                    model.updateEmployeeById(employeeDetails?.id ?? 0);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black, 
                  ),
                  child: TextWidget(text: 'Save', fontSize: 20.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
