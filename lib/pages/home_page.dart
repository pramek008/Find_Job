// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, unused_element, prefer_const_literals_to_create_immutables, unused_import

import 'package:findjob/model/categoriesData.dart';
import 'package:findjob/model/job_model.dart';
import 'package:findjob/model/postItemData.dart';
import 'package:findjob/providers/category_provider.dart';
import 'package:findjob/providers/job_provider.dart';
import 'package:findjob/providers/user_provider.dart';
import 'package:findjob/widgets/card_categories.dart';
import 'package:findjob/theme.dart';
import 'package:findjob/widgets/navBar.dart';
import 'package:findjob/widgets/jobTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

    //! Widget Header
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: defaultMargin),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Howdy',
                  style: txRegular.copyWith(color: grayColor, fontSize: 16),
                ),
                Text(
                  userProvider.user.name,
                  style: txSemiBold.copyWith(color: blackColor, fontSize: 24),
                )
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xff2A327D),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xffFFFFFF),
                child: CircleAvatar(
                    radius: 26,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/85/5b/2b/855b2b606c64c961da2922a240a43236.jpg',
                    )
                    // 'https://images.unsplash.com/photo-1614583225154-5fcdda07019e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1490&q=80'),
                    ),
              ),
            ),
          ],
        ),
      );
    }

    //!Widget Body
    Widget hotCategories() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              'Hot Categories',
              style: txRegular.copyWith(fontSize: 16, color: blackColor),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 200,
            child: FutureBuilder<List<CategoryModel>>(
              future: categoryProvider.getCategories(),
              builder: (context, snapshot) {
                // print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.done) {
                  int index = -1;
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.map((category) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(
                            left: index == 0 ? defaultMargin : 0),
                        child: CategoriesCard(
                          category,
                        ),
                      );
                    }).toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      );
    }

    Widget justPosted() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Just Posted',
              style: txRegular.copyWith(color: blackColor, fontSize: 16),
            ),
            SizedBox(
              height: 24,
            ),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJob(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                      children: snapshot.data
                          .map((job) => JobTile(
                                job: job,
                              ))
                          .toList());
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      );
    }

    Widget btnNavBar() {
      return Container(
        height: 50,
        width: MediaQuery.of(context).size.width - (2 * 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtomNavbarItem(
              imgUrl: 'assets/icon_home.png',
              hasNotif: false,
              active: true,
            ),
            ButtomNavbarItem(
              imgUrl: 'assets/icon_notification.png',
              hasNotif: false,
              active: false,
            ),
            ButtomNavbarItem(
              imgUrl: 'assets/icon_fav.png',
              hasNotif: true,
              active: false,
            ),
            ButtomNavbarItem(
              imgUrl: 'assets/icon_user.png',
              hasNotif: false,
              active: false,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      //! FAB
      floatingActionButton: btnNavBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      //!
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          children: [
            header(),
            hotCategories(),
            justPosted(),
          ],
        ),
      )),
    );
  }
}
