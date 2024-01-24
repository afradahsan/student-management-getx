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

Future<int> updateStudent(StudentModel studentModel) async {
  try {
    final db = await dbHelper.db;

    int result = await db.update(
      DBHelper.tableName,
      {
        'name': studentModel.name,
        'className': studentModel.className,
        'stream': studentModel.stream,
      },
      where: 'id = ?',
      whereArgs: [studentModel.id],
    );

    if (result > 0) {
      print('Update completed: $result');
      print('Updated Student Name: ${studentModel.name}');
    } else {
      print('No records were updated.');
    }

    return result;
  } catch (e) {
    print('Error updating student: $e');
    return 0; // or throw an exception
  }
}

  Future<int> delete(int id) async {
    var dbClient = await dbHelper.db;
    return await dbClient
        .delete(DBHelper.tableName, where: 'id = ?', whereArgs: [id]);
  }
}
