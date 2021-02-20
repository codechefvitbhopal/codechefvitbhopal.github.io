import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  final double horizontal;
  final double vertical;
  const CenteredView(
      {Key key, this.child, this.horizontal = 20.0, this.vertical = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}
