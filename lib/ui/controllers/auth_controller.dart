import 'dart:convert';

import 'package:flutter_firebase/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static const String _userDataKey = 'user-data';

  static String? accessToken;
  static UserModel? userData;

  // save user data
  static Future<void> saveUserData(UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_userDataKey, jsonEncode(userModel));
    userData = userModel;
  }

  // get user data
  static Future<UserModel?> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? encodedUserModel = sharedPreferences.getString(_userDataKey);
    if (encodedUserModel == null) {
      return null;
    }
    UserModel userModel = UserModel.fromJson(jsonDecode(encodedUserModel));
    userData = userModel;
    return userModel;
  }

  // static Future<void> saveAccessToken(String token) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.setString(_accessTokenKey, token);
  //   accessToken = token;
  // }

  // static Future<void> saveUserData(UserModel userModel) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.setString(
  //     _userDataKey,
  //     jsonEncode(userModel.toString()),
  //   );
  //   userData = userModel;
  // }

  // static Future<String?> getAccessToken() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? token = sharedPreferences.getString(_accessTokenKey);
  //   accessToken = token;
  //   return token;
  // }

  // static Future<UserModel?> getUserData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? encodedUserModel = sharedPreferences.getString(_userDataKey);

  //   if (encodedUserModel == null) {
  //     return null;
  //   }

  //   UserModel userModel = UserModel.fromJson(jsonDecode(encodedUserModel));
  //   userData = userModel;
  //   return userModel;
  // }

  // static bool isLoggedIn() => accessToken != null;

  // static Future<void> clearUserData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.clear();
  //   accessToken = null;
  // }
}
