// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:findjob/model/job_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JobProvider with ChangeNotifier {
  Future<List<JobModel>> getJob() async {
    try {
      var response = await http.get(
        Uri.parse('https://bwa-jobs.herokuapp.com/jobs'),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((job) {
          jobs.add(JobModel.fromJson(job));
        });

        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<JobModel>> getJobsByCategory(String category) async {
    try {
      var response = await http.get(
        Uri.parse('https://bwa-jobs.herokuapp.com/jobs?category=$category'),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((job) {
          jobs.add(JobModel.fromJson(job));
        });

        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  // Future<List<JobModel>> getJobsByName(String name) async {
  //   try {
  //     var response = await http.get(
  //       Uri.parse('https://bwa-jobs.herokuapp.com/jobs?category=$name'),
  //     );

  //     print(response.statusCode);
  //     print(response.body);

  //     if (response.statusCode == 200) {
  //       List<JobModel> jobs = [];
  //       List parsedJson = jsonDecode(response.body);

  //       parsedJson.forEach((job) {
  //         jobs.add(JobModel.fromJson(job));
  //       });

  //       return jobs;
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }
}
