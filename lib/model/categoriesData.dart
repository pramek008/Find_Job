// ignore_for_file: file_names, unused_import

import 'dart:convert';

class CategoryModel {
  String id;
  String name;
  String imgUrl;
  int createdAt;
  int updatedAt;

  CategoryModel({
    this.id,
    this.name,
    this.imgUrl,
    this.createdAt,
    this.updatedAt,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imgUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imgUrl,
      'createdAt': createdAt,
      'updatedAt': createdAt,
    };
  }
}
