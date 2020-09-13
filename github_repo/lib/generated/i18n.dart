import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class Language implements WidgetsLocalizations {
  const Language();

  static Language current;

  static const GeneratedLocalizationsDelegate deletegate =
      GeneratedLocalizationsDelegate();

  static Language of(BuildContext context) =>
      Localizations.of(context, Language);

  @override
  // TODO: implement textDirection
  TextDirection get textDirection => TextDirection.ltr;

  String get about => "About";

  String get activityUppercase => "Activity";

  String get adjustTimeSpan => "Adjust time span";

  String get all => "All";

  String get appRepoFullname => "Github";

  String get appTitle => "PNG";

  String get author => "Author";

  String get authorEmail => "dev.vn.png@gmail.com";

  String get authorGithubLogin => "png-dev";

  String get authorLocation => "Ha Noi - Viet Nam";

  String get authorName => "PNG-VN";

  String get bestMatch => "Best Match";

  String get chooseTheme => "Choose Theme";

  String get clearLanguage => "Clear Language";

  String get closed => "Closed";

  String get commit => "Commit";

  String get commitsUppercase => "COMMITS";

  String get committed => "Committed";

  String get committer => "Committer";

  String get copyRepoUrl => "Copy Repo Url";

  String get copyright => "Copyright @ 2020 PNG-VN";

  String get created => "Created";

  String get email => "Email";

  String get empty => "Empty";

  String get english => "English";

  String get filesUppercase => "FILES";

  String get filterLanguages => "Filter Languages";

  String get followers => "Followers";

  String get following => "Following";

  String get forkedToViewTheParentRepository =>
      "Forked, to view the parent repository";

  String get forks => "Forks";

  String get fullName => "Full Name";

  String get infoUppercase => "INFO";

  String get issues => "Issues";

  String get language => "Language";

  String get license => "License";

  String get loadingMoreData => "Loading more data ...";

  String get login => "Login";

  String get loginAccountHint => "Github username or email";

  String get loginPasswordHint => "Password";

  String get logout => "Logout";

  String get member => "Member";

  String get myRepos => "My Repos";

  String get news => "News";

  String get noMoreData => "No more data";

  String get notYetPublishedToTheAppStore =>
      "Not yet published to the App Store.";

  String get notifications => "Notifications";

  String get oopsWrong => "Oops wrong";

  String get open => "Open";

  String get openInBrowser => "Open in browser";

  String get orgUppercase => "ORG";

  String get owner => "Owner";

  String get private => "Private";

  String get profile => "Profile";

  String get public => "Public";

  String get pushed => "Pushed";

  String get queryCanNotBeEmpty => "Query can not be empty";

  String get rateOrCommentInMarket => "Rate or comment in market";

  String get refreshFailedCheckNetwork =>
      "Refresh failed, please check your network connection.";

  String get repositories => "Repositories";

  String get search => "Search";

  String get searchHistory => "Search History";

  String get searchSortFollowers => "Followers";

  String get searchSortFoked => "Forks";

  String get searchSortJoined => "Recently joined";

  String get searchSortRepositories => "Repositories";

  String get searchSortStars => "Stars";

  String get searchSortUpdated => "Updated";

  String get selectALanguage => "Select A Language";

  String get settings => "Settings";

  String get share => "Share";

  String get shareText => "https://github.com";

  String get shareToYourFriends => "Share to your friends";

  String get skip => "Skip";

  String get sort => "Sort";

  String get sourceCode => "Source code";

  String get starToSupportMe => "Star to support me";

  String get stargazers => "Stargazers";

  String get starredRepos => "Starred repos";

  String get starredUppercase => "STARRED";

  String get state => "State";

  String get systemDefault => "System default";

  String get tapToRetry => "TAP TO RETRY";

  String get thisFieldCannotBeEmpty => "This field cannot be empty";

  String get thisMonth => "This Month";

  String get thisWeek => "This Week";

  String get today => "Today";

  String get trending => "Trending";

  String get type => "Type";

  String get unwatch => "Unwatch";

  String get unwatched => "Unwatched";

  String get updated => "Updated";

  String get userDataHasBeenRefreshed => "User data has been refreshed.";

  String get users => "Users";

  String get versions => "Versions";

  String get watch => "Watch";

  String get watched => "Watched";

  String get watchers => "Watchers";

  String createdAt(String datetime) => "Created at ${datetime}";

  String googlePlayAppUrl(String packageName) => "https://play.google.com";

  String pushedAt(String datetime) => "Pushed at ${datetime}";

  String updatedAt(String datetime) => "Updated at ${datetime}";
}
