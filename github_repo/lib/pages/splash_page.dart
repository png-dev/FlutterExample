import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github_repo/network/entity/user_entity.dart';

class SplashPage extends StatefulWidget {
  static const ROUTE_NAME = '/splash';

  @override
  State<StatefulWidget> createState() {
    return new _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  static const ANIMATION_SECONDS = 1;
  bool isShown = false;
  Timer timer;

  Future hasLogin() async {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
