import 'package:student_data/Database/data_base.dart';

class StudentModel{
  int? id;
  String? name;
  String? email;
  String? address;
  String? phoneno;
  String? classno;
  String? hobby;
  String? subject;


  StudentModel.fromMap(Map<String,dynamic>map){
    id = map['id'];
    name = map['name'];
    email = map['email'];
    address = map['address'];
    phoneno = map['phoneno'];
    classno = map['classno'];
    hobby = map['hobby'];
    subject = map['subject'];
  }

  Map<String, Object?> toMap() => {
    Databasehelper.columnID: id,
    Databasehelper.columnName: name,
    Databasehelper.columnEmail: email,
    Databasehelper.columnAddress: address,
    Databasehelper.columnPhoneno: phoneno,
    Databasehelper.columnClassno: classno,
    Databasehelper.columnHobby: hobby,
    Databasehelper.columnSubject: subject
  };

}

