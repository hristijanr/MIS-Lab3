import 'package:flutter/material.dart';

import '../model/exam.dart';
import '../widgets/exam_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final examList = ExamSchedule.examList();
  List<ExamSchedule> _foundExam = [];
  final _examController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  void initState() {
    _foundExam = examList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      color: Colors.lightBlue,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      alignment: Alignment.center,
                      child: Text(
                        'Exams',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    for (ExamSchedule exaam in _foundExam.reversed)
                      Exam(exam: exaam),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                      ),
                      child: TextField(
                        controller: _examController,
                        decoration: InputDecoration(
                          hintText: 'name of the exam',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                      ),
                      child: TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          hintText: 'yyyy-mm-dd hh-mm-ss',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 10,
                      ),
                      child: ElevatedButton(
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (_examController.text.isNotEmpty &&
                              _dateController.text.isNotEmpty) {
                            _addExam(
                              _examController.text,
                              _dateController.text,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue,
                          shape: CircleBorder(),
                          minimumSize: Size(60, 60),
                          elevation: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addExam(String exam, String date) {
    setState(() {
      examList.add(ExamSchedule(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          examName: exam,
          timeOfTheExam: date));
    });
    _examController.clear();
    _dateController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ExamSchedule> results = [];
    if (enteredKeyword.isEmpty) {
      results = examList;
    } else {
      results = examList
          .where((item) => item.examName!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundExam = results;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          height: 40,
          width: 40,
        ),
      ]),
    );
  }
}
