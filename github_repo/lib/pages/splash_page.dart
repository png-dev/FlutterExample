import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:github_repo/biz/user_biz.dart';
import 'package:github_repo/generated/i18n.dart';
import 'package:github_repo/network/entity/user_entity.dart';
import 'package:github_repo/pages/home_page.dart';
import 'package:github_repo/pages/login_page.dart';
import 'package:github_repo/provide/theme_provide.dart';
import 'package:github_repo/provide/user_provide.dart';
import 'package:provide/provide.dart';

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

  Future hasLogin() async {
    UserEntity userEntity = await UserBiz.getUser();
    if (userEntity != null) {
      Provide.value<UserProvide>(context).updateUser(userEntity);
      Navigator.of(context).pushReplacementNamed(HomePage.ROUTE_NAME);
    } else {
      Navigator.of(context).pushReplacementNamed(LoginPage.ROUTE_NAME);
    }
  }

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: ANIMATION_SECONDS + 1), () {
      hasLogin();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          isShown = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        Provide.value<ThemeProvide>(context).overlayStyle);
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColorDark);
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Center(
              child: AnimatedDefaultTextStyle(
                child: Text(Language.current.appTitle),
                style: isShown
                    ? TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).primaryColorDark)
                    : TextStyle(
                        fontSize: 36,
                        fontFamily: 'AGENCYR',
                        fontWeight: FontWeight.w200,
                        color: Colors.blue),
                duration: const Duration(seconds: ANIMATION_SECONDS),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: FlatButton(
                child: Text(
                  Language.current.skip,
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w800),
                ),
                onPressed: () {
                  hasLogin();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
