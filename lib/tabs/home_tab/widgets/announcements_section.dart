import 'package:flutter/cupertino.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_project/app_colors.dart';

class AnnouncmementsSection extends StatelessWidget {
  final List<String> sliderImages = [
    'assets/images/an1.png',
    'assets/images/an2.png',
    'assets/images/an3.png',
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate dynamic height based on the screen size
    final double screenHeight = MediaQuery.of(context).size.height;
    final double slideshowHeight =
        screenHeight * 0.3; // Adjust to 30% of the screen height

    return ImageSlideshow(
      initialPage: 0,
      indicatorColor: AppColors.primaryColor,
      indicatorBackgroundColor: AppColors.whiteColor,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
      children: sliderImages
          .map((url) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  url,
                  fit: BoxFit.cover, // Make the image cover the area
                  width: double.infinity, // Make the width fill the container
                  height: 1000.h, // Set the height dynamically
                ),
              ))
          .toList(),
    );
  }
}
