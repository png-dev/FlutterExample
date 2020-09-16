import 'package:flutter/widgets.dart';
import 'package:github_repo/network/entity/user_entity.dart';

class UserProvide with ChangeNotifier {
  UserEntity _userEntity;

  UserEntity get user => _userEntity;

  UserProvide();

  void updateUser(UserEntity entity) {
    this._userEntity = entity;
    notifyListeners();
  }
}
