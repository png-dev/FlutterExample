import 'dart:convert';

import 'package:github_repo/network/entity/user_entity.dart';

import 'app_shared_preferences.dart';

class SPUtils {
  static String searchHistory = 'searchHistory';
  static String username = 'username';
  static String githubAuthorizationBasic = 'githubAuthorizationBasic';
  static String githubAuthorizationToken = 'githubAuthorizationToken';
  static String themeIndex = 'themeIndex';
  static String language = 'language';
  static String userEntity = 'userEntity';

  static List<String> getSearchHistory() =>
      appSharedPreferences.getStringList(searchHistory);

  static Future<bool> setSearchHistory(List<String> value) =>
      appSharedPreferences.setStringList(searchHistory, value);

  static Future<bool> removeSearchHistory() =>
      appSharedPreferences.remove(searchHistory);

  static String getUserName() => appSharedPreferences.getString(username);

  static Future<bool> setUsername(String value) =>
      appSharedPreferences.setString(username, value);

  static String getGithubAuthorizationBasic() =>
      appSharedPreferences.getString(githubAuthorizationBasic);

  static Future<bool> setGithubAuthorizationBasic(String value) =>
      appSharedPreferences.setString(githubAuthorizationBasic, value);

  static String getGithubAuthorizationToken() =>
      appSharedPreferences.get(githubAuthorizationToken);

  static Future<bool> setGithubAuthorizationToken(String value) =>
      appSharedPreferences.setString(githubAuthorizationToken, value);

  static int getThemeIndex() => appSharedPreferences.getInt(themeIndex);

  static Future<bool> setThemeIndex(int value) =>
      appSharedPreferences.setInt(themeIndex, value);

  static String getLanguage() => appSharedPreferences.getString(language);

  static Future<bool> setLanguage(String value) =>
      appSharedPreferences.setString(language, value);

  static UserEntity getUserEntity() {
    String json = appSharedPreferences.getString(userEntity);
    if (json != null && json.isNotEmpty) {
      dynamic entity = jsonDecode(json);
      UserEntity userEntity = UserEntity.fromJson(entity);
      return userEntity;
    } else {
      return null;
    }
  }

  static Future<bool> setUserEntity(UserEntity entity) {
    return appSharedPreferences.setString(userEntity, jsonEncode(entity));
  }

  static void logout() {
    appSharedPreferences.remove(username);
    appSharedPreferences.remove(githubAuthorizationBasic);
    appSharedPreferences.remove(githubAuthorizationToken);
    appSharedPreferences.remove(userEntity);
  }
}
