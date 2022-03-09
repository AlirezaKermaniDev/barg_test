import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;

class AssetsPath {
  static const _assetsPath = "assets/";
  static const _folderPath = "json/";
  static const userProfilesJson =
      _assetsPath + _folderPath + "user_profile.json";
}

Future<Map<String, dynamic>> parseJsonObjectFromAssets(
    String assetsPath) async {
  // Parse json from: $assetsPath'
  String rawJson = await rootBundle.loadString(assetsPath);
  final data = json.decode(rawJson);
  return data;
}

Future<List<dynamic>> parseJsonListFromAssets(String assetsPath) async {
  // Parse json from: $assetsPath'
  String rawJson = await rootBundle.loadString(assetsPath);
  final data = json.decode(rawJson);
  return data;
}
