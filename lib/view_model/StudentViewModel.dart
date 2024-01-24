import 'package:get/get.dart';
import 'package:studentapp_getx/model/StudentModel.dart';
import 'package:studentapp_getx/repositories/Studentrepo.dart';

class StudentViewModel extends GetxController{

  var allStudent = <StudentModel>[].obs;
  StudentRepo studentRepo = StudentRepo();

  fetchAllStudent() async{
    print('fetchhh');
    var student = await studentRepo.getStudent();
    allStudent.value = student;
  }

  addStudent(StudentModel studentModel){
    studentRepo.add(studentModel);
    fetchAllStudent();
  }

  updateStudent(StudentModel studentModel) async{
    await studentRepo.update(studentModel);
    print('updated');
    fetchAllStudent();
  }

  deleteStudent(int id){
    studentRepo.delete(id);
    fetchAllStudent();
  }

}