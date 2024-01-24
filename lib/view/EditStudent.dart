// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:studentapp_getx/model/StudentModel.dart';
// import 'package:studentapp_getx/utils/constants.dart';
// import 'package:studentapp_getx/view/widgets/textfeild.dart';
// import 'package:studentapp_getx/view_model/StudentViewModel.dart';

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController classController = TextEditingController();
//   final TextEditingController streamController = TextEditingController();
// class EditStudent extends GetView<StudentViewModel> {
//   const EditStudent({required this.student,super.key});
//   final StudentModel student;

//   initializeValues() {
//     nameController.text = student.name!;
//     classController.text = student.className!;
//     streamController.text = student.stream!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('object');
//     initializeValues();
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               const Text(
//                 'Update Student Details',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//               sizedten(context),
//               TextField(controller: nameController,),
//               // AddTextFeild(controller: nameController, hintText: 'Enter Name'),
//               sizedten(context),
//               TextField(controller: classController,),
//               // AddTextFeild(controller: classController, hintText: 'Class'),
//               sizedten(context),
//               TextField(controller: streamController,),
//               // AddTextFeild(controller: streamController, hintText: 'Choose Subject'),
//               sizedten(context),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       if (nameController.text != '' &&
//                           classController.text != '' &&
//                           streamController.text != '') {
//                             print(streamController.text);
//                         controller.updateStudent(
//                           StudentModel(
//                             name: nameController.text,
//                             className: classController.text,
//                             stream: streamController.text,
//                           ),
//                         );
//                         nameController.clear();
//                         Get.back();
//                       }
//                     },
//                     child: const Text('Update'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
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
