import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:techosolution/constant/app_color.dart';
import 'package:techosolution/view/emp_list_view/emp_view_model.dart';
import 'package:techosolution/widgets/text_widget.dart';

import '../../constant/app_string.dart';
import '../../models/emp_models.dart';
import '../../widgets/emp_widget.dart';

@lazySingleton
class EmployeeView extends StatelessWidget {
  const EmployeeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployeeViewModel>.reactive(
      viewModelBuilder: () => EmployeeViewModel(),
      onModelReady: (model) {
        model.getAllEmployeeList();
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
            title: TextWidget(
              text: empViewText,
              color: kWhiteColor,
              fontSize: 16.sp,
            ),
            actions: [
              model.isSearching
                  ? IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: kWhiteColor,
                      ),
                      onPressed: () {
                        model.toggleSearch(); 
                        model.filterEmployees(''); 
                      },
                    )
                  : IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: kWhiteColor,
                      ),
                      onPressed: () {
                        model.toggleSearch();
                      },
                    ),
            ],
            backgroundColor: kblackColor),
        body: Stack(
          children: [
            Column(
              children: [
                if (model.isSearching)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      cursorColor: kblackColor,
                      onChanged: (query) {
                        model.filterEmployees(query);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: model.isBusy
                      ? const Center(child: CircularProgressIndicator())
                      : Scrollbar(
                          child: ListView.builder(
                            itemCount: model.isSearching
                                ? model.filteredEmployeeList.length
                                : model.employeeList.length,
                            itemBuilder: (context, index) {
                              var employee = model.isSearching
                                  ? model.filteredEmployeeList[index]
                                  : model.employeeList[index];
                              var isSelected = model.selectedAlphabet != null &&
                                  employee.employeeName!
                                      .startsWith(model.selectedAlphabet!);
                              return GestureDetector(
                                onLongPress: () => showEditDeletePopup(
                                    context, model, employee),
                                child: EmployeeListViewItem(
                                  fullName: employee.employeeName ?? 'No Name',
                                  cardColor:
                                      isSelected ? kgreenColor : kWhiteColor,
                                  onTap: () =>
                                      model.gotoEmployeeDetailsView(employee),
                                ),
                              );
                            },
                          ),
                        ),
                ),
              ],
            ),
            if (!model.isSearching)
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: model
                      .generateAlphabets()
                      .map((alphabet) => InkWell(
                            onTap: () {
                              model.selectAlphabet(alphabet);
                            },
                            child: Text(
                              alphabet,
                              style: TextStyle(
                                color: model.selectedAlphabet == alphabet
                                    ? kgreenColor
                                    : kblackColor,
                                fontSize: model.selectedAlphabet == alphabet
                                    ? 20
                                    : 16,
                                fontWeight: model.selectedAlphabet == alphabet
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

void showEditDeletePopup(
    BuildContext context, EmployeeViewModel model, EmployeeDetails employee) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: kWhiteColor,
      title: Text('Edit/Delete Employee'),
      content: Text('Edit or delete ${employee.employeeName}?'),
      actions: [
        TextButton(
          onPressed: () {
            model.gotoEditEmployeeDetailsView(employee);
          },
          child: TextWidget(
            text: 'Edit',
            fontSize: 14.sp,
            color: kblackColor,
          ),
        ),
        TextButton(
          onPressed: () {
            model.deleteEmployee(employee.id ?? 0);
            Navigator.pop(context);
          },
          child: TextWidget(
            text: 'Delete',
            fontSize: 14.sp,
            color: kblackColor,
          ),
        ),
      ],
    ),
  );
}
