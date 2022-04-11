// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, unused_import

import 'package:findjob/pages/signIn_page.dart';
import 'package:findjob/pages/signUp_page.dart';
import 'package:findjob/theme.dart';
import 'package:flutter/material.dart';

class OnBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget background() {
      return Image.asset(
        'assets/bg_image1.png',
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromRGBO(42, 50, 125, 0.67),
        colorBlendMode: BlendMode.multiply,
      );
    }

    Widget content() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Build Your Next Future Career Like \na Master',
              style: txRegular.copyWith(color: whiteColor, fontSize: 32),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '18,000 jobs available',
              style: txLight.copyWith(color: whiteColor, fontSize: 14),
            ),
            Spacer(),
            Center(
              child: Column(
                children: [
                  //! Get Started BUTTON
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width - (2 * 80),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(66),
                        color: whiteColor),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-up');
                      },
                      child: Text(
                        'Get Started',
                        style:
                            txMedium.copyWith(fontSize: 14, color: purpleColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  //! Sign In BUTTON
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width - (2 * 80),
                    decoration: BoxDecoration(
                        border: Border.all(color: whiteColor),
                        borderRadius: BorderRadius.circular(66)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-in');
                      },
                      child: Text('Sign In',
                          style: txMedium.copyWith(
                              color: whiteColor, fontSize: 14)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          background(),
          content(),
        ],
      )),
    );
  }
}
