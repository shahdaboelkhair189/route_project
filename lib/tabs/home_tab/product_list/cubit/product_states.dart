import 'package:route_project/data/model/response/ADDCARTRESPONSE.dart';
import 'package:route_project/data/model/response/ProductResponse.dart';

import '../../../../data/failures.dart';

abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductErrorState extends ProductStates {
  String errorMessage;

  ProductErrorState({required this.errorMessage});
}

class ProductSuccessState extends ProductStates {
  ProductResponse productResponse;

  ProductSuccessState({required this.productResponse});
}

class AddCartLoadingState extends ProductStates {}

class AddCartErrorState extends ProductStates {
  Failures failures;

  AddCartErrorState({required this.failures});
}

class AddCartSuccessState extends ProductStates {
  Addcartresponse cartResponse;

  AddCartSuccessState({required this.cartResponse});
}
