import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wac_machine_test/model/product_model.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.model,
  });

  final Content model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      width: 145,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD4D4D4), width: 1.4),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 5, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Center(
              child: SizedBox(
                  height: 80,
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(model.productImage ??
                          "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg"))),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 26,
                width: 74,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFB7B4E),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text("Sale ${model.discount}",
                        style: TextStyle(
                            fontSize: 9,
                            fontFamily: GoogleFonts.montserrat().fontFamily)),
                  ),
                )),
            const SizedBox(
              height: 8,
            ),
            Wrap(
              children: [
                Text(
                  model.productName!,
                  maxLines: 2,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      fontSize: 10,
                      height: 1),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
                height: 10,
                width: 50,
                child: RatingBar.builder(
                  itemSize: 10,
                  initialRating: model.productRating!.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )),
            const SizedBox(
              height: 5,
            ),
            model.discount != null
                ? Row(
                    children: [
                      Flexible(
                        child: Text(
                          model.offerPrice!.replaceRange(0, 3, "₹ "),
                          //because the fetched string shows another symbol instead of rupee
                          style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontSize: 10),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        model.actualPrice!.replaceRange(0, 3, "₹ "),
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            decoration: TextDecoration.lineThrough,
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontSize: 14),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Text(
                        model.actualPrice!.replaceRange(0, 3, "₹ "),
                        style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontSize: 14),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
