class Project {
  String id;
  String name;

  Project({
    required this.id,
    required this.name,
  });

  // Convert a Project object into a Map object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Create a Project object from a Map object
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
    );
  }
} 