import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_carousel_slider/image_carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wac_machine_test/constatns/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> imageList = [
    "https://publications.chitkara.edu.in/wp-content/uploads/2020/09/nmbr.jpg",
    "https://publications.chitkara.edu.in/wp-content/uploads/2021/01/pds.jpeg",
    "https://publications.chitkara.edu.in/wp-content/uploads/2020/08/telemedicine.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 35,
        toolbarHeight: 66,
        backgroundColor: appbarColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset(
            "assets/icons/shoping_cart_icon.png",
            height: 35,
            width: 36,
            fit: BoxFit.cover,
          ),
        ),
        title: const AppBarSearchField(),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: SvgPicture.asset(
                      'assets/icons/notification_icon_svg.svg',
                      height: 18,
                      width: 18,
                    ),
                  ),
                  const Positioned(
                      right: 19,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.red,
                        child: Text(
                          "0",
                          style: TextStyle(color: Colors.white, fontSize: 6),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 130,
            child: GestureDetector(
              onTap: () {},

              ///user can add image height and dots color
              child: ImageCarouselSlider(
                items: imageList,
                imageHeight: 120,
                dotColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AppBarSearchField extends StatelessWidget {
  const AppBarSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 34,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: TextField(
          onSubmitted: (values) {},
          cursorColor: Colors.grey,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            suffixIcon: const Icon(
              CupertinoIcons.search,
              size: 15,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}
