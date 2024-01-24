import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp_getx/model/StudentModel.dart';
import 'package:studentapp_getx/view/EditStudent.dart';

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({super.key,required this.student});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      width: screenWidth - 40,
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/myAvatar.png')),
                          Text(
                            '${student.name}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('${student.className}'),
                          Text('${student.stream}'),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(onPressed: (){
                        Get.to(() => EditStduent(student: student));
                      }, icon: const Icon(Icons.edit)))
                  ],
                ),
              )),
    );
  }
}
