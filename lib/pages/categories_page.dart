// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:findjob/model/categoriesData.dart';
import 'package:findjob/model/job_model.dart';
import 'package:findjob/providers/job_provider.dart';
import 'package:findjob/theme.dart';
import 'package:findjob/widgets/jobTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  // final String jobTitleHome;
  // final String imgUrl;

  // CategoriesPage({this.jobTitleHome, this.imgUrl});

  final CategoryModel categoryData;
  CategoriesPage({this.categoryData});

  @override
  Widget build(BuildContext context) {
    //! Provider
    var jobProvider = Provider.of<JobProvider>(context);

    Widget head() {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
            child: Image.network(
              categoryData.imgUrl,
              height: 270,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 270,
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
            bottom: 30,
            left: 23,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryData.name,
                  style: txSemiBold.copyWith(color: whiteColor),
                ),
                Text(
                  '12,309 available',
                  style: txRegular.copyWith(color: whiteColor),
                )
              ],
            ),
          ),
        ],
      );
    }

    Widget companies() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Big Companies',
              style: txRegular,
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobsByCategory(categoryData.name),
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

    Widget newStartup() {
      return Container(
        margin: EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Startups',
              style: txRegular,
            ),
            SizedBox(
              height: 20,
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

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Stack(
        children: [
          head(),
          ListView(
            children: [
              SizedBox(
                height: 270,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    color: whiteColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      companies(),
                      newStartup(),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
