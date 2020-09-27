import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:github_repo/generated/i18n.dart';
import 'package:github_repo/provide/locale_provide.dart';
import 'package:github_repo/provide/theme_provide.dart';
import 'package:github_repo/utils/sp_util.dart';
import 'package:github_repo/utils/string_util.dart';
import 'package:provide/provide.dart';

class SettingsPage extends StatefulWidget {
  static const ROUTE_NAME = '/settings';

  @override
  State<StatefulWidget> createState() {
    return new _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  static final Border _currentThemeBorder =
      Border.all(width: 2.0, color: Color(0x66000000));
  String selectedLanguage = '';

  @override
  void initState() {
    super.initState();
    selectedLanguage = SPUtils.getLanguage() ?? '';
  }

  void _changeLanguage(String languageCode) {
    setState(() {
      selectedLanguage = languageCode;
      SPUtils.setLanguage(selectedLanguage);
      Locale locale = StringUtil.isNullOrEmpty(selectedLanguage)
          ? null
          : Locale(languageCode);
      Provide.value<LocaleProvide>(context).changeLocal(locale);
    });
  }

  String getLanguageUIString(String languageCode) {
    String uiString = Language.current.systemDefault;
    switch (languageCode.toLowerCase()) {
      case 'en':
        uiString = Language.current.english;
        break;
      case 'vi':
        uiString = Language.current.vietnam;
    }
    return uiString;
  }

  ExpansionTile _chooseTheme() {
    final List<Widget> themeChildren = [];

    for (int i = 0; i < Colors.primaries.length; i++) {
      themeChildren.add(InkWell(
        onTap: () {
          setState(() {
            Provide.value<ThemeProvide>(context).changeTheme(i);
            SystemChrome.setSystemUIOverlayStyle(
                Provide.value<ThemeProvide>(context).overlayStyle);
            FlutterStatusbarcolor.setStatusBarColor(Colors.primaries[i][700]);
            SPUtils.setThemeIndex(i);
          });
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.primaries[i],
              border: Provide.value<ThemeProvide>(context).themeIndex == i
                  ? _currentThemeBorder
                  : null),
        ),
      ));
    }

    return ExpansionTile(
      leading: Icon(Icons.palette),
      title: Text(
        Language.current.chooseTheme,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      children: <Widget>[
        Wrap(
          children: themeChildren,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Language.current.settings),
      ),
      body: ListView(
        children: <Widget>[
          _chooseTheme(),
          ListTile(
            leading: const Icon(Icons.language),
            trailing: const Icon(Icons.keyboard_arrow_right),
            title: Text(
              Language.current.language,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            subtitle: Text(getLanguageUIString(selectedLanguage)),
            onTap: () {
              showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(Language.current.language),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          RadioListTile(
                            title: Text(getLanguageUIString('')),
                            value: '',
                            groupValue: selectedLanguage,
                            onChanged: (String languageCode) {
                              _changeLanguage(languageCode);
                              Navigator.pop(context);
                            },
                          ),
                          RadioListTile(
                            title: Text(getLanguageUIString(Language
                                .delegate.supportedLocales[0].languageCode)),
                            value: Language
                                .delegate.supportedLocales[0].languageCode,
                            groupValue: selectedLanguage,
                            onChanged: (String languageCode) {
                              _changeLanguage(languageCode);
                              Navigator.pop(context);
                            },
                          ),
                          RadioListTile(
                            title: Text(getLanguageUIString(Language
                                .delegate.supportedLocales[1].languageCode)),
                            value: Language
                                .delegate.supportedLocales[1].languageCode,
                            groupValue: selectedLanguage,
                            onChanged: (String languageCode) {
                              _changeLanguage(languageCode);
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
