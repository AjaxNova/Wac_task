import 'package:flutter/material.dart';
import 'package:flutter_image_carousel_slider/image_carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:wac_machine_test/view/widgets/category_widget.dart';
import 'package:wac_machine_test/view/widgets/headline_text_widget.dart';
import 'package:wac_machine_test/view/widgets/product_widget.dart';
import 'package:wac_machine_test/viewModel/provider/home_screen_provider.dart';

class HomeScreenBottomTab extends StatelessWidget {
  const HomeScreenBottomTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, value, child) {
        return value.isLoading
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              )
            : ListView(
                children: [
                  SizedBox(
                    height: 114,
                    child: GestureDetector(
                      onTap: () {},

                      ///user can add image height and dots color
                      child: ImageCarouselSlider(
                        items: value.bannerImageList!,
                        imageHeight: 104,
                        dotColor: Colors.white,
                      ),
                    ),
                  ),
                  const HeadlineTextWidget(
                    textVal: "Most Popular",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 5),
                    child: SizedBox(
                      height: 215,
                      width: double.infinity,
                      child: ListView.separated(
                        itemCount: value.mostpopularproducts.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 7,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final model = value.mostpopularproducts[index];
                          return ProductWidget(model: model);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 106,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                value.singleBanner.first.imageUrl!)),
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const HeadlineTextWidget(
                    textVal: "Categories",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: value.categories[0].contents!
                          .map((item) => CategotyWidget(
                                category: item.title!,
                                imageUrl: item.imageUrl!,
                              ))
                          .toList(),
                      // CategotyWidget(
                      //   imageUrl: mo,
                      //   category: "Grocery & Foods",
                      // ),
                      // CategotyWidget(
                      //   category: "Mobile & devices",
                      // ),
                      // CategotyWidget(
                      //   category: "Consumer Electronics",
                      // ),
                      // CategotyWidget(
                      //   category: "Kids & Moms",
                      // ),
                    ),
                  ),
                  const HeadlineTextWidget(
                    textVal: "Best Sellers",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 5),
                    child: SizedBox(
                      height: 215,
                      width: double.infinity,
                      child: ListView.separated(
                        itemCount: value.bestSellerProdcuts.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 7,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final model = value.bestSellerProdcuts[index];
                          return ProductWidget(model: model);
                        },
                      ),
                    ),
                  ),

                  // Container(
                  //   height: 153,
                  //   width: 96,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: const Color(0xFFD4D4D4), width: 1.4),
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(10)),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 5.0, right: 6),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         SizedBox(
                  //             height: 70,
                  //             child: Image(image: NetworkImage(productList.first))),
                  //         SizedBox(
                  //             height: 16,
                  //             width: 44,
                  //             child: Container(
                  //               decoration: BoxDecoration(
                  //                 color: const Color(0xFFFB7B4E),
                  //                 borderRadius: BorderRadius.circular(5),
                  //               ),
                  //               child: Center(
                  //                 child: Text("Sale 60% off",
                  //                     style: TextStyle(
                  //                         fontSize: 5,
                  //                         fontFamily:
                  //                             GoogleFonts.montserrat().fontFamily)),
                  //               ),
                  //             )),
                  //         const SizedBox(
                  //           height: 7,
                  //         ),
                  //         Wrap(
                  //           children: [
                  //             Text(
                  //               "Lenovo K3 Mini Outdoor Wireless Speaker",
                  //               style: TextStyle(
                  //                   fontFamily: GoogleFonts.montserrat().fontFamily,
                  //                   fontSize: 6),
                  //             ),
                  //           ],
                  //         ),
                  //         const SizedBox(
                  //           height: 5,
                  //         ),
                  //         SizedBox(
                  //             height: 10,
                  //             width: 50,
                  //             child: RatingBar.builder(
                  //               itemSize: 10,
                  //               initialRating: 3,
                  //               minRating: 1,
                  //               direction: Axis.horizontal,
                  //               allowHalfRating: true,
                  //               itemCount: 5,
                  //               itemBuilder: (context, _) => const Icon(
                  //                 Icons.star,
                  //                 color: Colors.amber,
                  //               ),
                  //               onRatingUpdate: (rating) {
                  //                 print(rating);
                  //               },
                  //             ))
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              );
      },
    );
  }
}
