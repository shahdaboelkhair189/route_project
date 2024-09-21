import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_project/app_colors.dart';
import 'package:route_project/home_screen/cubit/home_screen_states.dart';
import 'package:route_project/home_screen/home_screen_view_model.dart';

class HomeScreenView extends StatelessWidget {
  static const String routeName = 'home';
  final HomeScreenViewModel viewModel = HomeScreenViewModel();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenViewModel(),
      child: BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
        bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
            body: viewModel.tabs[viewModel.selectedIndex],
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: viewModel.selectedIndex,
              onItemSelected: (index) {
                viewModel.changedSelectedIndex(index);
              },
              items: [
                BottomNavyBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  activeColor: Appcolors.primaryColor,
                  inactiveColor: Colors.grey,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.search),
                  title: Text('Search'),
                  activeColor: Appcolors.primaryColor,
                  inactiveColor: Colors.grey,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text('Favorites'),
                  activeColor: Appcolors.primaryColor,
                  inactiveColor: Colors.grey,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile'),
                  activeColor: Appcolors.primaryColor,
                  inactiveColor: Colors.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
