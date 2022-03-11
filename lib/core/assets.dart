import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;

class AssetsPath {
  static const _assetsPath = "assets/";
  static const _jsonFolderPath = _assetsPath + "json/";
  static const _imageFolderPath = _assetsPath + "images/";
  static const userProfilesJson = _jsonFolderPath + "user_profile.json";
  static const loginBackgroundImage = _imageFolderPath + "login_background.png";
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
