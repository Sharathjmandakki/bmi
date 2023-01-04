import 'package:flutter/material.dart';
import 'bodyofapp.dart';

class container extends StatelessWidget {
  container({
    required this.colors,
    this.cardChild,
  });
  final Color colors;
  final Widget? cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colors,
      ),
      child: cardChild,
      margin: EdgeInsets.all(15),
    );
  }
}
