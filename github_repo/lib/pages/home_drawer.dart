import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_repo/biz/user_biz.dart';
import 'package:github_repo/generated/i18n.dart';
import 'package:github_repo/pages/about_page.dart';
import 'package:github_repo/pages/login_page.dart';
import 'package:github_repo/pages/settings_page.dart';
import 'package:github_repo/provide/user_provide.dart';
import 'package:github_repo/utils/sp_util.dart';
import 'package:github_repo/utils/util.dart';
import 'package:provide/provide.dart';

class HomeDrawer extends StatefulWidget {
  static const MENU_MY_REPOS = 'MY_REPOS';
  static const MENU_STARRED_REPOS = 'STARRED_REPOS';
  static const MENU_TRENDING_UP = 'TRENDING_UP';
  final Function(String) callback;
  final String lasClickedMenu;

  HomeDrawer(this.callback, this.lasClickedMenu, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _HomeDrawerState();
  }
}

class _HomeDrawerState extends State<HomeDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController _refreshController;
  String _clickMenu;

  @override
  void initState() {
    super.initState();

    this._clickMenu = widget.lasClickedMenu;
    _refreshController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
  }

  void refreshUserData() {
    _refreshController.repeat();
    UserBiz.getUser(forceRefresh: true).then((userEntity) {
      if (userEntity != null) {
        Provide.value<UserProvide>(context).updateUser(userEntity);
        Util.showToast(Language.current.userDataHasBeenRefreshed);
      } else {
        Util.showToast(Language.current.refreshFailedCheckNetwork);
      }
      _refreshController.stop(canceled: true);
    }).catchError((e) {
      Util.showToast((e as DioError).message);
      _refreshController.stop(canceled: true);
    }, test: (e) => e is DioError).catchError((e) {
      Util.showToast(e.toString());
      _refreshController.stop(canceled: true);
    });
  }

  void onClickMenu(String menu) {
    if (menu != _clickMenu) {
      _clickMenu = menu;
      widget.callback(menu);
    }
    Navigator.of(context).pop();
  }

  Widget _drawerHeader() {
    return Provide<UserProvide>(
      builder: (context, child, userProvide) {
        String heroTag = userProvide.user.login;
        return UserAccountsDrawerHeader(
          currentAccountPicture: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Hero(
              transitionOnUserGestures: true,
              tag: heroTag,
              child: CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider(userProvide.user.avatarUrl),
              ),
            ),
          ),
          accountName: Text('${userProvide.user.login}'),
          accountEmail: Text('${userProvide.user.email ?? ''}'),
          otherAccountsPictures: <Widget>[
            RotationTransition(
              turns: _refreshController,
              child: IconButton(
                icon: Icon(Icons.refresh, color: Colors.white),
                onPressed: () {
                  refreshUserData();
                },
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _drawerHeader(),
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text(Language.current.issues),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.of(context).pushNamed()
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.storage),
                      title: Text(Language.current.myRepos),
                      onTap: () {
                        onClickMenu(HomeDrawer.MENU_MY_REPOS);
                      },
                      selected: _clickMenu == null ||
                          _clickMenu == HomeDrawer.MENU_MY_REPOS,
                    ),
                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text(Language.current.starredRepos),
                      onTap: () {
                        onClickMenu(HomeDrawer.MENU_STARRED_REPOS);
                      },
                      selected: _clickMenu == HomeDrawer.MENU_STARRED_REPOS,
                    ),
                    ListTile(
                      leading: Icon(Icons.trending_up),
                      title: Text(Language.current.trending),
                      onTap: () {
                        onClickMenu(HomeDrawer.MENU_TRENDING_UP);
                      },
                      selected: _clickMenu == HomeDrawer.MENU_TRENDING_UP,
                    ),
                    ListTile(
                      leading: Icon(Icons.search),
                      title: Text(Language.current.search),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Divider(
                      height: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text(Language.current.settings),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushNamed(SettingsPage.ROUTE_NAME);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text(Language.current.about),
                      onTap: () {
                        Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text(Language.current.logout),
                      onTap: () {
                        SPUtils.logout();
                        Navigator.of(context)
                            .pushReplacementNamed(LoginPage.ROUTE_NAME);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
