import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;
  final String label;

  const MyTab({
    super.key,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 50,
      child: Column(
        children: [
          Image.asset(
            iconPath,

            color: Colors.grey[800],
            height: 32,
            width: 32,
            
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}