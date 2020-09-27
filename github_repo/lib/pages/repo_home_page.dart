import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_repo/delegate/sliver_appbar_delegate.dart';
import 'package:github_repo/events/app_event_bus.dart';
import 'package:github_repo/events/repo_home_event.dart';
import 'package:github_repo/generated/i18n.dart';
import 'package:github_repo/network/api_service.dart';
import 'package:github_repo/network/entity/repo_entity.dart';
import 'package:github_repo/utils/util.dart';
import 'package:github_repo/widgets/loading_state.dart';
import 'package:github_repo/widgets/repo_info.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoHomePage extends StatefulWidget {
  static const ROUTE_NAME = '/repo_home';
  final String repoFullName;

  RepoHomePage(this.repoFullName, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _RepoHomePageState();
  }
}

class _RepoHomePageState extends State<RepoHomePage>
    with TickerProviderStateMixin {
  TabController _tabController;
  int _tabIndex;
  RepoEntity _repoEntity;
  StateFlag _loadingState = StateFlag.idle;
  bool _isStarred;
  bool _isWatched;

  List<String> _getTabTitles() {
    return <String>[
      Language.current.infoUppercase,
      Language.current.filesUppercase,
      Language.current.commitsUppercase,
      Language.current.activityUppercase
    ];
  }

  Future<void> _loadData() async {
    if (_loadingState == StateFlag.loading) {
      return Future;
    }
    if (mounted) {
      setState(() {
        _loadingState = StateFlag.loading;
      });
    }

    ApiService.getStarredRepo(widget.repoFullName).then((isStarred) {
      setState(() {
        _isStarred = isStarred;
      });
    });

    ApiService.getSubscriptionsRepo(widget.repoFullName).then((isWatched) {
      setState(() {
        _isWatched = isWatched;
      });
    });

    return ApiService.getRepo(widget.repoFullName).then((entity) {
      _repoEntity = entity;
      if (mounted) {
        setState(() {
          _loadingState = StateFlag.complete;
        });
      }
    }).catchError((e) {
      this._loadingState = StateFlag.error;
      if (mounted) {
        setState(() {});
        Util.showToast(e is DioError ? e.message : e.toString());
      }
    }).whenComplete(() {
      return;
    });
  }

  void _onClickStar(bool isStar) {
    ApiService.startOrUnstarRepo(widget.repoFullName, isStar);
  }

  void _onClickWatch(bool isWatched) {
    ApiService.subscriptionsOrUnsubscriptionsRepo(
            widget.repoFullName, isWatched)
        .then((result) {
      if (result) {
        if (isWatched) {
          Util.showToast(Language.current.watched);
        } else {
          Util.showToast(Language.current.unwatched);
        }
      }
    });
  }

  List<Widget> _buildActions() {
    return _repoEntity == null
        ? null
        : <Widget>[
            if (_isStarred != null)
              IconButton(
                icon: Icon(
                  _isStarred ? Icons.star : Icons.star_border,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isStarred = !_isStarred;
                  });
                  _onClickStar(_isStarred);
                },
              ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<String>>[
                  if (_isWatched != null)
                    PopupMenuItem<String>(
                      child: Text(_isWatched
                          ? Language.current.unwatch
                          : Language.current.watch),
                      value: "watch",
                    ),
                  PopupMenuItem<String>(
                    child: Text(Language.current.share),
                    value: "share",
                  ),
                  PopupMenuItem<String>(
                    child: Text(Language.current.openInBrowser),
                    value: "browser",
                  ),
                  PopupMenuItem<String>(
                    child: Text(Language.current.copyRepoUrl),
                    value: "copy",
                  ),
                ];
              },
              onSelected: (String action) async {
                switch (action) {
                  case "share":
                    Share.share(_repoEntity.htmlUrl);
                    break;
                  case "browser":
                    if (await canLaunch(_repoEntity.htmlUrl)) {
                      await launch(_repoEntity.htmlUrl);
                    }
                    break;
                  case "copy":
                    ClipboardData data =
                        new ClipboardData(text: _repoEntity.htmlUrl);
                    Clipboard.setData(data);
                    Util.showToast(_repoEntity.htmlUrl);
                    break;
                  case "watch":
                    setState(() {
                      _isWatched = !_isWatched;
                    });
                    _onClickWatch(_isWatched);
                    break;
                }
              },
            ),
          ];
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _getTabTitles().length, vsync: this);
    _tabController.addListener(() {
      if (_tabIndex != _tabController.index) {
        _tabIndex = _tabController.index;
        eventBus.fire(RepoHomeTabChangeEvent(_tabIndex));
      }
    });
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxScrolled) => [
              SliverAppBar(
                title: Text(
                  widget.repoFullName.split('/')[1],
                  style: TextStyle(fontSize: 18),
                ),
                titleSpacing: 0,
                floating: true,
                snap: true,
                pinned: false,
                actions: _buildActions(),
              ),
              SliverPersistentHeader(
                pinned: false,
                delegate: SliverAppbarDelegate(
                  this._loadingState,
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: TabBar(
                      indicatorColor: Theme.of(context).primaryColorLight,
                      controller: _tabController,
                      tabs: _getTabTitles()
                          .map((title) => Tab(
                                child: Text(title),
                              ))
                          .toList(growable: false),
                    ),
                  ),
                ),
              ),
            ],
            body: Stack(
              children: <Widget>[
                Offstage(
                  offstage: this._loadingState != StateFlag.complete,
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      // _repoEntity != null ? RepoInfo(_repoEntity) : Container(),
                      // _repoEntity != null
                      //     ? FileExplorer(_repoEntity)
                      //     : Container(),
                      // _repoEntity != null
                      //     ? CommitList(_repoEntity)
                      //     : Container(),
                      // _repoEntity != null
                      //     ? EventList(
                      //         login: _repoEntity.owner.login,
                      //         repoName: _repoEntity.name,
                      //       )
                      //     : Container(),
                    ],
                  ),
                ),
                Offstage(
                  offstage: this._loadingState != StateFlag.loading,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                LoadingState(
                  _loadingState,
                  onRetry: () {
                    _loadData();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
