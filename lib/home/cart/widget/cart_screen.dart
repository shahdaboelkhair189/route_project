import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_project/home/cart/cubit/cart_screen_view_model.dart';
import 'package:route_project/home/cart/cubit/cart_states.dart';

import '../../../app_colors.dart';
import 'cart_item.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenViewModel, CartStates>(
        bloc: CartScreenViewModel.get(context)..getCart(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.primaryColor,
                  )),
              title: Text(
                'Cart',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: AppColors.primaryColor,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.primaryColor,
                    ))
              ],
            ),
            body: state is GetCartSuccessState
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return CartItem(
                              productCart:
                                  state.getCartResponse.data!.products![index],
                            );
                          },
                          itemCount:
                              state.getCartResponse.data!.products!.length,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 200.h, left: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: Text(
                                    'Total Price',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                ),
                                Text(
                                  'EGP ${state.getCartResponse.data!.totalCartPrice}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.pink,
                                  ),
                                )
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    disabledBackgroundColor:
                                        AppColors.whiteColor,
                                    backgroundColor: AppColors.whiteColor),
                                child: Container(
                                  height: 48.h,
                                  width: 270.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Checkout',
                                          style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.whiteColor,
                                        size: 18.sp,
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor),
                  ),
          );
        });
  }
}
