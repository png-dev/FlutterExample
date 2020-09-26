import 'package:flutter/material.dart';
import 'package:github_repo/pages/login_page.dart';
import 'package:github_repo/pages/splash_page.dart';

class AppRoute extends NavigatorObserver {
  AppRoute._internal();

  static final AppRoute _appRoute = AppRoute._internal();

  factory AppRoute() => _appRoute;

  static final Map<String, WidgetBuilder> _routes = {
    SplashPage.ROUTE_NAME: (_) => SplashPage(),
    LoginPage.ROUTE_NAME: (_) => LoginPage(),
  };

  Map<String, WidgetBuilder> get routes => _routes;
  
  Route<dynamic> generateRoute(RouteSettings settings){
    MaterialPageRoute targetPage;
  }
}

AppRoute appRoute = AppRoute();
