import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_repo/utils/app_shared_preferences.dart';
import 'package:github_repo/utils/string_util.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

void main() {}

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
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {}
}
