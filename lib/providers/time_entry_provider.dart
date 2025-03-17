import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';
import 'package:collection/collection.dart';
import '../models/time_entry.dart';
import '../models/project.dart';
import '../models/task.dart';

class TimeEntryProvider with ChangeNotifier {
  final LocalStorage storage = LocalStorage('time_tracker_app');
  List<TimeEntry> _entries = [];
  List<Project> _projects = [];
  List<Task> _tasks = [];

  List<TimeEntry> get entries => _entries;
  List<Project> get projects => _projects;
  List<Task> get tasks => _tasks;

  // Initialize the provider by loading data from local storage
  Future<void> init() async {
    await storage.ready;
    
    // Load projects
    final projectsJson = storage.getItem('projects');
    if (projectsJson != null) {
      _projects = (jsonDecode(projectsJson) as List)
          .map((item) => Project.fromJson(item))
          .toList();
    }
    
    // Load tasks
    final tasksJson = storage.getItem('tasks');
    if (tasksJson != null) {
      _tasks = (jsonDecode(tasksJson) as List)
          .map((item) => Task.fromJson(item))
          .toList();
    }
    
    // Load time entries
    final entriesJson = storage.getItem('timeEntries');
    if (entriesJson != null) {
      _entries = (jsonDecode(entriesJson) as List)
          .map((item) => TimeEntry.fromJson(item))
          .toList();
    }
    
    notifyListeners();
  }

  // Save all data to local storage
  Future<void> _saveData() async {
    await storage.ready;
    await storage.setItem('projects', jsonEncode(_projects));
    await storage.setItem('tasks', jsonEncode(_tasks));
    await storage.setItem('timeEntries', jsonEncode(_entries));
  }

  // Add a new time entry
  Future<void> addTimeEntry(TimeEntry entry) async {
    _entries.add(entry);
    await _saveData();
    notifyListeners();
  }

  // Delete a time entry
  Future<void> deleteTimeEntry(String id) async {
    _entries.removeWhere((entry) => entry.id == id);
    await _saveData();
    notifyListeners();
  }

  // Add a new project
  Future<void> addProject(Project project) async {
    _projects.add(project);
    await _saveData();
    notifyListeners();
  }

  // Delete a project and its associated tasks and time entries
  Future<void> deleteProject(String id) async {
    _projects.removeWhere((project) => project.id == id);
    _tasks.removeWhere((task) => task.projectId == id);
    _entries.removeWhere((entry) => entry.projectId == id);
    await _saveData();
    notifyListeners();
  }

  // Add a new task
  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await _saveData();
    notifyListeners();
  }

  // Delete a task and its associated time entries
  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
    _entries.removeWhere((entry) => entry.taskId == id);
    await _saveData();
    notifyListeners();
  }

  // Get entries grouped by project
  Map<String, List<TimeEntry>> getEntriesByProject() {
    return groupBy(_entries, (TimeEntry entry) => entry.projectId);
  }

  // Get project by ID
  Project? getProjectById(String id) {
    return _projects.firstWhereOrNull((project) => project.id == id);
  }

  // Get task by ID
  Task? getTaskById(String id) {
    return _tasks.firstWhereOrNull((task) => task.id == id);
  }

  // Get tasks by project ID
  List<Task> getTasksByProjectId(String projectId) {
    return _tasks.where((task) => task.projectId == projectId).toList();
  }
} 