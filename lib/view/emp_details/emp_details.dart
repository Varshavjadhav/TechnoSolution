import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:techosolution/constant/app_string.dart';
import 'package:techosolution/widgets/text_widget.dart';
import '../../constant/app_color.dart';
import '../../models/emp_models.dart';
import '../emp_list_view/emp_view_model.dart';

@lazySingleton
class EmployeeDetailsView extends StatelessWidget {
  final int? employeeId;
  final EmployeeDetails? employeeDetails;

  const EmployeeDetailsView({Key? key, this.employeeId, this.employeeDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployeeViewModel>.reactive(
      viewModelBuilder: () => EmployeeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: TextWidget(
            text: empViewText,
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
          backgroundColor: kblackColor,
        ),
        body: model.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextWidget(
                          text:
                              'Employee Name: ${employeeDetails?.employeeName}',
                          fontSize: 14.sp,
                          color: kblackColor,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextWidget(
                          text: 'Salary: ${employeeDetails?.employeeSalary}',
                          fontSize: 14.sp,
                          color: kblackColor,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextWidget(
                          text: 'Age: ${employeeDetails?.employeeAge}',
                          fontSize: 14.sp,
                          color: kblackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
