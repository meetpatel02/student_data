import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:student_data/Database/data_base.dart';
import 'package:student_data/Model/student_model.dart';
import 'package:student_data/editstudent.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final ScrollController _scrollController = ScrollController();

  bool _show = true;
  List<StudentModel> studentModel = [];

  final dbhelper = Databasehelper.instance;

  @override
  void initState() {
    super.initState();
    queryall();
    handleScroll();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          backgroundColor: const Color(0xFF101417),
          title: const Text(
            'StudentList',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            studentModel.isEmpty
                ? const Text('')
                : IconButton(
                    onPressed: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.indigo),
                                          padding: MaterialStateProperty.all<
                                                  EdgeInsets>(
                                              const EdgeInsets.symmetric(
                                                  horizontal: 30)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ))),
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: const Text(
                                        "Cancle",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.indigo),
                                          padding: MaterialStateProperty.all<
                                                  EdgeInsets>(
                                              const EdgeInsets.symmetric(
                                                  horizontal: 30)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ))),
                                      onPressed: () {
                                        setState(() {
                                          deletealldata();
                                          studentModel.clear();
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.white),
                                      )),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 20, 0),
                                      child: Column(
                                        children: const <Widget>[
                                          Image(
                                            image: AssetImage(
                                                "assets/images/trash-can.gif"),
                                            height: 65,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Delete",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Are You Sure To Delete!!",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
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
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ))
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/back2.jpeg"),
                fit: BoxFit.cover),
          ),
          child: studentModel.isEmpty
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage("assets/images/sleepy.png"),
                      height: 150,
                    ),
                    Center(
                        child: Text(
                      "Nothing To Show",
                      style: TextStyle(color: Colors.cyan),
                    ))
                  ],
                ))
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _scrollController,
                  itemCount: studentModel.length,
                  itemBuilder: (context, index) {
                    var item = studentModel[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slidable(
                        startActionPane: ActionPane(
                          motion: const StretchMotion(),
                          children: [
                            SlidableAction(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              label: "Edit",
                              icon: Icons.edit,
                              backgroundColor: Colors.green.withOpacity(0.25),
                              onPressed: (context) {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(
                                        builder: (context) => EditStudent(
                                              studentModel: item,
                                            )))
                                    .then((value) {
                                  if (value != null && value!) {
                                    setState(() {
                                      queryall();
                                    });
                                  }
                                });
                              },
                            )
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          children: [
                            SlidableAction(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              label: "Delete",
                              icon: Icons.delete,
                              backgroundColor: Colors.red.withOpacity(0.25),
                              onPressed: (context) => {
                                showDialog(
                                    // barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        actions: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.indigo),
                                                    padding: MaterialStateProperty
                                                        .all<EdgeInsets>(
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    30)),
                                                    shape: MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ))),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(false);
                                                },
                                                child: const Text(
                                                  "Cancle",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.indigo),
                                                    padding: MaterialStateProperty
                                                        .all<EdgeInsets>(
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    30)),
                                                    shape: MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ))),
                                                onPressed: () {
                                                  delete(index);
                                                },
                                                child: const Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                          ),
                                        ],
                                        backgroundColor: Colors.white,
                                        insetPadding: const EdgeInsets.all(8),
                                        elevation: 10,
                                        titlePadding: const EdgeInsets.all(0.0),
                                        title: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 10, 20, 0),
                                                child: Column(
                                                  children: <Widget>[
                                                    const Image(
                                                      image: AssetImage(
                                                          "assets/images/trash-can.gif"),
                                                      height: 65,
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    const Text(
                                                      "Delete",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Are You Sure To Delete This Id ${item.id!}!!",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 18),
                                                      textAlign:
                                                          TextAlign.center,
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
                                    })
                              },
                            ),
                          ],
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.15),
                                  Colors.white.withOpacity(0.25)
                                ]),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ID: ${studentModel[index].id}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  'Name: ${studentModel[index].name}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  'Email: ${studentModel[index].email}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  'Address: ${studentModel[index].address}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  'Phone No: ${studentModel[index].phoneno}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  'Class No: ${studentModel[index].classno}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  'Hobby: ${studentModel[index].hobby}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  'Subject: ${studentModel[index].subject.toString().replaceAll('[', '').replaceAll(']', '')}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
        ),
        floatingActionButton: Visibility(
          visible: _show,
          child: FloatingActionButton(
            backgroundColor: Colors.white.withOpacity(0.10),
            onPressed: () {
              Navigator.pushNamed(context, "addstudent");
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  void queryall() async {
    final allRows = await dbhelper.queryall();
    studentModel.clear();
    for (var row in allRows) {
      studentModel.add(StudentModel.fromMap(row));
    }
    setState(() {});
  }

  void delete(int index) async {
    dbhelper.delete(studentModel[index].id!);
    setState(() {
      studentModel.removeAt(index);
      Navigator.pop(context);
    });
  }

  void deletealldata() async {
    dbhelper.deleteall();
  }

  void update() async {}
  void moveToLastscreen() {
    Navigator.pop(context, true);
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  void showFloationButton() {
    setState(() {
      _show = true;
    });
  }

  void hideFloationButton() {
    setState(() {
      _show = false;
    });
  }

  void handleScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.idle) {
        showFloationButton();
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        showFloationButton();
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        hideFloationButton();
      }
    });
  }
}
