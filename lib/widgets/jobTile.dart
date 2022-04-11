// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:findjob/model/job_model.dart';
import 'package:findjob/pages/detailjob_page.dart';
import 'package:findjob/theme.dart';
import 'package:flutter/material.dart';

class JobTile extends StatelessWidget {
  final JobModel job;
  JobTile({this.job});

  // final String name;
  // final String companyName;
  // final String companyLogo;

  // JobTile({this.name, this.companyName, this.companyLogo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailJobPage(
                      jobModel: job,
                    )));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            job.companyLogo,
            height: 45,
            width: 45,
          ),
          SizedBox(
            width: 27,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.name,
                  style: txMedium.copyWith(color: blackColor, fontSize: 16),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  job.companyName,
                  style: txLight.copyWith(color: grayColor, fontSize: 14),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 2,
                  color: Color(0xffECEDF1),
                ),
                SizedBox(height: 16)
              ],
            ),
          )
        ],
      ),
    );
  }
}
