import 'package:studentapp_getx/database/DbHelper.dart';
import 'package:studentapp_getx/model/StudentModel.dart';

class StudentRepo {
  DBHelper dbHelper = DBHelper();

  Future<List<StudentModel>> getStudent() async {
    var dbClient = await dbHelper.db;
    try {
      List<Map> maps = await dbClient.query(DBHelper.tableName,
          columns: ['id', 'name', 'className', 'stream']);
      List<StudentModel> studentList = [];

      for (int i = 0; i < maps.length; i++) {
        studentList.add(StudentModel.fromMap(maps[i]));
      }

      return studentList;
    } catch (e) {
      print('Error in getStudent: $e');
      return [];
    }
  }

  Future<int> add(StudentModel studentModel) async {
    print('beforeclient');
    var dbClient = await dbHelper.db;
    return await dbClient.insert(DBHelper.tableName, studentModel.toMap());
  }

  Future<int> update(StudentModel studentModel) async {
  try {
    print('Before update - Student Name: ${studentModel.name}');
    var dbClient = await dbHelper.db;
    
    int result = await dbClient.rawUpdate(
      'UPDATE ${DBHelper.tableName} SET name = ?, className = ?, stream = ? WHERE id = ?',
      [studentModel.name, studentModel.className, studentModel.stream, studentModel.id],
    );

    print('After update - Student Name: ${studentModel.name}');
    print('Update completed: $result');

    // Update the StudentModel object after the database update
    StudentModel updatedStudent = await getStudentById(studentModel.id!);
    studentModel.name = updatedStudent.name;
    studentModel.className = updatedStudent.className;
    studentModel.stream = updatedStudent.stream;

    print('Updated Student Model - Name: ${studentModel.name}, ClassName: ${studentModel.className}, Stream: ${studentModel.stream}');

    return result;
  } catch (e) {
    print('Error updating student: $e');
    return 0; // or throw an exception
  }
}

  Future<StudentModel> getStudentById(int id) async {
    var dbClient = await dbHelper.db;
    try {
      List<Map> maps = await dbClient.query(
        DBHelper.tableName,
        columns: ['id', 'name', 'className', 'stream'],
        where: 'id = ?',
        whereArgs: [id],
      );

      if (maps.isNotEmpty) {
        // Assuming there's only one record with the given ID
        return StudentModel.fromMap(maps.first);
      } else {
        // Handle the case where no record with the given ID is found
        throw Exception('Student not found with ID: $id');
      }
    } catch (e) {
      print('Error in getStudentById: $e');
      // Handle the error appropriately (throw an exception or return a default StudentModel, depending on your use case)
      throw Exception('Error fetching student by ID');
    }
  }

  Future<int> delete(int id) async {
    var dbClient = await dbHelper.db;
    return await dbClient
        .delete(DBHelper.tableName, where: 'id = ?', whereArgs: [id]);
  }
}
