import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            suffixIcon: Icon(
              CupertinoIcons.search,
              size: 15,
              color: Colors.grey.shade500,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}
