class TimeEntry {
  String id;
  String projectId;
  String taskId;
  DateTime date;
  double hours;
  String? note;

  TimeEntry({
    required this.id,
    required this.projectId,
    required this.taskId,
    required this.date,
    required this.hours,
    this.note,
  });

  // Convert a TimeEntry object into a Map object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectId': projectId,
      'taskId': taskId,
      'date': date.toIso8601String(),
      'hours': hours,
      'note': note,
    };
  }

  // Create a TimeEntry object from a Map object
  factory TimeEntry.fromJson(Map<String, dynamic> json) {
    return TimeEntry(
      id: json['id'],
      projectId: json['projectId'],
      taskId: json['taskId'],
      date: DateTime.parse(json['date']),
      hours: json['hours'].toDouble(),
      note: json['note'],
    );
  }
} 