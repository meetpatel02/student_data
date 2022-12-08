// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:student_data/Model/data_base.dart';
// import 'package:path/path.dart';
// import 'dart:io'as io;
//
// class DBHelper{
//   static Database? _db;
//
//   Future<Database?> get db async{
//     if(_db != null){
//       return _db;
//     }
//     _db = await initDatabase();
//     return _db;
//   }
//
//   initDatabase()async{
//     io.Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path , 'db_crud');
//     var db = await openDatabase(path , version: 1,onCreate: _onCreate);
//     return db;
//   }
//   _onCreate(Database db,int version)async{
//     await db.execute(
//       "CREATE TABLE StudentModel (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,email TEXT, address TEXT, classno TEXT,hobby TEXT,subject TEXT)",
//     );print("Table is created");
//   }
//   Future<StudentModel> insert(StudentModel studentModel)async{
//     var dbClient = await db;
//     await dbClient!.insert('StudentModel', studentModel.toMap());
//     return StudentModel();
//   }
//   Future<StudentModel> deleteuser(StudentModel studentModel)async{
//     var dbClient = await db;
//     await dbClient!.delete('StudentModel');
//     return StudentModel();
//   }
//   Future<List<StudentModel>> getStudentList () async {
//     var dbClient = await db;
//     final List<Map<String,Object?>> queryResult = await dbClient!.query('student');
//     return queryResult.map((e) => StudentModel.fromMap(e)).toList();
//   }
// }