import 'package:github_repo/network/entity/user_plan.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserEntity {
  @JsonKey(name: 'gists_url')
  String gistsUrl;

  @JsonKey(name: 'repos_url')
  String reposUrl;

  @JsonKey(name: 'following_url')
  String followingUrl;

  dynamic bio;

  @JsonKey(name: 'created_at')
  String createdAt;

  String login;
  String type;
  String blog;

  @JsonKey(name: 'subscriptions_url')
  String subScriptionsUrl;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  @JsonKey(name: 'site_admin')
  bool siteAdmin;

  dynamic company;
  int id;

  @JsonKey(name: 'public_repos')
  int publicRepos;

  @JsonKey(name: 'gravatar_id')
  String grAvatarId;

  dynamic email;

  @JsonKey(name: 'organizations_url')
  String organizationsUrl;

  dynamic hireable;

  @JsonKey(name: 'starred_url')
  String starredUrl;

  @JsonKey(name: 'followers_url')
  String followersUrl;

  int publicGists;

  String url;

  @JsonKey(name: 'received_events_url')
  String receivedEventsUrl;

  int followers;

  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  @JsonKey(name: 'events_url')
  String eventsUrl;

  @JsonKey(name: 'html_url')
  String htmlUrl;

  int following;
  dynamic name;
  dynamic location;

  @JsonKey(name: 'node_id')
  String nodeId;

  @JsonKey(name: 'private_gists')
  int privateGists;

  @JsonKey(name: 'total_private_repos')
  int totalPrivateRepos;

  @JsonKey(name: 'owned_private_repos')
  int ownedPrivateRepos;

  @JsonKey(name: 'disk_usage')
  int diskUsage;

  int collaborators;

  @JsonKey(name: 'two_factor_authentication')
  bool twoFactorAuthentication;

  UserPlan plan;

  bool get isUser => this.type == 'User';

  UserEntity(
      {this.gistsUrl,
      this.reposUrl,
      this.followingUrl,
      this.bio,
      this.createdAt,
      this.type,
      this.login,
      this.blog,
      this.subScriptionsUrl,
      this.updatedAt,
      this.siteAdmin,
      this.company,
      this.id,
      this.publicRepos,
      this.grAvatarId,
      this.email,
      this.organizationsUrl,
      this.hireable,
      this.starredUrl,
      this.followersUrl,
      this.publicGists,
      this.url,
      this.receivedEventsUrl,
      this.followers,
      this.avatarUrl,
      this.eventsUrl,
      this.htmlUrl,
      this.following,
      this.name,
      this.location,
      this.nodeId,
      this.privateGists,
      this.totalPrivateRepos,
      this.ownedPrivateRepos,
      this.diskUsage,
      this.collaborators,
      this.twoFactorAuthentication,
      this.plan});

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  String toString() {
    return '{gistsUrl: $gistsUrl, reposUrl: $reposUrl, followingUrl: $followingUrl, '
        'bio: $bio, createdAt: $createdAt, login: $login, type: $type, blog: $blog, '
        'subscriptionsUrl: $subScriptionsUrl, updatedAt: $updatedAt, siteAdmin: $siteAdmin,'
        ' company: $company, id: $id, publicRepos: $publicRepos, gravatarId: $grAvatarId, '
        'email: $email, organizationsUrl: $organizationsUrl, hireable: $hireable, '
        'starredUrl: $starredUrl, followersUrl: $followersUrl, publicGists: $publicGists,'
        ' url: $url, receivedEventsUrl: $receivedEventsUrl, followers: $followers, '
        'avatarUrl: $avatarUrl, eventsUrl: $eventsUrl, htmlUrl: $htmlUrl, following: $following,'
        ' name: $name, location: $location, nodeId: $nodeId, privateGists: $privateGists, '
        'totalPrivateRepos: $totalPrivateRepos, ownedPrivateRepos: $ownedPrivateRepos, '
        'diskUsage: $diskUsage, collaborators: $collaborators,'
        ' twoFactorAuthentication: $twoFactorAuthentication, plan: $plan}';
  }
}

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
    gistsUrl: json['gists_url'] as String,
    reposUrl: json['repos_url'] as String,
    followingUrl: json['following_url'] as String,
    bio: json['bio'],
    createdAt: json['created_at'] as String,
    login: json['login'] as String,
    type: json['type'] as String,
    blog: json['blog'] as String,
    subScriptionsUrl: json['subscriptions_url'] as String,
    updatedAt: json['updated_at'] as String,
    siteAdmin: json['site_admin'] as bool,
    company: json['company'],
    id: json['id'] as int,
    publicRepos: json['public_repos'] as int,
    grAvatarId: json['gravatar_id'] as String,
    email: json['email'],
    organizationsUrl: json['organizations_url'] as String,
    hireable: json['hireable'],
    starredUrl: json['starred_url'] as String,
    followersUrl: json['followers_url'] as String,
    publicGists: json['publicGists'] as int,
    url: json['url'] as String,
    receivedEventsUrl: json['received_events_url'] as String,
    followers: json['followers'] as int,
    avatarUrl: json['avatar_url'] as String,
    eventsUrl: json['events_url'] as String,
    htmlUrl: json['html_url'] as String,
    following: json['following'] as int,
    name: json['name'],
    location: json['location'],
    nodeId: json['node_id'] as String,
    privateGists: json['private_gists'] as int,
    totalPrivateRepos: json['total_private_repos'] as int,
    ownedPrivateRepos: json['owned_private_repos'] as int,
    diskUsage: json['disk_usage'] as int,
    collaborators: json['collaborators'] as int,
    twoFactorAuthentication: json['two_factor_authentication'] as bool,
    plan: json['plan'] == null
        ? null
        : UserPlan.fromJson(json['plan'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'gists_url': instance.gistsUrl,
      'repos_url': instance.reposUrl,
      'following_url': instance.followingUrl,
      'bio': instance.bio,
      'created_at': instance.createdAt,
      'login': instance.login,
      'type': instance.type,
      'blog': instance.blog,
      'subscriptions_url': instance.subScriptionsUrl,
      'updated_at': instance.updatedAt,
      'site_admin': instance.siteAdmin,
      'company': instance.company,
      'id': instance.id,
      'public_repos': instance.publicRepos,
      'gravatar_id': instance.grAvatarId,
      'email': instance.email,
      'organizations_url': instance.organizationsUrl,
      'hireable': instance.hireable,
      'starred_url': instance.starredUrl,
      'followers_url': instance.followersUrl,
      'publicGists': instance.publicGists,
      'url': instance.url,
      'received_events_url': instance.receivedEventsUrl,
      'followers': instance.followers,
      'avatar_url': instance.avatarUrl,
      'events_url': instance.eventsUrl,
      'html_url': instance.htmlUrl,
      'following': instance.following,
      'name': instance.name,
      'location': instance.location,
      'node_id': instance.nodeId,
      'private_gists': instance.privateGists,
      'total_private_repos': instance.totalPrivateRepos,
      'owned_private_repos': instance.ownedPrivateRepos,
      'disk_usage': instance.diskUsage,
      'collaborators': instance.collaborators,
      'two_factor_authentication': instance.twoFactorAuthentication,
      'plan': instance.plan,
    };
