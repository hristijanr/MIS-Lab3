import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/exam.dart';

class Exam extends StatelessWidget {
  final ExamSchedule exam;

  const Exam({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final examDate = DateTime.parse(exam.timeOfTheExam!);
    final formattedDate = DateFormat('MMM dd, yyyy hh:mm a').format(examDate);

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: Border.all(
          color: Colors.grey,
          width: 20,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        title: Text(
          exam.examName!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          formattedDate,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
        ),
      ),
    );
  }
}
