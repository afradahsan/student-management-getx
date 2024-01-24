import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp_getx/model/StudentModel.dart';
import 'package:studentapp_getx/utils/constants.dart';
import 'package:studentapp_getx/view/EditStudent.dart';

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({super.key,required this.student});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      width: screenWidth - 40,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/myAvatar.png')),
                                    sizedten(context),
                            Text(
                              'Name: ${student.name}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            sizedten(context),
                            Text('Class - ${student.className}th'),
                            sizedten(context),
                            Text('Subject - ${student.stream}'),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(onPressed: (){
                        Get.to(() => EditStduent(student: student));
                      }, icon: const Icon(Icons.edit, size: 20,)))
                  ],
                ),
              )),
    );
  }
}
