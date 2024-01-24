import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp_getx/model/StudentModel.dart';
import 'package:studentapp_getx/view/Student_Page.dart';
import 'package:studentapp_getx/view_model/StudentViewModel.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  var nameController = TextEditingController();
  var editController = TextEditingController();
  StudentViewModel studentViewModel = StudentViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(hintText: 'Enter Student Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (nameController.text != '') {
                              studentViewModel.addStudent(
                                  StudentModel(name: nameController.text));
                              nameController.clear();
                            }
                          },
                          child: const Text('Add')),
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: studentViewModel.allStudent.length,
                          itemBuilder: (context, index) => ListTile(
                                title: Text(
                                    '${studentViewModel.allStudent[index].name}'),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(onPressed: (){
                                          showDialog(context: context, builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Edit'),
                                              content: TextField(
                                                controller: editController = TextEditingController(text: studentViewModel.allStudent[index].name),
                                              ),
                                              actions: [ElevatedButton(onPressed: (){
                                                if(editController.text != ''){
                                                  studentViewModel.updateStudent(StudentModel(name: editController.text.toString(), id: studentViewModel.allStudent[index].id),);
                                                Navigator.pop(context);
                                                }
                                              }, child: const Text('Update',))],
                                              actionsAlignment:MainAxisAlignment.center,
                                            );
                                          },);
                                        }, icon: const Icon(Icons.edit)),
                                        IconButton(onPressed: (){
                                          studentViewModel.deleteStudent(studentViewModel.allStudent[index].id!);
                                        }, icon: const Icon(Icons.delete)),
                                      ],
                                    ),
                              ))),
                              ElevatedButton(onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentHomePage(),));
                              }, child: Text('Student details'))
                ],
              ),
            ))));
  }
}