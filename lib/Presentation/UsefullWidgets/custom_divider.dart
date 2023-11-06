// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  double divider;
  Color color;
  CustomDivider(
      {super.key, this.divider = 5.0, this.color = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: divider,
      color: color,
    );
  }
}
