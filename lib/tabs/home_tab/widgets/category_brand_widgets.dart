import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/response/category_or_brand.dart';
import 'categories_brands_items.dart';

class CategoriesBrandsWidget extends StatelessWidget {
  List<CategoryOrBrand> list;

  CategoriesBrandsWidget({required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.h,
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
