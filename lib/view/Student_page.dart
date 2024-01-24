import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp_getx/model/StudentModel.dart';
import 'package:studentapp_getx/utils/constants.dart';
import 'package:studentapp_getx/view/AddStudent.dart';
import 'package:studentapp_getx/view/EditStudent.dart';
import 'package:studentapp_getx/view/Student_details.dart';
import 'package:studentapp_getx/view_model/StudentViewModel.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  var nameController = TextEditingController();
  var editController = TextEditingController();
  final StudentViewModel studentViewModel = Get.put(StudentViewModel());

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  fetchdata() async{
    await studentViewModel.fetchAllStudent();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(() => AddStudent());
      }, child: const Icon(Icons.add),),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Text('Student List!', style: TextStyle( fontSize: 18),),
              sizedtwenty(context),
              Obx(() => studentViewModel.allStudent.isEmpty
                    ? const Center(
                        child: Text('No students available'),
                      )
                    : Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: studentViewModel.allStudent.length,                         separatorBuilder: (context, index) {
                            return sizedten(context);
                          },
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => StudentDetailsPage(
                                  student: studentViewModel.allStudent[index],
                                ));
                              },
                              child: Container(
                                height: screenHeight/12,
                                width: screenWidth-40,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage('assets/images/myAvatar.png')),
                                    sizedwten(context),
                                    Text('${studentViewModel.allStudent[index].name}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                    const Spacer(),
                                    PopupMenuButton(
                                      onSelected: (value) {
                                        print(value);
                                      },
                                      itemBuilder: (context) {
                                        return [
                                          PopupMenuItem(
                                            onTap: (){
                                             Get.to(EditStduent(student: studentViewModel.allStudent[index]));
                                            },
                                            value: 1,child: Text('Edit'),),
                                          PopupMenuItem(
                                            onTap: () => studentViewModel.deleteStudent(studentViewModel.allStudent[index].id!),
                                            value: 2,child: Text('Delete'),)
                                        ];
                                      },)
                                  ],),
                                ),
                              ),
                            );
                          },
                        ),
                      ),)
            ],
          ),
        ),
      ),
    );
  }
}


// ListTile(
//                             title: Text('${studentViewModel.allStudent[index].name}'),
//                             trailing: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 IconButton(
//                                   onPressed: () {
//                                     showDialog(
//                                       context: context,
//                                       builder: (context) {
//                                         return AlertDialog(
//                                           title: const Text('Edit'),
//                                           content: TextField(
//                                             controller: editController =
//                                                 TextEditingController(
//                                               text: studentViewModel
//                                                   .allStudent[index].name,
//                                             ),
//                                           ),
//                                           actions: [
//                                             ElevatedButton(
//                                               onPressed: () {
//                                                 if (editController.text != '') {
//                                                   studentViewModel.updateStudent(
//                                                     StudentModel(
//                                                       name: editController.text,
//                                                       id: studentViewModel
//                                                           .allStudent[index].id,
//                                                     ),
//                                                   );
//                                                   Navigator.pop(context);
//                                                 }
//                                               },
//                                               child: const Text('Update'),
//                                             ),
//                                           ],
//                                           actionsAlignment: MainAxisAlignment.center,
//                                         );
//                                       },
//                                     );
//                                   },
//                                   icon: const Icon(Icons.edit),
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     studentViewModel.deleteStudent(
//                                       studentViewModel.allStudent[index].id!,
//                                     );
//                                   },
//                                   icon: const Icon(Icons.delete),
//                                 ),
//                               ],
//                             ),
//                           );