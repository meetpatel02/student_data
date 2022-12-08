// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_data/Model/student_model.dart';

class Databasehelper{
  static const databasename = "studentdata.db";
  static const databaseversion = 2;

  static const table = "student_table";

  static const columnID = "id";
  static const columnName = "name";
  static const columnEmail = "email";
  static const columnAddress = "address";
  static const columnPhoneno = "phoneno";
  static const columnClassno = "classno";
  static const columnHobby = "hobby";
  static const columnSubject = "subject";

  static Database? _database;

  Databasehelper.privateconstructor();
  static final Databasehelper instance = Databasehelper.privateconstructor();

  Future<Database?> get database async{
    if (_database != null)return _database;
    _database = await initDatabase();
    return _database;
  }
  initDatabase() async{
    Directory documentdirecoty = await getApplicationDocumentsDirectory();
    String path = join(documentdirecoty.path, databasename);
    return await openDatabase(path, version: databaseversion,onCreate: onCreate);
}
Future onCreate(Database db , int version) async {
    await db.execute(
      '''
      CREATE TABLE $table(
      $columnID INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnName TEXT NOT NULL,
      $columnEmail TEXT NOT NULL,
      $columnAddress TEXT NOT NULL,
      $columnPhoneno TEXT NOT NULL,
      $columnClassno TEXT NOT NULL,
      $columnHobby TEXT NOT NULL,
      $columnSubject TEXT NOT NULL
      )
      '''
    );
}
Future<int> insert(StudentModel studentModel) async {
    Database? db = await instance.database;
    return await db!.insert(table, {'name': studentModel.name,'email': studentModel.email,'address': studentModel.address,'phoneno':studentModel.phoneno,'classno': studentModel.classno,'hobby':studentModel.hobby,'subject':studentModel.subject});
}
  Future<List<Map<String , dynamic>>> queryall() async {
    Database? db = await instance.database;
    return db!.query(table);
  }

 Future<int> update(StudentModel studentModel) async {
    Database? db = await instance.database;
    Object? id = studentModel.id;
    return await db!.update(table, studentModel.toMap(),where: '$columnID = ?',whereArgs: [id]);
 }
  Future<int> delete(int id)async{
    Database? db = await instance.database;
    return await db!.delete(table,where: '$columnID = ?',whereArgs: [id]);
  }

  Future<int> deleteall()async{
    Database? db = await instance.database;
    return await db!.delete(table,where:null,whereArgs: null);
  }
}