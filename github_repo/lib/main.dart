import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:github_repo/generated/i18n.dart';
import 'package:github_repo/pages/splash_page.dart';
import 'package:github_repo/provide/locale_provide.dart';
import 'package:github_repo/provide/theme_provide.dart';
import 'package:github_repo/provide/user_provide.dart';
import 'package:github_repo/routes/app_route.dart';
import 'package:github_repo/utils/sp_util.dart';
import 'package:github_repo/utils/string_util.dart';
import 'package:provide/provide.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_repo/utils/app_shared_preferences.dart';
import 'package:github_repo/network/dio_client.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

void main() {
  (dioClient.dio.transformer as DefaultTransformer).jsonDecodeCallback =
      parseJson;
  final providers = Providers()
    ..provide(Provider.value(UserProvide()))
    ..provide(Provider.value(LocaleProvide()))
    ..provide(Provider.value(ThemeProvide()));

  runApp(ProviderNode(
    providers: providers,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool _isInitialed = false;

  Future<void> _initSharedPreferences() async {
    await appSharedPreferences.init();

    int themeIndex = SPUtils.getThemeIndex();
    if (themeIndex != null) {
      Provide.value<ThemeProvide>(context).changeTheme(themeIndex);
    }

    String language = SPUtils.getLanguage();
    if (StringUtil.isNotEmpty(language)) {
      Provide.value<LocaleProvide>(context).changeLocal(Locale(language));
    }

    setState(() {
      _isInitialed = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<LocaleProvide>(
      builder: (context, child, localeProvide) {
        return Provide<ThemeProvide>(
          builder: (context, child, themeProvide) {
            return MaterialApp(
              locale: localeProvide.local,
              routes: appRoute.routes,
              onGenerateRoute: appRoute.generateRoute,
              navigatorObservers: [appRoute],
              localizationsDelegates: const [
                Language.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: Language.delegate.supportedLocales,
              title: 'GITHUB',
              onGenerateTitle: (context) => Language.current.appTitle,
              theme: themeProvide.themeData,
              home: _isInitialed
                  ? SplashPage()
                  : Container(
                      color: Colors.white,
                      child: Center(
                        child: Image.asset(
                          'images/github-logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
