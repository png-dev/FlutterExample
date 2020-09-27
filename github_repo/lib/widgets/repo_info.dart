import 'package:flutter/material.dart';
import 'package:github_repo/generated/i18n.dart';
import 'package:github_repo/network/entity/repo_entity.dart';
import 'package:github_repo/pages/repo_home_page.dart';
import 'package:github_repo/resources/lang_colors.dart';
import 'package:github_repo/utils/util.dart';

class RepoInfo extends StatefulWidget {
  final RepoEntity repo;

  RepoInfo(this.repo, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _RepoInfoState();
  }
}

class _RepoInfoState extends State<RepoInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SelectableText(
                      '${widget.repo.fullName}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (widget.repo.fork)
                      Container(
                        padding: EdgeInsets.only(top: 12),
                        child: InkWell(
                          child: Text(
                            Language.current.forkedToViewTheParentRepository,
                            style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, RepoHomePage.ROUTE_NAME,
                                arguments: widget.repo.parent.fullName);
                          },
                        ),
                      ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          widget.repo.owner.isUser
                              ? Icons.account_circle
                              : Icons.group,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: SelectableText(
                            '${widget.repo.owner.login}${widget.repo.owner.isUser ? '' : '(${Language.current.orgUppercase})'}',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // RepoInfoCountData(widget.repo),
                    Offstage(
                      offstage: widget.repo.language == null,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                color: langColors
                                    .getColor('${widget.repo.language}'),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${widget.repo.language}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${Language.current.createdAt(Util.getFriendlyDateTime(widget.repo.createdAt))}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${Language.current.pushedAt(Util.getFriendlyDateTime(widget.repo.pushedAt))}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Offstage(
                      offstage: widget.repo.license == null,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '${Language.current.license}: ${widget.repo.license?.name}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   WebViewPage.ROUTE_NAME,
                        //   arguments: WebViewPageArgs(
                        //       url:
                        //           'https://github.com/${widget.repo.fullName}/blob/${widget.repo.defaultBranch}/README.md'),
                        // );
                      },
                      child: Text(
                        'README',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 22,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 1.5,
                        ),
                      ),
                    ),
                    Offstage(
                      offstage: widget.repo.description == null ||
                          widget.repo.description.isEmpty,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: SelectableText(
                          '${widget.repo.description}',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
