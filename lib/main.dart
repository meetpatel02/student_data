import 'package:flutter/material.dart';
import 'package:student_data/addStudent.dart';
import 'package:student_data/editstudent.dart';
import 'package:student_data/studentlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const StudentList(),
        "addstudent": (context) => const AddStudent(),
        "editstudent": (context) => EditStudent(),
      },
    );
  }
}
