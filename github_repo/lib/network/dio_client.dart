import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:github_repo/utils/sp_util.dart';
import 'package:github_repo/utils/string_util.dart';

class DioClient {
  static const BASE_API = 'https://api.github.com';
  static const API_VERSION = 'application/vnd.github.v3+json';
  static const REQUEST_MEDIA_TYPE = 'application';
  static const REQUEST_MEDIA_SUB_TYPE = 'json';
  static const CONTENT_TYPE = '$REQUEST_MEDIA_TYPE/$REQUEST_MEDIA_SUB_TYPE';
  static const DEFAULT_CHARSET = 'UTF-8';

  static BaseOptions baseOptions = BaseOptions(
      baseUrl: BASE_API,
      connectTimeout: 30000,
      receiveTimeout: 20000,
      headers: {"Accept": API_VERSION, "Content-Type": CONTENT_TYPE});

  static final DioClient _dioClient = DioClient._internal();

  factory DioClient() {
    return _dioClient;
  }

  Dio _dio = new Dio(baseOptions);

  Dio get dio => _dio;

  DioClient._internal() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (Options options) {
      if (!options.headers.containsKey('Authorization') ||
          (options.headers['Authorization'] as String).isEmpty) {
        String basic = SPUtils.getGithubAuthorizationBasic();
        if (StringUtil.isNotEmpty(basic)) {
          options.headers['Authorization'] = basic;
        }
      }
      return options;
    }));
  }

  void setProxy(String proxyServer, int port) {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        return 'PROXY $proxyServer:$port';
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }
}

DioClient dioClient = DioClient();
