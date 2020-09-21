import 'package:dio/dio.dart';

import 'codehub_client.dart';
import 'dio_client.dart';
import 'entity/authorization_entity.dart';
import 'entity/authorization_post.dart';
import 'entity/commit_detail_entity.dart';
import 'entity/commit_entity.dart';
import 'entity/event_entity.dart';
import 'entity/issue_entity.dart';
import 'entity/repo_content_entity.dart';
import 'entity/repo_entity.dart';
import 'entity/search_entity.dart';
import 'entity/user_entity.dart';

class ApiService {
  static Future<AuthorizationEntity> login(String credentialsBasic) async {
    Options options = Options(headers: {"Authorization": credentialsBasic});
    Response<Map<String, dynamic>> response = await dioClient.dio.post(
        "/authorizations",
        data: AuthorizationPost().toJson(),
        options: options);
    return AuthorizationEntity.fromJson(response.data);
  }

  static Future<UserEntity> getUser(String username) async {
    Response<Map<String, dynamic>> response =
        await dioClient.dio.get("/users/$username");
    return UserEntity.fromJson(response.data);
  }

  static Future<UserEntity> getAuthenticatedUser() async {
    Response<Map<String, dynamic>> response = await dioClient.dio.get("/user");
    return UserEntity.fromJson(response.data);
  }

  static Future<RepoEntity> getRepo(String repoName) async {
    Response<Map<String, dynamic>> response =
        await dioClient.dio.get("/repos/$repoName");
    return RepoEntity.fromJson(response.data);
  }

  static Future<List<RepoEntity>> getMyRepos(
      {int page = 1,
      String type = 'all',
      String sort = 'full_name',
      String direction = 'asc'}) async {
    Map<String, dynamic> parameters = {
      'page': page,
      'type': type,
      'sort': sort,
      'direction': direction
    };
    Response<List<dynamic>> response =
        await dioClient.dio.get("/user/repos", queryParameters: parameters);
    return response.data.map((item) => RepoEntity.fromJson(item)).toList();
  }

  static Future<List<RepoEntity>> getUserRepos(String login,
      {int page = 1,
      String type = 'all',
      String sort = 'full_name',
      String direction = 'asc'}) async {
    Map<String, dynamic> parameters = {
      'page': page,
      'type': type,
      'sort': sort,
      'direction': direction
    };
    Response<List<dynamic>> response = await dioClient.dio
        .get("/users/$login/repos", queryParameters: parameters);
    return response.data.map((item) => RepoEntity.fromJson(item)).toList();
  }

  static Future<List<RepoEntity>> getUserStarredRepos(String login,
      {int page = 1,
      String sort = 'created',
      String direction = 'desc'}) async {
    Map<String, dynamic> parameters = {
      'page': page,
      'sort': sort,
      'direction': direction
    };
    Response<List<dynamic>> response = await dioClient.dio
        .get("/users/$login/starred", queryParameters: parameters);
    return response.data.map((item) => RepoEntity.fromJson(item)).toList();
  }

  static Future<List<EventEntity>> getEvents(String login,
      {String repoName, int page = 1}) async {
    Response<List<dynamic>> response;
    if (repoName == null || repoName.isEmpty) {
      response = await dioClient.dio.get("/users/$login/events?page=$page");
    } else {
      response =
          await dioClient.dio.get("/repos/$login/$repoName/events?page=$page");
    }
    return response.data.map((item) => EventEntity.fromJson(item)).toList();
  }

  static Future<String> getRepoReadme(String owner, String repo) async {
    Options options =
        Options(headers: {"Accept": "application/vnd.github.VERSION.html"});
    Response<String> response =
        await dioClient.dio.get("/repos/$owner/$repo/readme", options: options);
    return response.data;
  }

  static Future<List<RepoContentEntity>> getRepoContents(
      String owner, String repo, String branch,
      {String path = ''}) async {
    Map<String, dynamic> parameters = {'ref': branch};
    Response<List<dynamic>> response = await dioClient.dio
        .get("/repos/$owner/$repo/contents/$path", queryParameters: parameters);
    return response.data
        .map((item) => RepoContentEntity.fromJson(item))
        .toList();
  }

  static Future<String> getRepoContentRaw(
      String owner, String repo, String branch, String path) async {
    Options options =
        Options(headers: {"Accept": "application/vnd.github.VERSION.raw"});
    Map<String, dynamic> parameters = {'ref': branch};
    Response<String> response = await dioClient.dio.get(
        "/repos/$owner/$repo/contents/$path",
        queryParameters: parameters,
        options: options);
    return response.data;
  }

  static Future<String> getRepoContentHtml(
      String owner, String repo, String branch, String path) async {
    Options options =
        Options(headers: {"Accept": "application/vnd.github.VERSION.html"});
    Map<String, dynamic> parameters = {'ref': branch};
    Response<String> response = await dioClient.dio.get(
        "/repos/$owner/$repo/contents/$path",
        queryParameters: parameters,
        options: options);
    return response.data;
  }

  static Future<List<CommitEntity>> getRepoCommits(
      String owner, String repo, String branch,
      {int page = 1}) async {
    Map<String, dynamic> parameters = {'sha': branch, 'page': page};
    Response<List<dynamic>> response = await dioClient.dio
        .get("/repos/$owner/$repo/commits", queryParameters: parameters);
    return response.data.map((item) => CommitEntity.fromJson(item)).toList();
  }

  static Future<CommitDetailEntity> getCommitDetail(
      String owner, String repo, String sha) async {
    Response<Map<String, dynamic>> response =
        await dioClient.dio.get("/repos/$owner/$repo/commits/$sha");
    return CommitDetailEntity.fromJson(response.data);
  }

  static Future<List<IssueEntity>> getIssues(
      {String filter = 'assigned',
      String state = 'open',
      List<String> labels,
      String sort = 'created',
      String direction = 'desc',
      String since = '',
      int page = 1}) async {
    Map<String, dynamic> parameters = {
      'filter': filter,
      'state': state,
      'labels': labels ?? '',
      'sort': sort,
      'direction': direction,
      'since': since,
      'page': page
    };
    Response<List<dynamic>> response =
        await dioClient.dio.get("/issues", queryParameters: parameters);
    return response.data.map((item) => IssueEntity.fromJson(item)).toList();
  }

  static Future<List<IssueEntity>> getRepoIssues(
      {String repoName,
      String state = 'open',
      String sort = 'updated',
      String order = 'desc',
      int page = 1}) async {
    Map<String, dynamic> parameters = {
      'state': state,
      'sort': sort,
      'order': order,
      'page': page
    };
    Response<List<dynamic>> response = await dioClient.dio
        .get("/repos/$repoName/issues", queryParameters: parameters);
    return response.data.map((item) => IssueEntity.fromJson(item)).toList();
  }

  static Future<List<UserEntity>> getRepoStargazers(String repoFullName,
      {int page = 1}) async {
    Map<String, dynamic> parameters = {'page': page};
    Response<List<dynamic>> response = await dioClient.dio
        .get("/repos/$repoFullName/stargazers", queryParameters: parameters);
    return response.data.map((item) => UserEntity.fromJson(item)).toList();
  }

  static Future<List<RepoEntity>> getRepoForks(String repoFullName,
      {int page = 1}) async {
    Map<String, dynamic> parameters = {'page': page};
    Response<List<dynamic>> response = await dioClient.dio
        .get("/repos/$repoFullName/forks", queryParameters: parameters);
    return response.data.map((item) => RepoEntity.fromJson(item)).toList();
  }

  static Future<List<UserEntity>> getRepoWatchers(String repoFullName,
      {int page = 1}) async {
    Map<String, dynamic> parameters = {'page': page};
    Response<List<dynamic>> response = await dioClient.dio
        .get("/repos/$repoFullName/subscribers", queryParameters: parameters);
    return response.data.map((item) => UserEntity.fromJson(item)).toList();
  }

  static Future<List<UserEntity>> getUserFollowers(String login,
      {int page = 1}) async {
    Map<String, dynamic> parameters = {'page': page};
    Response<List<dynamic>> response = await dioClient.dio
        .get("/users/$login/followers", queryParameters: parameters);
    return response.data.map((item) => UserEntity.fromJson(item)).toList();
  }

  static Future<List<UserEntity>> getUserFollowing(String login,
      {int page = 1}) async {
    Map<String, dynamic> parameters = {'page': page};
    Response<List<dynamic>> response = await dioClient.dio
        .get("/users/$login/following", queryParameters: parameters);
    return response.data.map((item) => UserEntity.fromJson(item)).toList();
  }

  static Future<List<IssueEntity>> searchIssues(
      {String login,
      String state,
      String sort = 'updated',
      String order = 'desc',
      int page = 1}) async {
    String q = 'involves:$login$state';
    Map<String, dynamic> parameters = {
      'sort': sort,
      'order': order,
      'page': page
    };
    Response<Map<String, dynamic>> response = await dioClient.dio
        .get("/search/issues?q=$q", queryParameters: parameters);
    var searchEntity = SearchEntity.fromJson(response.data);
    if (searchEntity != null &&
        searchEntity.items != null &&
        searchEntity.items.isNotEmpty) {
      return searchEntity.items
          .map((item) => IssueEntity.fromJson(item))
          .toList();
    } else {
      return List<IssueEntity>();
    }
  }

  static Future<List<RepoEntity>> searchRepos(
      {String keyword,
      String sort = '',
      String order = 'desc',
      int page = 1}) async {
    Map<String, dynamic> parameters = {
      'q': keyword,
      'sort': sort,
      'order': order,
      'page': page
    };
    Response<Map<String, dynamic>> response = await dioClient.dio
        .get("/search/repositories", queryParameters: parameters);
    var searchEntity = SearchEntity.fromJson(response.data);
    if (searchEntity != null &&
        searchEntity.items != null &&
        searchEntity.items.isNotEmpty) {
      return searchEntity.items
          .map((item) => RepoEntity.fromJson(item))
          .toList();
    } else {
      return List<RepoEntity>();
    }
  }

  static Future<List<UserEntity>> searchUsers(
      {String keyword,
      String sort = '',
      String order = 'desc',
      int page = 1}) async {
    Map<String, dynamic> parameters = {
      'q': keyword,
      'sort': sort,
      'order': order,
      'page': page
    };
    Response<Map<String, dynamic>> response =
        await dioClient.dio.get("/search/users", queryParameters: parameters);
    var searchEntity = SearchEntity.fromJson(response.data);
    if (searchEntity != null &&
        searchEntity.items != null &&
        searchEntity.items.isNotEmpty) {
      return searchEntity.items
          .map((item) => UserEntity.fromJson(item))
          .toList();
    } else {
      return List<UserEntity>();
    }
  }

  static Future<List<RepoEntity>> getTrending(
      {String since = 'daily', String language = ''}) async {
    Map<String, dynamic> parameters = {'since': since, 'language': language};
    Response<List<dynamic>> response =
        await codehubClient.dio.get("/trending", queryParameters: parameters);
    return response.data.map((item) => RepoEntity.fromJson(item)).toList();
  }
}
