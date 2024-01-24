import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp_getx/model/StudentModel.dart';
import 'package:studentapp_getx/utils/constants.dart';
import 'package:studentapp_getx/view/widgets/textfeild.dart';
import 'package:studentapp_getx/view_model/StudentViewModel.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var classController = TextEditingController();
    var streamController = TextEditingController();
    final StudentViewModel studentViewModel = Get.put(StudentViewModel());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Add New Student',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            sizedten(context),
            AddTextFeild(controller: nameController, hintText: 'Enter Name',),
            sizedten(context),
            AddTextFeild(controller: classController, hintText: 'Class'),
            sizedten(context),
            AddTextFeild(controller: streamController, hintText: 'Choose Subject'),
            sizedten(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (nameController.text != '' && classController.text != '' && streamController.text != '') {
                        studentViewModel.addStudent(
                            StudentModel(name: nameController.text, className: classController.text, stream: streamController.text));
                        nameController.clear();
                        Get.back();
                      }
                    },
                    child: const Text('Add')),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
