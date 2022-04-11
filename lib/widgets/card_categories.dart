// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:findjob/model/categoriesData.dart';
import 'package:findjob/pages/categories_page.dart';
import 'package:findjob/theme.dart';
import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
  // final String name;
  // final String imgUrl;

  // CategoriesCard({this.imgUrl, this.name});

  final CategoryModel categories;
  CategoriesCard(this.categories);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: defaultMargin),
      width: 150,
      height: 200,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoriesPage(
                      categoryData: categories,
                    )),
          );
        },
        child: Stack(children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              // child: Image.asset(
              //   categories.imgUrl, //!
              //   fit: BoxFit.cover,
              child: Image.network(
                categories.imgUrl,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xff2A327D), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 1,
            left: 16,
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Text(
                categories.name, //!
                style: txMedium.copyWith(color: whiteColor, fontSize: 18),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
