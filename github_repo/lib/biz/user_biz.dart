import 'dart:convert';

import 'package:github_repo/network/api_service.dart';
import 'package:github_repo/network/entity/user_entity.dart';
import 'package:github_repo/utils/sp_util.dart';
import 'package:github_repo/utils/string_util.dart';

class UserBiz {
  static String _getCredentialsBasic(String username, String password) {
    final bytes = latin1.encode("$username:$password");
    final encoded = base64Encode(bytes);
    return "Basic " + encoded;
  }

  static Future<UserEntity> getUser({bool forceRefresh = false}) async {
    if (forceRefresh) {
      return ApiService.getAuthenticatedUser()
          .then<UserEntity>((userEntity) async {
        SPUtils.setUserEntity(userEntity);
        return userEntity;
      });
    } else {
      UserEntity _entity = SPUtils.getUserEntity();

      if (_entity != null) {
        return _entity;
      } else {
        String _basic = SPUtils.getGithubAuthorizationBasic();
        if (StringUtil.isNotEmpty(_basic)) {
          return ApiService.getAuthenticatedUser()
              .then<UserEntity>((userEntity) async {
            SPUtils.setUserEntity(userEntity);
            return userEntity;
          });
        } else {
          return null;
        }
      }
    }
  }

  static Future<UserEntity> login(username, password) async {
    String authBasic = _getCredentialsBasic(username, password);
    return ApiService.login(authBasic).then((authorizationEntity) async {
      SPUtils.setUsername(username);
      SPUtils.setGithubAuthorizationBasic(authBasic);
      SPUtils.setGithubAuthorizationToken('token ${authorizationEntity.token}');
    }).then<UserEntity>((_) => getUser(forceRefresh: true));
  }
}
