import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_project/data/model/response/CategoryOrBrandResponse.dart';

import 'categories_brands_items.dart';

class CategoriesBrandsWidget extends StatelessWidget {
  List<CategoryOrBrand> list;

  CategoriesBrandsWidget({required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500.h,
        child: GridView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
          itemBuilder: (context, index) {
            return CategoryBrandItems(
              categoryOrBrand: list[index],
            );
          },
        ));
  }
}
