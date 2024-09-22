import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_project/data/api_manager.dart';
import 'package:route_project/tabs/home_tab/product_list/cubit/product_states.dart';

import '../../../../data/model/response/ProductResponse.dart';

class ProductViewModel extends Cubit<ProductStates> {
  ProductViewModel() : super(ProductInitialState());

  List<Product>? productList;
  int numOfCartItem = 0;

  static ProductViewModel get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    try {
      emit(ProductLoadingState());
      var response = await ApiManager.getAllProducts();
      if (response.statusMsg == 'fail') {
        emit(ProductErrorState(errorMessage: response.message!));
      } else {
        productList = response.data ?? [];
        emit(ProductSuccessState(productResponse: response));
      }
    } catch (e) {
      emit(ProductErrorState(errorMessage: e.toString()));
    }
  }

  void addToCart(String productId) async {
    emit(AddCartLoadingState());
    var either = await ApiManager.addToCart(productId);
    either.fold((error) => emit(AddCartErrorState(failures: error)),
        (response) {
      numOfCartItem = response.numOfCartItems!.toInt();
      print("number of cart item :$numOfCartItem");
      emit(AddCartSuccessState(cartResponse: response));
    });
  }
}
