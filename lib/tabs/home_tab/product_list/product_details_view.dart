import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app_colors.dart';
import '../../../data/model/response/ProductResponse.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsView extends StatelessWidget {
  static String routeName = 'product_details_view';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text("Product details"),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
        actions: [
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.search)),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.pinkAccent,
                  width: 20,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ImageSlideshow(
                    initialPage: 0,
                    indicatorColor: Colors.pinkAccent,
                    indicatorBackgroundColor: AppColors.whiteColor,
                    indicatorBottomPadding: 20,
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: args.images!
                        .map(
                          (url) => Image.network(
                            url,
                            fit: BoxFit.cover,
                            height: 500,
                            width: double.infinity,
                          ),
                        )
                        .toList()),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    args.title ?? '',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
                Text(
                  'EGP ${args.price}',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.pinkAccent, width: 1),
                      ),
                      child: Text(
                        "Sold : ${args.sold}",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Icon(Icons.star, color: Colors.amber, size: 18),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${args.ratingsAverage}",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ],
                )),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_circle_outline_rounded,
                          color: AppColors.whiteColor,
                          size: 28,
                        ),
                      ),
                      Text(
                        '1',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          color: AppColors.whiteColor,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Description',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ReadMoreText(
              args.description ?? '',
              trimMode: TrimMode.Line,
              trimLines: 2,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.pinkAccent.withOpacity(0.6),
              ),
              trimCollapsedText: 'Show More',
              trimExpandedText: 'Show Less',
              moreStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
              lessStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 120,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total Price',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "EGP ${args.price}",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 32,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.add_shopping_cart_outlined),
                        Text(
                          "Add to cart",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
