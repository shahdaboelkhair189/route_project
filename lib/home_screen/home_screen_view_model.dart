import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_project/home_screen/cubit/home_screen_states.dart';

import '../tabs/favourite_tab/favourite_tab.dart';
import '../tabs/home_tab/widgets/homee.dart';
import '../tabs/product_list.dart';
import '../tabs/profile_screen.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeScreenInitialState());

  int selectedIndex = 0;
  final List<Widget> tabs = [
    Homee(), // new widget for the home tab content
    ProductList(),
    FavouriteTab(),
    ProfileScreen(),
  ];

  void changedSelectedIndex(int newIndex) {
    emit(HomeScreenInitialState());
    selectedIndex = newIndex;
    emit(ChangeSelectedIndexState());
  }
}
