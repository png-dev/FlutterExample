import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_repo/generated/i18n.dart';
import 'package:github_repo/network/api_service.dart';
import 'package:github_repo/network/entity/user_entity.dart';
import 'package:github_repo/routes/profile_page_args.dart';
import 'package:github_repo/utils/util.dart';
import 'package:github_repo/widgets/loading_state.dart';
import 'package:github_repo/widgets/profile_info_count_data.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  static const ROUTE_NAME = '/profile';
  final ProfilePageArgs args;

  ProfilePage(this.args, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  UserEntity _userEntity;
  StateFlag _loadingState = StateFlag.idle;
  final String _profileStarredHeroTag =
      'profile_starred_repos ${DateTime.now().millisecondsSinceEpoch.toString()}';
  String _login;
  String _avatarHeroTag;

  List<String> _getTabTitles() {
    List<String> titles = [
      Language.current.infoUppercase,
      Language.current.activityUppercase
    ];
    if (this._userEntity != null && this._userEntity.isUser) {
      titles.add(Language.current.starredUppercase);
    }
    return titles;
  }

  Widget _getInfoTabBarView() {
    if (_userEntity == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      DateTime createAt = DateTime.parse(_userEntity.createdAt).toLocal();
      DateTime updateAt = DateTime.parse(_userEntity.updatedAt).toLocal();
      DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Offstage(
                offstage: this._userEntity.login == null,
                child: Wrap(
                  children: <Widget>[
                    Icon(this._userEntity.isUser
                        ? Icons.account_circle
                        : Icons.group),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      this._userEntity.login ?? '',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                Language.current.createdAt(dateFormat.format(createAt)),
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                Language.current.updatedAt(dateFormat.format(updateAt)),
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              Offstage(
                offstage: this._userEntity.email == null,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.email,
                          color: Theme.of(context).primaryColorDark),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          this._userEntity.email ?? '',
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Offstage(
                offstage: this._userEntity.blog == null ||
                    this._userEntity.blog.isEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.link,
                          color: Theme.of(context).primaryColorDark),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          this._userEntity.blog ?? '',
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ProfileInfoCountData(this._userEntity),
              SizedBox(
                height: 16,
              ),
              Text(
                _userEntity.bio == null ? '' : '${_userEntity.bio}',
                maxLines: 5,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }
  }

  List<Widget> _getTabViews() {
    List<Widget> widgets = [];
  }

  Future<void> _loadData() async {
    if (_loadingState == StateFlag.loading) {
      return Future;
    }
    _loadingState = StateFlag.loading;
    if (mounted) {
      setState(() {});
    }
    return ApiService.getUser(this._login).then((user) {
      _tabController = TabController(length: user.isUser ? 3 : 2, vsync: this);
      if (mounted) {
        setState(() {
          _loadingState = StateFlag.complete;
          this._userEntity = user;
        });
      }
    }).catchError((e) {
      if (mounted) {
        setState(() {
          _loadingState = StateFlag.error;
        });
      }
      Util.showToast(e is DioError ? e.message : e.toString());
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {}
}
