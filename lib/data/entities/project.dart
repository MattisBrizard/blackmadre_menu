import 'package:meta/meta.dart';

class Project {
  const Project({
    @required this.id,
    @required this.name,
    @required this.imagePath,
  });

  final String id;
  final String name;
  final String imagePath;
}
