import 'package:route_project/data/model/response/CategoryResponse.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeTabLoadingState extends HomeTabStates {}

class HomeTabErrorState extends HomeTabStates {
  String errorMessage;

  HomeTabErrorState({required this.errorMessage});
}

class HomeTabSuccessState extends HomeTabStates {
  CategoryResponse categoryResponse;

  HomeTabSuccessState({required this.categoryResponse});
}
