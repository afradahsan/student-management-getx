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
                    AddTextFeild(
                        controller: nameController, hintText: 'hintText'),
                    AddTextFeild(
                        controller: ageController, hintText: 'hintText'),
                    AddTextFeild(controller: batchController, hintText: 'asdf'),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: TextButton.icon(
                                style: const ButtonStyle(
                                    foregroundColor:
                                        MaterialStatePropertyAll(Colors.white),
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.green),
                                    fixedSize: MaterialStatePropertyAll(
                                      Size(210, 50),
                                    )),
                                onPressed: () {
                                  if (student.name != null &&
                                      student.className != null &&
                                      student.stream != null) {
                                    studentViewModel.updateStudent(student);
                                    Get.back();
                                  }
                                },
                                icon: const Icon(Icons.save),
                                label: const Text("Update")),
                          ),
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
