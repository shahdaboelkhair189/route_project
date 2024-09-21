import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_colors.dart';
import '../../../data/model/response/category_or_brand.dart';

class CategoryBrandItems extends StatelessWidget {
  //todo : category or brand model
  CategoryOrBrand categoryOrBrand;

  CategoryBrandItems({required this.categoryOrBrand});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            backgroundImage: NetworkImage(categoryOrBrand.image ?? ''),
            radius: 50.r,
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
            flex: 2,
            child: Text(
              categoryOrBrand.name ?? '',
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Appcolors.primaryColor,
              ),
            ))
      ],
    );
  }
}
