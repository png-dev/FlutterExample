import 'package:flutter/material.dart';
import 'package:github_repo/generated/i18n.dart';
import 'package:github_repo/network/entity/user_entity.dart';

class ProfileInfoCountData extends StatelessWidget {
  final UserEntity _userEntity;

  ProfileInfoCountData(this._userEntity, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '${_userEntity.followers}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColorDark,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Language.current.followers,
                    style: TextStyle(
                        fontSize: 25, color: Theme.of(context).primaryColor),
                  )
                ],
              ),
            ),
            onTap: () {},
          ),
        ),
        Expanded(
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                children: <Widget>[
                  Text(
                    '${_userEntity.following}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Language.current.following,
                    style: TextStyle(
                        fontSize: 16, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '${_userEntity.publicRepos}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Language.current.repositories,
                    style: TextStyle(
                        fontSize: 16, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
