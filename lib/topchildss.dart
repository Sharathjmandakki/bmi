import 'package:flutter/material.dart';

class topchilds extends StatelessWidget {
  topchilds({required this.icon, required this.lable});
  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          lable,
          style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}
