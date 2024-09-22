import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

class CategoryWidget extends StatelessWidget {
  late String imagePath;

  late String name;

  CategoryWidget({required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Image.asset(imagePath),
            Container(
                margin: EdgeInsets.all(9),
                padding: EdgeInsets.all(4),
                child: Text(name,
                    style:
                        TextStyle(fontSize: 20, color: AppColors.searchColor)))
          ],
        ),
      ),
    );
  }
}
