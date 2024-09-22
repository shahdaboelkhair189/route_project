import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api_manager.dart';
import '../../../data/model/response/GetCartResponse.dart';
import 'cart_states.dart';

class CartScreenViewModel extends Cubit<CartStates> {
  CartScreenViewModel() : super(CartInitialState());

  //todo hold data and handle logic
  List<GetProductCart> productsList = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);

  void getCart() async {
    emit(GetCartLoadingState());
    var either = await ApiManager.getCart('productId');
    either.fold((l) => emit(GetCartErrorState(failures: l)), (response) {
      productsList = response.data!.products!;
      emit(GetCartSuccessState(getCartResponse: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingState());
    var either = await ApiManager.deleteItemInCart(productId);
    either.fold((l) => emit(DeleteItemInCartErrorState(failures: l)),
        (response) {
      // productsList = response.data!.products!;
      emit(GetCartSuccessState(getCartResponse: response));
    });
  }

  void updateCountInCart(String productId, int count) async {
    emit(UpdateCountInCartLoadingState());
    var either = await ApiManager.updateCountInCart(productId, count);
    either.fold((l) => emit(UpdateCountInCartErrorState(failures: l)),
        (response) {
      //productsList = response.data!.products!;
      emit(GetCartSuccessState(getCartResponse: response));
    });
  }
}
