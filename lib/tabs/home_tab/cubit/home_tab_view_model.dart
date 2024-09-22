import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_project/data/api_manager.dart';
import 'package:route_project/data/model/response/CategoryOrBrandResponse.dart';
import 'package:route_project/tabs/home_tab/cubit/home_tab_states.dart';


class HomeTabViewModel extends Cubit<HomeTabStates> {
  HomeTabViewModel() : super(HomeTabInitialState());
  List<CategoryOrBrand>? categoriesList = [];
  List<CategoryOrBrand>? brandsList = [];

  void getAllCategories() async {
    try {
      emit(HomeCategoryLoadingState());
      var response = await ApiManager.getAllCategories();
      if (response.statusMsg == 'fail') {
        emit(HomeCategoryErrorState(errorMessage: response.message!));
      } else {
        categoriesList = response.data ?? [];

        emit(HomeCategorySuccessState(categoryResponse: response));
      }
    } catch (e) {
      emit(HomeCategoryErrorState(errorMessage: e.toString()));
    }
  }

  void getAllBrands() async {
    try {
      emit(HomeBrandLoadingState());
      var response = await ApiManager.getAllBrands();
      if (response.statusMsg == 'fail') {
        emit(HomeBrandErrorState(errorMessage: response.message!));
      } else {
        brandsList = response.data ?? [];

        emit(HomeBrandSuccessState(categoryResponse: response));
      }
    } catch (e) {
      emit(HomeBrandErrorState(errorMessage: e.toString()));
    }
  }
}
