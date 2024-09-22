import 'package:route_project/data/model/response/CategoryOrBrandResponse.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeCategoryLoadingState extends HomeTabStates {}

class HomeCategoryErrorState extends HomeTabStates {
  String errorMessage;

  HomeCategoryErrorState({required this.errorMessage});
}

class HomeCategorySuccessState extends HomeTabStates {
  CategoryOrBrandResponse categoryResponse;

  HomeCategorySuccessState({required this.categoryResponse});
}

class HomeBrandLoadingState extends HomeTabStates {}

class HomeBrandErrorState extends HomeTabStates {
  String errorMessage;

  HomeBrandErrorState({required this.errorMessage});
}

class HomeBrandSuccessState extends HomeTabStates {
  CategoryOrBrandResponse categoryResponse;

  HomeBrandSuccessState({required this.categoryResponse});
}
