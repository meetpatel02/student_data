// ignore_for_file: must_be_immutable, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:student_data/Database/data_base.dart';
import 'package:student_data/Model/student_model.dart';

class EditStudent extends StatefulWidget {
  StudentModel? studentModel;

  EditStudent({Key? key, this.studentModel}) : super(key: key);

  @override
  State<EditStudent> createState() => _EditStudentState();
}

List<StudentModel> studentList = [];

List<String> selectedSubject = [];

String? subject = '';
bool? subject1 = false;
bool? subject2 = false;
bool? subject3 = false;
bool? subject4 = false;
bool? subject5 = false;

class _EditStudentState extends State<EditStudent> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController classnocontroller = TextEditingController();
  TextEditingController hobbycontroller = TextEditingController();
  final dbhelper = Databasehelper.instance;

  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.studentModel!.name.toString();
    emailcontroller.text = widget.studentModel!.email.toString();
    addresscontroller.text = widget.studentModel!.address.toString();
    phonecontroller.text = widget.studentModel!.phoneno.toString();
    classnocontroller.text = widget.studentModel!.classno.toString();
    hobbycontroller.text = widget.studentModel!.hobby.toString();
    if (widget.studentModel!.subject!.contains("Physics")) {
      subject1 = true;
    }
    if (widget.studentModel!.subject!.contains("Maths")) {
      subject2 = true;
    }
    if (widget.studentModel!.subject!.contains("Chemistry")) {
      subject3 = true;
    }
    if (widget.studentModel!.subject!.contains("Biology")) {
      subject4 = true;
    }
    if (widget.studentModel!.subject!.contains("English")) {
      subject5 = true;
    }
    queryall();
    setState(() {});
    // widget.studentModel.subject
  }
  void queryall() async {
    final allRows = await dbhelper.queryall();
    studentList.clear();
    for (var row in allRows) {
      studentList.add(StudentModel.fromMap(row));
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF101417),
          centerTitle: true,
          title: const Text(
            'Edit Student',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/back2.jpeg"),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: namecontroller,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintStyle:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Name",
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: "Enter Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: emailcontroller,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintStyle:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Email",
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: "Enter Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: phonecontroller,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintStyle:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Phone No.",
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: "Enter Phone No.",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    maxLines: 2,
                    controller: addresscontroller,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintStyle:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Address",
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: "Enter Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: classnocontroller,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintStyle:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Class No.",
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: "Enter Class No",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: hobbycontroller,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        hintStyle:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Hobby",
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: "Enter Hobby",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Subject :",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            side: const BorderSide(color: Colors.white),
                            value: subject1,
                            onChanged: (newValue) {
                              setState(() {
                                subject1 = newValue;
                                subject = "Physics";
                                if (subject1 = newValue!) {
                                  selectedSubject.add(subject.toString());
                                } else {
                                  selectedSubject.remove(subject.toString());
                                }
                              });
                            },
                          ),
                          const Expanded(
                              child: Text(
                            "Physics",
                            style: TextStyle(color: Colors.white),
                          )),
                          Checkbox(
                            side: const BorderSide(color: Colors.white),
                            value: subject2,
                            onChanged: (value) {
                              setState(() {
                                subject2 = value;
                                subject = "Maths";
                                if (subject2 = value!) {
                                  selectedSubject.add(subject.toString());
                                } else {
                                  selectedSubject.remove(subject.toString());
                                }
                              });
                            },
                          ),
                          const Expanded(
                              child: Text(
                            "Maths",
                            style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Checkbox(
                            side: const BorderSide(color: Colors.white),
                            value: subject3,
                            onChanged: (value) {
                              setState(() {
                                subject3 = value;
                                subject = "Chemistry";
                                if (subject3 = value!) {
                                  selectedSubject.add(subject.toString());
                                } else {
                                  selectedSubject.remove(subject.toString());
                                }
                              });
                            },
                          ),
                          const Expanded(
                              child: Text(
                            "Chemistry",
                            style: TextStyle(color: Colors.white),
                          )),
                          Checkbox(
                            side: const BorderSide(color: Colors.white),
                            value: subject4,
                            onChanged: (value) {
                              setState(() {
                                subject4 = value;
                                subject = "Biology";
                                if (subject4 = value!) {
                                  selectedSubject.add(subject.toString());
                                } else {
                                  selectedSubject.remove(subject.toString());
                                }
                              });
                            },
                          ),
                          const Expanded(
                              child: Text(
                            "Biology",
                            style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            side: const BorderSide(color: Colors.white),
                            value: subject5,
                            onChanged: (value) {
                              setState(() {
                                subject5 = value;
                                subject = "English";
                                if (subject5 = value!) {
                                  selectedSubject.add(subject.toString());
                                } else {
                                  selectedSubject.remove(subject.toString());
                                }
                              });
                            },
                          ),
                          const Expanded(
                              child: Text(
                            "English",
                            style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          // onPressed: () {
                          //   queryall();
                          // },
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.white12.withOpacity(0.15)),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(horizontal: 50)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                          child: const Text(
                            "Cancle",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => moveTohome(context),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.white12.withOpacity(0.15)),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(horizontal: 50)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                          child: const Text(
                            "Update",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  moveTohome(BuildContext context) async {
    // String? name = namecontroller.text;
    // String? email = emailcontroller.text;
    // String? address = addresscontroller.text;
    // String? classno = classnocontroller.text;
    // String? hobby = hobbycontroller.text;
    // String? subject = selectedSubject.toString();
    // insertdata(name, email, address, classno, hobby, subject);
    if (namecontroller.text.trim().isEmpty) {
      AlertBox(context, "Error", "Please Enter Name");
    } else if (emailcontroller.text.trim().isEmpty) {
      AlertBox(context, "Error", "Please Enter Email");
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(emailcontroller.text)) {
      AlertBox(context, "Error", "Please Enter Valid Email");
    } else if (phonecontroller.text.trim().isEmpty) {
      AlertBox(context, "Error", "Please Enter Phone No.");
    } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{6,10}$)')
        .hasMatch(phonecontroller.text)) {
      AlertBox(context, "Error", "Please Enter Valid Phone No.");
    } else if (addresscontroller.text.trim().isEmpty) {
      AlertBox(context, "Error", "Please Enter Address");
    } else if (classnocontroller.text.trim().isEmpty) {
      AlertBox(context, "Error", "Please Enter Class No.");
    } else if (hobbycontroller.text.trim().isEmpty) {
      AlertBox(context, "Error", "Please Enter Your Hobby");
    } else if (selectedSubject.isEmpty) {
      AlertBox(context, "Error", "Please Select Subject");
    } else {
      var isEmailExist = studentList.where((element) => element.email == emailcontroller.text.toString());
      var isPhoneExist = studentList.where((element) => element.phoneno == phonecontroller.text.toString());

      if(isEmailExist.isNotEmpty){
        AlertBox(context, "Error", "Email already exist."
            "Please use another email to create student");
      }else if(isPhoneExist.isNotEmpty){
        AlertBox(context, "Error", "Phone already exist."
            "Please use another phone to create student");
      }
      else {
        updatedata(
            namecontroller.text,
            emailcontroller.text,
            addresscontroller.text,
            phonecontroller.text,
            classnocontroller.text,
            hobbycontroller.text,
            selectedSubject.toString());

        SubmitBox(context, "Update", "Thank you");
      }
    }
  }

  void updatedata(
      name, email, address, phoneno, classno, hobby, subject) async {
    Map<String, dynamic> row = {
      Databasehelper.columnID: widget.studentModel!.id,
      Databasehelper.columnName: name,
      Databasehelper.columnEmail: email,
      Databasehelper.columnAddress: address,
      Databasehelper.columnPhoneno: phoneno,
      Databasehelper.columnClassno: classno,
      Databasehelper.columnHobby: hobby,
      Databasehelper.columnSubject: subject,
    };

    // var student = StudentModel(id, name, email, address, classno, hobby, subject),
    StudentModel studentModel = StudentModel.fromMap(row);
    final id = await dbhelper.update(studentModel);
    print(id);
  }
}

void showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(milliseconds: 700),
    ),
  );
}

void AlertBox(
    BuildContext context, String titlemessage, String subtitlemessage) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.all(8),
          elevation: 10,
          titlePadding: const EdgeInsets.all(0.0),
          title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: <Widget>[
                      const Image(
                        image: AssetImage("assets/images/warning.gif"),
                        height: 65,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        titlemessage,
                        style: const TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        subtitlemessage,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}

void SubmitBox(
    BuildContext context, String titlemessage, String subtitlemessage) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context).pop(false);
            //     },
            //     child: Text("Cancle")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context, true);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(horizontal: 30)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))),
                    child: const Text(
                      "Ok",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.all(8),
          elevation: 10,
          titlePadding: const EdgeInsets.all(0.0),
          title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: <Widget>[
                      const Image(
                        image: AssetImage("assets/images/update.gif"),
                        height: 65,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        titlemessage,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        subtitlemessage,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}
