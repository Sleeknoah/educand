import 'package:flutter/material.dart';

class Xmargin extends StatelessWidget {
  final double x;

  const Xmargin({Key key, this.x}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:x
    );
  }
}

class Ymargin extends StatelessWidget {
  final double x;

  const Ymargin({Key key, this.x}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:x
    );
  }
}