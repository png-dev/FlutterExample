import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class CodehubClient {
  static const BASE_API = "http://trending.codehub-app.com/v2";
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: BASE_API,
    connectTimeout: 30000,
    receiveTimeout: 20000,
  );

  static final CodehubClient _codehubClient = CodehubClient._internal();
  Dio _dio = new Dio(baseOptions);

  Dio get dio => _dio;

  factory CodehubClient() {
    return _codehubClient;
  }

  CodehubClient._internal() {}

  void setProxy(String proxyServer, int port) {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        return "PROXY $proxyServer:$port";
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }
}

CodehubClient codehubClient = CodehubClient();
