import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategotyWidget extends StatelessWidget {
  final String category;
  final String imageUrl;
  const CategotyWidget({
    super.key,
    required this.category,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFD4D4D4), width: 1.4),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              height: 45,
              image: NetworkImage(imageUrl),
            ),
            Text(
              category,
              style: TextStyle(
                fontSize: category == "Consumer Electronics" ? 6 : 8,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            )
          ],
        ),
      ),
    );
  }
}
