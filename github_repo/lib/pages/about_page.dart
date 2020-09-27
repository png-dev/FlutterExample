import 'dart:io';

import 'package:flutter/material.dart';
import 'package:github_repo/generated/i18n.dart';
import 'package:github_repo/pages/profile_page.dart';
import 'package:github_repo/routes/profile_page_args.dart';
import 'package:github_repo/utils/util.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  static const ROUTE_NAME = '/about_page';

  @override
  State<StatefulWidget> createState() {
    return new _AboutPageState();
  }
}

class _AboutPageState extends State<AboutPage> {
  PackageInfo _packageInfo;

  void _refreshPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Language.current.about),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset('images/ic_launcher.png'),
                  ),
                  backgroundColor: Color(0X00ffffff),
                ),
                title: Text(
                  _packageInfo?.appName ?? '',
                  style: TextStyle(fontSize: 22),
                ),
                subtitle: Text(Language.current.copyright ?? ''),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(Language.current.version),
                subtitle: Text(_packageInfo?.version ?? ''),
              ),
              ListTile(
                leading: Icon(Icons.code),
                title: Text(Language.current.sourceCode),
                subtitle: Text(Language.current.starToSupportMe),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Navigator.pushNamed(context, )
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
                child: Text(
                  Language.current.author,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(Language.current.authorName ?? ''),
                subtitle: Text(Language.current.authorLocation),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, ProfilePage.ROUTE_NAME,
                      arguments: ProfilePageArgs(
                          login: Language.current.authorGithubLogin,
                          heroTag: 'png-dev'));
                },
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(Language.current.email),
                subtitle: Text(Language.current.authorEmail),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  launch('mailto:${Language.current.authorEmail}');
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text(
                  Language.current.share,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text(Language.current.shareToYourFriends),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Share.share(Language.current.shareText,
                      subject: _packageInfo?.appName);
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text(Language.current.rateOrCommentInMarket),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  if (Platform.isAndroid) {
                    LaunchReview.launch();
                  } else {
                    Util.showToast(
                        Language.current.notYetPublishedToTheAppStore);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
