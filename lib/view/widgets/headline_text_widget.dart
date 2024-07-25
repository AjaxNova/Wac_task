import 'package:flutter/material.dart';

class HeadlineTextWidget extends StatelessWidget {
  final String textVal;
  const HeadlineTextWidget({
    super.key,
    required this.textVal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textVal,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          const Text(
            "view all",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
