import 'dart:convert';

import 'package:github_repo/network/entity/user_entity.dart';

class UserBiz {
  static String _getCredentialsBasic(String username, String password) {
    final bytes = latin1.encode('$username:$password');
    final encoded = base64Encode(bytes);
    return "Basic " + encoded;
  }

  static Future<UserEntity> login(username, password) async {
    String authBasic = _getCredentialsBasic(username, password);
  }
}
