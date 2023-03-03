class ExamSchedule {
  String? id;
  String? examName;
  String? timeOfTheExam;

  ExamSchedule(
      {required this.id, required this.examName, required this.timeOfTheExam});

  static List<ExamSchedule> examList() {
    return [
      ExamSchedule(
          id: '01',
          examName: 'Verojatnost i statistika',
          timeOfTheExam: "2023-06-10 16:00:00Z"),
      ExamSchedule(
          id: '02',
          examName: 'Operativni sistemi',
          timeOfTheExam: "2023-06-15 09:00:00Z"),
      ExamSchedule(
          id: '03',
          examName: 'Strukturno programiranje',
          timeOfTheExam: "2023-06-18 08:30:00Z"),
    ];
  }
}
