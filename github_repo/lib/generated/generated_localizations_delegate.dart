import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'i18n.dart';

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<Language> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale('en', ""), Locale("vi", "VN")];
  }

  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        if (true != withCountry &&
            (supportedLocale.countryCode == null ||
                supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }

  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported,
      bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  LocaleListResolutionCallback listResolution(
      {Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      }
      return _resolve(locales.first, fallback, supported, withCountry);
    };
  }

  LocaleResolutionCallback resolution(
      {Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  bool isSupported(Locale locale) {
    return _isSupported(locale, true);
  }

  @override
  Future<Language> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case 'en':
          Language.current = const $en();
          return SynchronousFuture<Language>(Language.current);
        case 'vi_VN':
          Language.current = const $vi_VN();
          return SynchronousFuture<Language>(Language.current);
        default:
        //
      }
    }

    Language.current = const Language();
    return SynchronousFuture<Language>(Language.current);
  }

  @override
  bool shouldReload(LocalizationsDelegate<Language> old) {
    return false;
  }
}

String getLang(Locale locale) {
  if (locale == null) {
    return null;
  } else if (locale.countryCode != null && locale.countryCode.isEmpty) {
    return locale.languageCode;
  }
  return locale.toString();
}
