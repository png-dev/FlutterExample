import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github_repo/generated/i18n.dart';
import 'package:github_repo/pages/home_drawer.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = '/home';

  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  static final _defaultMenu = HomeDrawer.MENU_MY_REPOS;
  final String _heroTag = DateTime.now().millisecondsSinceEpoch.toString();
  String _clickedDrawerMenu = _defaultMenu;
  StreamController<String> _bodyController;

  @override
  void initState() {
    _bodyController = StreamController<String>.broadcast();
    super.initState();
  }

  void onClickDrawerMenu(String menuName) {
    setState(() {
      this._clickedDrawerMenu = menuName;
      _bodyController.add(this._clickedDrawerMenu);
    });
  }

  // static final _defaultMenu =
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(onClickDrawerMenu, _clickedDrawerMenu ?? _defaultMenu),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: StreamBuilder<String>(
                  stream: _bodyController.stream,
                  initialData: _defaultMenu,
                  builder: (context, snapshot) {
                    if (snapshot.data == HomeDrawer.MENU_STARRED_REPOS) {
                      return Text(Language.current.starredRepos);
                    } else if (snapshot.data == HomeDrawer.MENU_TRENDING_UP) {
                      return Text(Language.current.trending);
                    } else {
                      return Text(Language.current.myRepos);
                    }
                  },
                ),
                snap: true,
                floating: true,
                pinned: false,
              )
            ];
          },
          body: StreamBuilder<String>(
            stream: _bodyController.stream,
            initialData: _defaultMenu,
            builder: (context, snapshot) {
              if (snapshot.data == HomeDrawer.MENU_STARRED_REPOS) {
                return Container();
              } else if (snapshot.data == HomeDrawer.MENU_TRENDING_UP) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bodyController.close();
    super.dispose();
  }
}
