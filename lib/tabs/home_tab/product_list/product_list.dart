import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_project/tabs/home_tab/product_list/cubit/product_states.dart';
import 'package:route_project/tabs/home_tab/product_list/cubit/product_view_model.dart';
import 'package:route_project/tabs/home_tab/product_list/product_details_view.dart';

import '../../../app_colors.dart';
import '../../../data/model/response/ProductResponse.dart';
import '../../../home/cart/widget/cart_screen.dart';

class ProductList extends StatelessWidget {
  static const String routeName = 'product_list';
  ProductViewModel viewModel = ProductViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getAllProducts(),
      child: BlocBuilder<ProductViewModel, ProductStates>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Image.asset(
                      'assets/images/route.png',
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(children: [
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(color: AppColors.primaryColor),
                        decoration: InputDecoration(
                          labelText: 'What do you search for?',
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 18,
                            color: AppColors.whiteColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(color: AppColors.primaryColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(color: AppColors.primaryColor),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.primaryColor,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      child: Badge(
                        label: Text(viewModel.numOfCartItem.toString()),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 28,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  ]),
                ),
                SizedBox(height: 20),
                state is ProductSuccessState || state is AddCartSuccessState
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                              // Adjusts the height of the cards
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: viewModel.productList!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      ProductDetailsView.routeName,
                                      arguments: viewModel.productList![index]);
                                },
                                child:
                                    ProductCard(viewModel.productList![index]),
                              );
                            },
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor))
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.network(
                    product.imageCover ?? '',
                    height: 200,
                    width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Nike Air Jordan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  product.title ?? "",
                    style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "EGP ${product.price}",
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                        ),
                        Text(
                            "EGP ${product.price}",
                            style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Row(
                          children: [
                              Text("Reviews ${product.ratingsAverage}",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                  )),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.red),
                onPressed: () {},
              ),
            ),
          ),
            Positioned(
              right: 16, // Distance from the right
              bottom: 16, // Distance from the bottom
              child: InkWell(
                  onTap: () {
                    //add to cart
                    ProductViewModel.get(context).addToCart(product.id ?? '');
                  },
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.add_circle,
                    size: 32,
                    color: AppColors.primaryColor,
                  )),
            ),
          ],
        ));
  }
}
