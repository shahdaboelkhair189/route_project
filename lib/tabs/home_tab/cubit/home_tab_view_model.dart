import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_project/data/api_manager.dart';
import 'package:route_project/tabs/home_tab/cubit/home_tab_states.dart';

import '../../../data/model/response/category_or_brand.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  HomeTabViewModel() : super(HomeTabInitialState());
  List<CategoryOrBrand>? categoriesList;
  List<CategoryOrBrand>? brandsList;

  void getAllCategories() async {
    try {
      emit(HomeTabLoadingState());
      var response = await ApiManager.getAllCategories();
      if (response.statusMsg == 'fail') {
        emit(HomeTabErrorState(errorMessage: response.message!));
      } else {
        categoriesList = response.data!.cast<CategoryOrBrand>();

        emit(HomeTabSuccessState(categoryResponse: response));
      }
    } catch (e) {
      emit(HomeTabErrorState(errorMessage: e.toString()));
    }
  }
}
