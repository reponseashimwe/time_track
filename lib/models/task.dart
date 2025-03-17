class Task {
  String id;
  String name;
  String projectId;

  Task({
    required this.id,
    required this.name,
    required this.projectId,
  });

  // Convert a Task object into a Map object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'projectId': projectId,
    };
  }

  // Create a Task object from a Map object
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      projectId: json['projectId'],
    );
  }
} 