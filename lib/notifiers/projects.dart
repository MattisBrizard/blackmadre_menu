import 'package:blackmadre_menu/data/entities/project.dart';
import 'package:flutter/material.dart';

class ProjectsNotifier extends ChangeNotifier {
  List<Project> get projects => _projects;
  List<Project> _projects;
  set projects(List<Project> value) {
    if (_projects != value) {
      _projects = value;
      notifyListeners();
    }
  }

  Project get selected => _selected;
  Project _selected;
  set selected(Project value) {
    if (_selected != value) {
      _selected = value;
      notifyListeners();
    }
  }
}
