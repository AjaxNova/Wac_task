import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarNotificationWidget extends StatelessWidget {
  const AppBarNotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
