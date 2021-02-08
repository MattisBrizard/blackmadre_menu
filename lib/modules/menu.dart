import 'package:blackmadre_menu/core/menu_button.dart';
import 'package:blackmadre_menu/data/entities/project.dart';
import 'package:blackmadre_menu/notifiers/projects.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: _ImageViewer(),
              ),
              Expanded(
                child: _ProjectSelector(),
              ),
            ],
          ),
          MenuButton(
            onPressed: () => Navigator.pop(
              context,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectSelector extends StatelessWidget {
  const _ProjectSelector({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projects = context.select(
      (ProjectsNotifier notifier) => notifier.projects,
    );

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...[
            for (final project in projects) ...[
              _ProjectTitle(project: project),
              SizedBox(
                height: 20,
              )
            ]
          ]..removeLast(),
        ],
      ),
    );
  }
}

class _ProjectTitle extends StatefulWidget {
  const _ProjectTitle({
    Key key,
    @required this.project,
  }) : super(key: key);

  final Project project;

  @override
  __ProjectTitleState createState() => __ProjectTitleState();
}

class __ProjectTitleState extends State<_ProjectTitle> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        context.read<ProjectsNotifier>().selected = widget.project;
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Text(
        widget.project.name,
        style: TextStyle(
          fontSize: 25,
          color: isHovered ? Colors.grey : Colors.black,
        ),
      ),
    );
  }
}

class _ImageViewer extends StatelessWidget {
  const _ImageViewer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedProject = context.watch<ProjectsNotifier>().selected;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Container(
        key: ValueKey<String>(selectedProject.id),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              selectedProject.imagePath,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
