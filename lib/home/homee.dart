import 'package:flutter/material.dart';
import 'package:route_project/app_colors.dart';
import 'package:route_project/foot_wear.dart';

import '../images.dart';

class Homee extends StatelessWidget {
  static const String routeName = 'homee';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity, // Ensures the Container takes full width

          padding: EdgeInsets.all(6),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/Group 5.png',
              ), // Full
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'what do you search for',
                        hintStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey,
                                ),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: Colors.indigo,
                          size: 40,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    // Adjust radius as needed
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 400,
                      child: Image.asset(
                        'assets/images/unsplash_PDX_a_82obo.png',
                        // Ensures the image takes the full width

                        fit: BoxFit
                            .fitWidth, // Fit to width while maintaining aspect ratio
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70, // Position text at the bottom of the image
                    left: 20, // Position text from the left side
                    child: Text(
                      '  UP TO\n\ 25% OFF',
                      style: TextStyle(
                        color: Appcolors.primaryColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200, // Position text at the bottom of the image
                    left: 20, // Position text from the left side
                    child: Text(
                      'For all Headphones &\n\ Airpods',
                      style: TextStyle(
                        color: Appcolors.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100, // Position button at the bottom of the image
                    left: 20, // Position button from the left side
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        primary: Appcolors.primaryColor,
                        // Button background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                        ),
                      ),
                      child: Text(
                        'Shop Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50, // Position button at the bottom of the image
                    left: 300, // Position button from the left side
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.circle, color: Appcolors.primaryColor),
                        // First dot in red
                        Icon(Icons.circle, color: Colors.white),
                        // Second dot in grey
                        Icon(Icons.circle, color: Colors.white),
                        // Third dot in grey
                      ],
                    ),
                  ),
                ],
              ),

              Container(
                alignment: Alignment.topLeft,
                // Aligns text to the center horizontally and vertically
                child: Text(
                  'Categories',
                  style: TextStyle(color: Appcolors.searchColor, fontSize: 25),
                ),
              ),
              Container(
                width: double.infinity,
                // Ensures the Container takes full width

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Images(
                        imagePath: 'assets/images/Ellipse 14.png',
                        name: 'Women\'s\nFashion'),
                    Images(
                        imagePath: 'assets/images/Ellipse 15.png',
                        name: '  men \'s\n Fashion'),
                    Images(
                        imagePath: 'assets/images/Ellipse 16.png',
                        name: 'Laptops &\'s\n Electronics'),
                    Images(
                        imagePath: 'assets/images/Ellipse 17.png',
                        name: 'Baby &\n\Toys'),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                // Ensures the Container takes full width

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Images(
                        imagePath: 'assets/images/Ellipse 2.png',
                        name: 'Beauty'),
                    Images(
                        imagePath: 'assets/images/Ellipse 3.png',
                        name: 'Headphones'),
                    Images(
                        imagePath: 'assets/images/Ellipse 1.png',
                        name: 'Skincare'),
                    Images(
                        imagePath: 'assets/images/Ellipse 4.png',
                        name: 'Cameras'),
                  ],
                ),
              ),

              Container(
                alignment: Alignment.topLeft,
                // Aligns text to the center horizontally and vertically
                child: Text(
                  'Home Appliance',
                  style: TextStyle(color: Appcolors.searchColor, fontSize: 25),
                ),
              ),
              Container(
                width: double.infinity,
                // Ensures the Container takes full width

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Images(imagePath: 'assets/images/Frame 9.png', name: ''),
                    Images(imagePath: 'assets/images/Frame 14.png', name: ' '),
                    Images(imagePath: 'assets/images/Frame 15.png', name: ''),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                // Ensures the Container takes full width

                height: 60,
                decoration: BoxDecoration(
                  color: Appcolors.primaryColor, // Background color
                  borderRadius: BorderRadius.circular(
                      15), // Half of width/height to make it a circle
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Handle button press
                        },
                        child: Icon(
                          Icons.home_filled,
                          color: Appcolors.whiteColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 100),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(FootWear.routeName);
                      },
                      child: Icon(
                        Icons.widgets_outlined,
                        color: Appcolors.whiteColor,
                      ),
                    ),
                    SizedBox(width: 100),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Handle button press
                        },
                        child: Icon(
                          Icons.favorite_border,
                          color: Appcolors.whiteColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.person_outline_sharp,
                          color: Appcolors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
