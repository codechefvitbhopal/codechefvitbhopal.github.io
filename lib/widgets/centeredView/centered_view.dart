import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  final double horizontal;

  const CenteredView({Key key, this.child, this.horizontal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 60),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}
