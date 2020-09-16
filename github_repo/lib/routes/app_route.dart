import 'package:flutter/material.dart';

class AppRoute extends NavigatorObserver {
  AppRoute._internal();

  static final AppRoute _appRoute = AppRoute._internal();

  factory AppRoute() => _appRoute;

  static final Map<String, WidgetBuilder> _routes = {};

  Map<String, WidgetBuilder> get routes => _routes;
}

AppRoute appRoute = AppRoute();
