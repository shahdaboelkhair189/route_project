import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_project/app_colors.dart';
import 'package:route_project/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:route_project/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:route_project/tabs/home_tab/widgets/announcements_section.dart';
import 'package:route_project/tabs/home_tab/widgets/category_brand_widgets.dart';
import 'package:route_project/tabs/home_tab/widgets/row_section_widget.dart';

import '../../../images.dart';

class Homee extends StatelessWidget {
  HomeTabViewModel viewModel = HomeTabViewModel();
  static const String routeName = 'homee';
  HomeTabViewModel cubit = HomeTabViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel..getAllCategories(),
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                // Ensures the Container takes full width

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
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
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
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: AnnouncmementsSection()),

                    SizedBox(
                      height: 10,
                    ),
//
//                   viewModel.categoryList!.isEmpty?
// Center(child:CircularProgressIndicator(
//
//   color: Appcolors.primaryColor,
                    RowSectionWidget(name: 'Categeroies'),
                    state is HomeTabSuccessState
                        ? CategoriesBrandsWidget(
                            list: viewModel.categoriesList!)
                        : Center(
                            child: CircularProgressIndicator(
                              color: Appcolors.primaryColor,
                            ),
                          ),

                    //
                    // Container(
                    //   alignment: Alignment.topLeft,
                    //   // Aligns text to the center horizontally and vertically
                    //   child: RowSectionWidget(name: 'Categories'),),
                    // SizedBox(height: 10),
                    //
                    //
                    // Container(
                    //   width: double.infinity,
                    //   // Ensures the Container takes full width
                    //
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Images(
                    //           imagePath: 'assets/images/Ellipse 14.png',
                    //           name: 'Women\'s\nFashion'),
                    //       Images(
                    //           imagePath: 'assets/images/Ellipse 15.png',
                    //           name: '  men \'s\n Fashion'),
                    //       Images(
                    //           imagePath: 'assets/images/Ellipse 16.png',
                    //           name: 'Laptops &\'s\n Electronics'),
                    //       Images(
                    //           imagePath: 'assets/images/Ellipse 17.png',
                    //           name: 'Baby &\n\Toys'),
                    //     ],
                    //   ),
                    // ),
                    //
                    // Container(
                    //   width: double.infinity,
                    //   // Ensures the Container takes full width
                    //
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Images(
                    //           imagePath: 'assets/images/Ellipse 2.png',
                    //           name: 'Beauty'),
                    //       Images(
                    //           imagePath: 'assets/images/Ellipse 3.png',
                    //           name: 'Headphones'),
                    //       Images(
                    //           imagePath: 'assets/images/Ellipse 1.png',
                    //           name: 'Skincare'),
                    //       Images(
                    //           imagePath: 'assets/images/Ellipse 4.png',
                    //           name: 'Cameras'),
                    //     ],
                    //   ),
                    // ),

                    Container(
                      alignment: Alignment.topLeft,
                      // Aligns text to the center horizontally and vertically
                      child: Text(
                        'Home Appliance',
                        style: TextStyle(
                            color: Appcolors.searchColor, fontSize: 25),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      // Ensures the Container takes full width

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Images(
                              imagePath: 'assets/images/Frame 9.png', name: ''),
                          Images(
                              imagePath: 'assets/images/Frame 14.png',
                              name: ' '),
                          Images(
                              imagePath: 'assets/images/Frame 15.png',
                              name: ''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ),
        );
      },
    );
  }
}