import 'package:flutter/widgets.dart';

class LocaleProvide with ChangeNotifier {
  Locale _locale;

  Locale get local => _locale;

  changeLocal(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
