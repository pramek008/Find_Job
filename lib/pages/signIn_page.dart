// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, unnecessary_null_comparison

import 'package:findjob/model/user_model.dart';
import 'package:findjob/pages/home_page.dart';
import 'package:findjob/pages/signUp_page.dart';
import 'package:findjob/providers/auth_provider.dart';
import 'package:findjob/providers/user_provider.dart';
import 'package:findjob/theme.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isEmailValid = true;
  TextEditingController emailControl = TextEditingController(text: '');
  TextEditingController passControl = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    //!Provider
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: redColor,
          content: Text(message),
        ),
      );
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
          bottom: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign In',
              style: txRegular.copyWith(fontSize: 16, color: grayColor),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Build Your Career',
              style: txSemiBold.copyWith(color: blackColor, fontSize: 24),
            ),
          ],
        ),
      );
    }

    Widget illustration() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Center(
          child: Image.asset(
            'assets/illustration.png',
            width: MediaQuery.of(context).size.width - (2 * 49),
          ),
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 40,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: txRegular.copyWith(color: grayColor, fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              //! Email Validation Logic
              controller: emailControl,
              onChanged: (value) {
                //*Cek on console
                //print(value);
                bool isValid = EmailValidator.validate(value);
                //print(isValid);
                if (isValid) {
                  setState(() {
                    isEmailValid = true;
                  });
                } else {
                  setState(() {
                    isEmailValid = false;
                  });
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide:
                      BorderSide(color: isEmailValid ? purpleColor : redColor),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                fillColor: textFieldClr,
                filled: true,
              ),
              cursorColor: isEmailValid ? purpleColor : redColor,
              style: txRegular.copyWith(
                  fontSize: 16, color: isEmailValid ? purpleColor : redColor),
            ),
          ],
        ),
      );
    }

    Widget inputPass() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: txRegular.copyWith(color: grayColor, fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: passControl,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(color: purpleColor)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                fillColor: textFieldClr,
                filled: true,
              ),
              cursorColor: purpleColor,
              style: txRegular.copyWith(fontSize: 16, color: purpleColor),
            ),
          ],
        ),
      );
    }

    Widget signInBtn() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 40,
        ),
        height: 45,
        width: MediaQuery.of(context).size.width - (2 * 24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66), color: purpleColor),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: whiteColor,
                ),
              )
            : TextButton(
                onPressed: () async {
                  if (emailControl.text.isEmpty || passControl.text.isEmpty) {
                    showError('Semua kolom HARUS di isi!');
                  } else {
                    setState(() {
                      isLoading = true;
                    });

                    UserModel user = await authProvider.login(
                      emailControl.text,
                      passControl.text,
                    );

                    setState(() {
                      isLoading = false;
                    });

                    if (user == null) {
                      showError('Email atau Password Salah!');
                    } else {
                      userProvider.user = user;
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    }
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: purpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(66),
                  ),
                ),
                child: Text(
                  'Sing In',
                  style: txMedium.copyWith(fontSize: 14, color: whiteColor),
                ),
              ),
      );
    }

    Widget signUpBtn() {
      return Container(
        margin: EdgeInsets.only(top: 20, bottom: 60),
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: Text(
              'Create New Account',
              style: txLight.copyWith(fontSize: 14, color: grayColor),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            illustration(),
            inputEmail(),
            inputPass(),
            signInBtn(),
            signUpBtn()
          ],
        ),
      ),
    );
  }
}
