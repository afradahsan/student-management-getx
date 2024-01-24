import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp_getx/view/widgets/textfeild.dart';
import 'package:studentapp_getx/view_model/StudentViewModel.dart';

import '../model/StudentModel.dart';

class EditStduent extends GetView<StudentViewModel> {
  EditStduent({super.key, required this.student});
  final StudentModel student;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController batchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final StudentViewModel controller = Get.put(StudentViewModel());
  final StudentViewModel studentViewModel = StudentViewModel();

  initializingValues() {
    nameController.text = student.name!;
    ageController.text = student.className!;
    batchController.text = student.stream!;
  }

  @override
  Widget build(BuildContext context) {
    initializingValues();
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Update Student',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AddTextFeild(
                        controller: nameController, hintText: 'hintText'),
                    SizedBox(
                      height: 10,
                    ),
                    AddTextFeild(
                        controller: ageController, hintText: 'hintText'),
                    SizedBox(
                      height: 10,
                    ),
                    AddTextFeild(
                        controller: batchController, hintText: 'Stream'),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (student.name != null &&
                                    student.className != null &&
                                    student.stream != null) {
                                  studentViewModel.updateStudent(student);
                                  Get.back();
                                  Get.snackbar('Updated 🔁', 'Updated student data');
                                }
                              },
                              child: Text('Update')),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
