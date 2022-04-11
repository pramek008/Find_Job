// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, duplicate_ignore
import 'dart:async';

import 'package:findjob/pages/onboarding_page.dart';
import 'package:findjob/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnBoardPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 59,
              height: 76,
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 50,
            ),
            Text(
              'FutureJob',
              style: txSemiBold.copyWith(color: whiteColor, fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
