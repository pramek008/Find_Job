// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names, unused_element, prefer_const_constructors_in_immutables

import 'package:findjob/model/job_model.dart';
import 'package:findjob/theme.dart';
import 'package:flutter/material.dart';

class DetailJobPage extends StatefulWidget {
  final JobModel jobModel;
  DetailJobPage({this.jobModel});

  @override
  State<DetailJobPage> createState() => _DetailJobPageState();
}

class _DetailJobPageState extends State<DetailJobPage> {
  bool isApllied = false;

  @override
  Widget build(BuildContext context) {
    //!Widget

    Widget header() {
      return Center(
        child: Column(
          children: [
            isApllied
                ? Container(
                    padding: EdgeInsets.fromLTRB(24, 9, 24, 9),
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(49),
                      color: applyMessageClr,
                    ),
                    child: Flexible(
                        child: Text(
                      'You have applied this job and the recruiter will contact you',
                      style: txRegular.copyWith(
                        fontSize: 14,
                        color: applyMessageTxClr,
                      ),
                      textAlign: TextAlign.center,
                    )),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.network(
                widget.jobModel.companyLogo,
                height: 60,
                width: 60,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.jobModel.name,
              style: txSemiBold.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 2,
            ),
            Text('${widget.jobModel.companyName} • ${widget.jobModel.location}',
                style: txRegular.copyWith(
                  fontSize: 14,
                  color: grayColor,
                )),
          ],
        ),
      );
    }

    Widget dotDetailItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Icon(
              Icons.adjust,
              color: purpleColor,
              size: 12,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              text,
              style: txLight.copyWith(
                fontSize: 14,
              ),
            ),
          )
        ]),
      );
    }

    Widget aboutJob() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About the Job',
              style: txMedium.copyWith(fontSize: 14, color: blackColor),
            ),
            Column(
                children: widget.jobModel.about
                    .map((item) => dotDetailItem(item))
                    .toList())
          ],
        ),
      );
    }

    Widget qualifications() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Qualifications',
              style: txMedium.copyWith(fontSize: 14, color: blackColor),
            ),
            Column(
                children: widget.jobModel.qualifications
                    .map((item) => dotDetailItem(item))
                    .toList())
          ],
        ),
      );
    }

    Widget responsibilities() {
      return Container(
        margin: EdgeInsets.only(top: 30, bottom: 51),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsibilities',
              style: txMedium.copyWith(fontSize: 14, color: blackColor),
            ),
            Column(
              children: widget.jobModel.responsibilities
                  .map((item) => dotDetailItem(item))
                  .toList(),
            )
          ],
        ),
      );
    }

    Widget applyButton() {
      return Container(
        height: 45,
        width: MediaQuery.of(context).size.width - (2 * 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: purpleColor,
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              isApllied = !isApllied;
            });
          },
          child: Text(
            'Apply for Job',
            style: txMedium.copyWith(
              fontSize: 14,
              color: whiteColor,
            ),
          ),
        ),
      );
    }

    Widget cencelButton() {
      return Container(
        height: 45,
        width: MediaQuery.of(context).size.width - (2 * 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: redColor,
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              isApllied = !isApllied;
            });
          },
          child: Text(
            'Cencel Apply',
            style: txMedium.copyWith(
              fontSize: 14,
              color: whiteColor,
            ),
          ),
        ),
      );
    }

    Widget messageBtn() {
      return Container(
        margin: EdgeInsets.only(top: 20, bottom: 35),
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Massage Recruiter',
            style: txLight.copyWith(
              fontSize: 14,
              color: grayColor,
            ),
          ),
        ),
      );
    }

    //! Scaffold MAIN BODY
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  header(),
                  aboutJob(),
                  qualifications(),
                  responsibilities(),
                  isApllied ? cencelButton() : applyButton(),
                  messageBtn(),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
