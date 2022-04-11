// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, unused_element, unnecessary_null_comparison

import 'package:findjob/model/user_model.dart';
import 'package:findjob/providers/auth_provider.dart';
import 'package:findjob/providers/user_provider.dart';
import 'package:findjob/theme.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //*Declaration
  bool isEmailValid = true;
  bool isUpload = true;
  //Fill input controller
  TextEditingController emailControl = TextEditingController(text: (''));
  TextEditingController nameControl = TextEditingController(text: (''));
  TextEditingController passControl = TextEditingController(text: (''));
  TextEditingController goalControl = TextEditingController(text: (''));

  @override
  Widget build(BuildContext context) {
    //!!Variabel
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    bool isLoading = false;

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: redColor,
          content: Text(message),
        ),
      );
    }

    //! Widget Dynamic
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: txRegular.copyWith(fontSize: 16, color: grayColor),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Begin New Journey',
              style: txSemiBold.copyWith(color: blackColor, fontSize: 24),
            )
          ],
        ),
      );
    }

    Widget showImages() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Center(
            child: InkWell(
          onTap: () {
            setState(() {
              isUpload = !isUpload;
            });
          },
          child: CircleAvatar(
            radius: 62,
            backgroundColor: Color(0xff2A327D),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xffFFFFFF),
              child: CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                  'https://png.pngtree.com/png-vector/20191129/ourlarge/pngtree-image-upload-icon-photo-upload-icon-png-image_2047547.jpg',
                ),
              ),
            ),
          ),
        )),
      );
    }

    Widget uploadImages() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Center(
            child: InkWell(
          onTap: () {
            setState(() {
              isUpload = !isUpload;
            });
          },
          child: CircleAvatar(
            radius: 62,
            backgroundColor: Color(0xff2A327D),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xffFFFFFF),
              child: CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                  'https://scontent.fjog4-1.fna.fbcdn.net/v/t1.6435-9/43364715_963196280556981_7189429749154840576_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeGNmTYvCyqGzf6bmxuHQ2Z08hRntbLcvUbyFGe1sty9Rq9lxzYi49JyJRRK1fI-2sE3AxRA6TqYJNq99tyYYZIu&_nc_ohc=9sMuprEPTnYAX_mRxRG&_nc_ht=scontent.fjog4-1.fna&oh=da103bac1ef4f013ab2ac1443cd51010&oe=61A3F2B9',
                ),
              ),
            ),
          ),
        )),
      );
    }

    Widget inputName() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Text(
              'Full Name',
              style: txRegular.copyWith(color: grayColor, fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: nameControl,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: purpleColor),
                ),
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

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
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
                //*-------------
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
        margin: EdgeInsets.only(top: 20),
        child: Column(
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
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: purpleColor),
                ),
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

    Widget inputGoal() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Text(
              'Your Goal',
              style: txRegular.copyWith(color: grayColor, fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: goalControl,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: purpleColor),
                ),
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

    Widget signUpBtn() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        height: 45,
        width: MediaQuery.of(context).size.width - (2 * 24),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TextButton(
                onPressed: () async {
                  if (emailControl.text.isEmpty ||
                      passControl.text.isEmpty ||
                      nameControl.text.isEmpty ||
                      goalControl.text.isEmpty) {
                    showError('Semua kolom HARUS di isi!');
                  } else {
                    setState(() {
                      isLoading = true;
                    });

                    UserModel user = await authProvider.register(
                      emailControl.text,
                      passControl.text,
                      nameControl.text,
                      goalControl.text,
                    );

                    setState(() {
                      isLoading = false;
                    });

                    if (user == null) {
                      showError('Email Sudah Terdaftar!');
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
                  'Sing Up',
                  style: txMedium.copyWith(fontSize: 14, color: whiteColor),
                ),
              ),
      );
    }

    Widget singInBtn() {
      return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-in');
            },
            child: Text(
              'Back to Sign In',
              style: txLight.copyWith(fontSize: 14, color: grayColor),
            ),
          ),
        ),
      );
    }

    //!--------------------------
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            header(),
            isUpload ? showImages() : uploadImages(),
            inputName(),
            inputEmail(),
            inputPass(),
            inputGoal(),
            signUpBtn(),
            singInBtn()
          ],
        ),
      )),
    );
  }
}
