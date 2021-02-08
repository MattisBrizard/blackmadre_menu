import 'dart:math';
import 'dart:ui';

import 'package:blackmadre_menu/data/entities/project.dart';
import 'package:blackmadre_menu/modules/home.dart';
import 'package:blackmadre_menu/modules/menu.dart';
import 'package:blackmadre_menu/notifiers/projects.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final _projects = [
    Project(
      id: 'id-1',
      imagePath:
          'https://images.unsplash.com/photo-1581337204764-efe3089a3ba2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1218&q=80',
      name: 'Project 1',
    ),
    Project(
      id: 'id-2',
      imagePath:
          'https://images.unsplash.com/photo-1579539441712-e180bd122890?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1220&q=80',
      name: 'Project 2',
    ),
    Project(
      id: 'id-3',
      imagePath:
          'https://images.unsplash.com/photo-1584445651808-d517d171e0c9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1217&q=80',
      name: 'Project 3',
    ),
    Project(
      id: 'id-4',
      imagePath:
          'https://images.unsplash.com/photo-1584446922609-d494912c35c5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1392&q=80',
      name: 'Project 4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProjectsNotifier()
        ..projects = _projects
        ..selected = _projects.first,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blackmadre menu',
        home: _PrecacheImages(
          child: HomePage(),
        ),
      ),
    );
  }
}

class _PrecacheImages extends StatefulWidget {
  const _PrecacheImages({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  __PrecacheImagesState createState() => __PrecacheImagesState();
}

class __PrecacheImagesState extends State<_PrecacheImages> {
  @override
  void didChangeDependencies() {
    final projects = context.read<ProjectsNotifier>().projects;
    projects.forEach(
      (element) {
        precacheImage(NetworkImage(element.imagePath), context);
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
