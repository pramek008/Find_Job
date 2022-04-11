// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ButtomNavbarItem extends StatelessWidget {
  String imgUrl;
  bool hasNotif;
  bool active;

  ButtomNavbarItem({this.imgUrl, this.hasNotif, this.active});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imgUrl,
          width: 24,
          height: 24,
          color: active ? const Color(0xff272C2F) : const Color(0xffB3B5C4),
        ),
        Positioned(
          top: 0,
          left: 14.5,
          bottom: 14,
          child: hasNotif
              ? Image.asset(
                  'assets/icon_update.png',
                  width: 9,
                  height: 9,
                )
              : Container(),
        )
        // Image.asset(
        //   'assets/icon_home.png',
        //   width: 24,
        //   height: 24,
        // ),
        // Positioned(
        //   top: 2,
        //   left: 16,
        //   bottom: 11,
        //   child: Image.asset(
        //     'assets/icon_update.png',
        //     height: 8,
        //     width: 8,
        //   ),
        // )
      ],
    );
  }
}
