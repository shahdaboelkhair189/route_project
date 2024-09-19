import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'category_widget.dart';

class FootWear extends StatelessWidget {
  static const String routeName = 'foot_wear';

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

              Container(
                width: double.infinity,
                // Ensures the Container takes full width

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoryWidget(
                        imagePath: 'assets/images/Frame 9.png',
                        name:
                            '   Nike Air Jordon   \n\ Nike shoes flexible for women  \n\  EGP 1200\n\ Review(4.6)'),
                    CategoryWidget(
                        imagePath: 'assets/images/Frame 14.png', name: ' '),
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
