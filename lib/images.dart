import 'package:flutter/material.dart';
import 'package:route_project/app_colors.dart';

class Images extends StatelessWidget {
  late String imagePath;

  late String name;

  Images({required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Image.asset(imagePath),
        Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(2),
            child: Text(name,
                style: TextStyle(fontSize: 20, color: AppColors.searchColor)))
      ],
    ));
  }
}
