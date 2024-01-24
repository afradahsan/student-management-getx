import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentapp_getx/database/DbHelper.dart';
import 'package:studentapp_getx/view/StudentPage.dart';
import 'package:studentapp_getx/view/Student_page.dart';

void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper().initDatabase();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        // primaryColorDark: Colors.black,
        // primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          // bodyLarge: TextStyle(color: Colors.white),
          // bodyMedium: TextStyle(color: Colors.white),
          // bodySmall: TextStyle(color: Colors.white)
        ),
        iconTheme: const IconThemeData(
          // color: Colors.white
        )
      ),
      home: const StudentHomePage()
    );
  }
}