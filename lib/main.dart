// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:findjob/pages/detailJob_page.dart';
import 'package:findjob/pages/home_page.dart';
import 'package:findjob/pages/onboarding_page.dart';
import 'package:findjob/pages/signIn_page.dart';
import 'package:findjob/pages/signUp_page.dart';
import 'package:findjob/pages/splash_screen.dart';
import 'package:findjob/providers/auth_provider.dart';
import 'package:findjob/providers/category_provider.dart';
import 'package:findjob/providers/job_provider.dart';
import 'package:findjob/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(FindJob());

class FindJob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<JobProvider>(
          create: (context) => JobProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => SplashPage(),
          '/onboarding': (context) => OnBoardPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
          // '/': (context) => DetailJobPage(),
        },
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
      ),
    );
  }
}
