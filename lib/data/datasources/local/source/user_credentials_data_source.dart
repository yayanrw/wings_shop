import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/data/datasources/local/daos/user_credentials_dao.dart';

abstract class UserCredentialsDataSource {
  Future<UserCredentialsDao> getUserCredentials();

  Future<bool> setUserCredentials(UserCredentialsDao userCredentialsDao);

  Future<bool> clearUserCredentials();
}

@LazySingleton(as: UserCredentialsDataSource)
class UserCredentialsDataSourceImpl implements UserCredentialsDataSource {
  final sharedPref = SharedPreferences.getInstance();

  @override
  Future<bool> clearUserCredentials() async {
    final prefs = await sharedPref;
    return prefs.clear();
  }

  @override
  Future<UserCredentialsDao> getUserCredentials() async {
    final prefs = await sharedPref;
    final userCredentials = prefs.getString(userCredentialsKey);
    if (userCredentials == null) {
      return UserCredentialsDao();
    } else {
      return UserCredentialsDao.fromJson(
        jsonDecode(userCredentials),
      );
    }
  }

  @override
  Future<bool> setUserCredentials(UserCredentialsDao userCredentialsDao) async {
    final prefs = await sharedPref;
    final jsonString = jsonEncode(userCredentialsDao);

    prefs.setString(userCredentialsKey, jsonString);
    return true;
  }
}
