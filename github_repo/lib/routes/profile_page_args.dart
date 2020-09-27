import 'package:github_repo/network/entity/user_entity.dart';
import 'package:github_repo/utils/string_util.dart';

class ProfilePageArgs {
  final UserEntity userEntity;
  final String login;
  final String heroTag;

  ProfilePageArgs({this.userEntity, this.login, this.heroTag})
      : assert(userEntity != null || StringUtil.isNotBlank(login));
}
