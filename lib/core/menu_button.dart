import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.90, -0.90),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.circle,
          color: Colors.black,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
