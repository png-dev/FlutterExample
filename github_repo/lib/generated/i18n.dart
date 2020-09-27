import 'package:flutter/material.dart';

import 'generated_localizations_delegate.dart';

class Language implements WidgetsLocalizations {
  const Language();

  static Language current;

  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();

  static Language of(BuildContext context) =>
      Localizations.of(context, Language);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get about => "About";

  String get activityUppercase => "Activity";

  String get adjustTimeSpan => "Adjust time span";

  String get all => "All";

  String get appRepoFullname => "Github";

  String get appTitle => "GITHUB - REPO";

  String get author => "Author";

  String get authorEmail => "dev.vn.png@gmail.com";

  String get authorGithubLogin => "png-vn";

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

  String get vietnam => "Vietnamese";

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

  String get searchSortForks => "Forks";

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

class $en extends Language {
  const $en();
}

class $vi_VN extends Language {
  const $vi_VN();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get trending => "Xu hướng";

  @override
  String get copyright => "Copyright @ 2020 PNG-VN";

  @override
  String get activityUppercase => "HOẠT ĐỘNG";

  @override
  String get about => "About";

  @override
  String get commit => "Commit";

  @override
  String get refreshFailedCheckNetwork =>
      "Refresh thất bại, vui lòng kiểm tra kết nối mạng.";

  @override
  String get infoUppercase => "THÔNG TIN";

  @override
  String get type => "Loại";

  @override
  String get issues => "Vấn đề";

  @override
  String get selectALanguage => "Chọn tất cả ngôn ngữ";

  @override
  String get systemDefault => "Mặc định hệ thống";

  @override
  String get filesUppercase => "FILE";

  @override
  String get sourceCode => "Mã nguồn";

  @override
  String get logout => "Đăng xuất";

  @override
  String get commitsUppercase => "COMMIT";

  @override
  String get clearLanguage => "Xóa ngôn ngữ";

  @override
  String get english => "Tiếng anh";

  @override
  String get vietnam => "Tiếng Việt";

  @override
  String get shareText => "https://github.com";

  @override
  String get thisMonth => "Tháng này";

  @override
  String get state => "Trạng thái";

  @override
  String get forkedToViewTheParentRepository =>
      "Forked, để xem kho mã nguồn gốc";

  @override
  String get forks => "Forks";

  @override
  String get profile => "Hồ sơ";

  @override
  String get userDataHasBeenRefreshed =>
      "Dữ liệu người dùng đang được làm mới.";

  @override
  String get loginAccountHint => "Tên người dùng hoặc email Github";

  @override
  String get searchSortUpdated => "Đã cập nhật";

  @override
  String get version => "Phiên bản";

  @override
  String get starToSupportMe => "Star để ủng hộ tôi";

  @override
  String get adjustTimeSpan => "Điều chỉnh khoảng thời gian";

  @override
  String get authorName => "PNG-VN";

  @override
  String get following => "Following";

  @override
  String get notifications => "Thông báo";

  @override
  String get watchers => "Người xem";

  @override
  String get skip => "skip";

  @override
  String get appTitle => "GITHUB - REPO";

  @override
  String get login => "Đăng nhập";

  @override
  String get search => "Tìm kiếm";

  @override
  String get thisFieldCanNotBeEmpty => "Trường này không thể để trống";

  @override
  String get member => "Thành viên";

  @override
  String get searchSortForks => "Forks";

  @override
  String get searchSortFollowers => "Người theo dõi";

  @override
  String get share => "Chia sẽ";

  @override
  String get notYetPublishedToTheAppStore => "Chưa được xuất bản lên App Store";

  @override
  String get email => "Email";

  @override
  String get orgUppercase => "ORG";

  @override
  String get committed => "Committed";

  @override
  String get stargazers => "Stargazers";

  @override
  String get watch => "Watch";

  @override
  String get copyRepoUrl => "Sao chep repo url";

  @override
  String get closed => "Closed";

  @override
  String get searchHistory => "Lịch sử tìm kiếm";

  @override
  String get open => "Mở";

  @override
  String get unwatch => "Unwatch";

  @override
  String get noMoreData => "Không có thêm dữ liệu";

  @override
  String get thisWeek => "Tuần này";

  @override
  String get filterLanguages => "Lọc ngôn ngữ";

  @override
  String get language => "Ngôn ngữ";

  @override
  String get loadingMoreData => "Tải thêm dữ liệu...";

  @override
  String get searchSortRepositories => "Kho lưu trữ";

  @override
  String get empty => "Trống";

  @override
  String get bestMatch => "Best Match";

  @override
  String get committer => "Committer";

  @override
  String get repositories => "Kho lưu trữ";

  @override
  String get appRepoFullName => "Github";

  @override
  String get all => "Tất cả";

  @override
  String get settings => "Cài đặt";

  @override
  String get created => "Đã tạo";

  @override
  String get author => "Tác giả";

  @override
  String get tapToRetry => "Chạm để thử lại";

  @override
  String get sort => "Sắp xếp";

  @override
  String get rateOrCommentInMarket => "Đánh giá hoặc bình luận trên Market";

  @override
  String get starredRepos => "Repo có gắn star";

  @override
  String get shareToYourFriends => "Chia sẽ với bạn bè của bạn";

  @override
  String get users => "Người dùng";

  @override
  String get authorLocation => "Ha Noi - Viet Nam";

  @override
  String get license => "Giấy phép";

  @override
  String get watched => "Đã xem";

  @override
  String get starredUppercase => "STARRED";

  @override
  String get followers => "Người theo dõi";

  @override
  String get searchSortStars => "Star";

  @override
  String get queryCanNotBeEmpty => "Truy vấn không thể trống!";

  @override
  String get updated => "Cập nhật";

  @override
  String get myRepos => "My Repos";

  @override
  String get authorEmail => "dev.vn.png@gmail.com";

  @override
  String get private => "Riêng tư";

  @override
  String get loginPasswordHint => "Mật khẩu";

  @override
  String get oopsWrong => "Rất tiếc!";

  @override
  String get unwatched => "Chưa từng thấy";

  @override
  String get public => "Công đồng";

  @override
  String get openInBrowser => "Mở trong trình duyệt";

  @override
  String get today => "Hôm nay ";

  @override
  String get chooseTheme => "Chọn chủ đề";

  @override
  String get news => "Tin tức";

  @override
  String get owner => "Chủ nhân";

  @override
  String get authorGithubLogin => "png-vn";

  @override
  String get fullName => "Tên đầy đủ";

  @override
  String get searchSortJoined => "Mới tham gia";

  @override
  String get pushed => "Pushed";

  @override
  String createdAt(String dateTime) => "Đã tạo: ${dateTime}";

  @override
  String updatedAt(String dateTime) => "Đã cập nhật: ${dateTime}";

  @override
  String pushedAt(String dateTime) => "Đã push:  ${dateTime}";

  String googlePlayAppUrl(String packageName) => "https://play.google.com";
}
