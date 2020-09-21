import 'package:json_annotation/json_annotation.dart';

import 'repo_license.dart';
import 'repo_permissions.dart';
import 'user_entity.dart';

@JsonSerializable()
class RepoEntity {
  @JsonKey(name: 'stargazers_count')
  int stargazersCount;
  @JsonKey(name: 'pushed_at')
  String pushedAt;
  @JsonKey(name: 'subscription_url')
  String subscriptionUrl;
  String language;
  @JsonKey(name: 'branches_url')
  String branchesUrl;
  @JsonKey(name: 'issueComment_url')
  String issueCommentUrl;
  @JsonKey(name: 'labels_url')
  String labelsUrl;
  @JsonKey(name: 'subscribers_url')
  String subscribersUrl;
  RepoPermissions permissions;
  @JsonKey(name: 'releases_url')
  String releasesUrl;
  @JsonKey(name: 'svn_url')
  String svnUrl;
  int id;
  int forks;
  @JsonKey(name: 'archive_url')
  String archiveUrl;
  @JsonKey(name: 'git_refs_url')
  String gitRefsUrl;
  @JsonKey(name: 'forks_url')
  String forksUrl;
  @JsonKey(name: 'statuses_url')
  String statusesUrl;
  @JsonKey(name: 'ssh_url')
  String sshUrl;
  RepoLicense license;
  @JsonKey(name: 'full_name')
  String fullName;
  int size;
  @JsonKey(name: 'languages_url')
  String languagesUrl;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  @JsonKey(name: 'collaborators_url')
  String collaboratorsUrl;
  @JsonKey(name: 'clone_url')
  String cloneUrl;
  String name;
  @JsonKey(name: 'pulls_url')
  String pullsUrl;
  @JsonKey(name: 'default_branch')
  String defaultBranch;
  @JsonKey(name: 'hooks_url')
  String hooksUrl;
  @JsonKey(name: 'trees_url')
  String treesUrl;
  @JsonKey(name: 'tags_url')
  String tagsUrl;
  bool private;
  @JsonKey(name: 'contributors_url')
  String contributorsUrl;
  @JsonKey(name: 'has_downloads')
  bool hasDownloads;
  @JsonKey(name: 'notifications_url')
  String notificationsUrl;
  @JsonKey(name: 'open_issues_count')
  int openIssuesCount;
  String description;
  @JsonKey(name: 'created_at')
  String createdAt;
  int watchers;
  @JsonKey(name: 'keys_url')
  String keysUrl;
  @JsonKey(name: 'deployments_url')
  String deploymentsUrl;
  @JsonKey(name: 'has_projects')
  bool hasProjects;
  bool archived;
  @JsonKey(name: 'has_wiki')
  bool hasWiki;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'comments_url')
  String commentsUrl;
  @JsonKey(name: 'stargazers_url')
  String stargazersUrl;
  bool disabled;
  @JsonKey(name: 'git_url')
  String gitUrl;
  @JsonKey(name: 'has_pages')
  bool hasPages;
  UserEntity owner;
  @JsonKey(name: 'commits_url')
  String commitsUrl;
  @JsonKey(name: 'compare_url')
  String compareUrl;
  @JsonKey(name: 'git_commits_url')
  String gitCommitsUrl;
  @JsonKey(name: 'blobs_url')
  String blobsUrl;
  @JsonKey(name: 'gitTags_url')
  String gitTagsUrl;
  @JsonKey(name: 'merges_url')
  String mergesUrl;
  @JsonKey(name: 'downloads_url')
  String downloadsUrl;
  @JsonKey(name: 'has_issues')
  bool hasIssues;
  String url;
  @JsonKey(name: 'contents_url')
  String contentsUrl;
  @JsonKey(name: 'mirror_url')
  dynamic mirrorUrl;
  @JsonKey(name: 'milestones_url')
  String milestonesUrl;
  @JsonKey(name: 'teams_url')
  String teamsUrl;
  bool fork;
  @JsonKey(name: 'issues_url')
  String issuesUrl;
  @JsonKey(name: 'events_url')
  String eventsUrl;
  @JsonKey(name: 'issue_events_url')
  String issueEventsUrl;
  @JsonKey(name: 'assignees_url')
  String assigneesUrl;
  @JsonKey(name: 'open_issues')
  int openIssues;
  @JsonKey(name: 'watchers_count')
  int watchersCount;
  @JsonKey(name: 'node_id')
  String nodeId;
  dynamic homepage;
  @JsonKey(name: 'forks_count')
  int forksCount;
  @JsonKey(name: 'subscribers_count')
  int subscribersCount;
  RepoEntity parent;
  RepoEntity source;

  RepoEntity(
      {this.stargazersCount,
      this.pushedAt,
      this.subscriptionUrl,
      this.language,
      this.branchesUrl,
      this.issueCommentUrl,
      this.labelsUrl,
      this.subscribersUrl,
      this.permissions,
      this.releasesUrl,
      this.svnUrl,
      this.id,
      this.forks,
      this.archiveUrl,
      this.gitRefsUrl,
      this.forksUrl,
      this.statusesUrl,
      this.sshUrl,
      this.license,
      this.fullName,
      this.size,
      this.languagesUrl,
      this.htmlUrl,
      this.collaboratorsUrl,
      this.cloneUrl,
      this.name,
      this.pullsUrl,
      this.defaultBranch,
      this.hooksUrl,
      this.treesUrl,
      this.tagsUrl,
      this.private,
      this.contributorsUrl,
      this.hasDownloads,
      this.notificationsUrl,
      this.openIssuesCount,
      this.description,
      this.createdAt,
      this.watchers,
      this.keysUrl,
      this.deploymentsUrl,
      this.hasProjects,
      this.archived,
      this.hasWiki,
      this.updatedAt,
      this.commentsUrl,
      this.stargazersUrl,
      this.disabled,
      this.gitUrl,
      this.hasPages,
      this.owner,
      this.commitsUrl,
      this.compareUrl,
      this.gitCommitsUrl,
      this.blobsUrl,
      this.gitTagsUrl,
      this.mergesUrl,
      this.downloadsUrl,
      this.hasIssues,
      this.url,
      this.contentsUrl,
      this.mirrorUrl,
      this.milestonesUrl,
      this.teamsUrl,
      this.fork,
      this.issuesUrl,
      this.eventsUrl,
      this.issueEventsUrl,
      this.assigneesUrl,
      this.openIssues,
      this.watchersCount,
      this.nodeId,
      this.homepage,
      this.forksCount,
      this.subscribersCount,
      this.parent,
      this.source});

  factory RepoEntity.fromJson(Map<String, dynamic> json) =>
      _$RepoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RepoEntityToJson(this);

  @override
  String toString() {
    return '{stargazersCount: $stargazersCount, pushedAt: $pushedAt, subscriptionUrl: $subscriptionUrl, language: $language, branchesUrl: $branchesUrl, issueCommentUrl: $issueCommentUrl, labelsUrl: $labelsUrl, subscribersUrl: $subscribersUrl, permissions: $permissions, releasesUrl: $releasesUrl, svnUrl: $svnUrl, id: $id, forks: $forks, archiveUrl: $archiveUrl, gitRefsUrl: $gitRefsUrl, forksUrl: $forksUrl, statusesUrl: $statusesUrl, sshUrl: $sshUrl, license: $license, fullName: $fullName, size: $size, languagesUrl: $languagesUrl, htmlUrl: $htmlUrl, collaboratorsUrl: $collaboratorsUrl, cloneUrl: $cloneUrl, name: $name, pullsUrl: $pullsUrl, defaultBranch: $defaultBranch, hooksUrl: $hooksUrl, treesUrl: $treesUrl, tagsUrl: $tagsUrl, private: $private, contributorsUrl: $contributorsUrl, hasDownloads: $hasDownloads, notificationsUrl: $notificationsUrl, openIssuesCount: $openIssuesCount, description: $description, createdAt: $createdAt, watchers: $watchers, keysUrl: $keysUrl, deploymentsUrl: $deploymentsUrl, hasProjects: $hasProjects, archived: $archived, hasWiki: $hasWiki, updatedAt: $updatedAt, commentsUrl: $commentsUrl, stargazersUrl: $stargazersUrl, disabled: $disabled, gitUrl: $gitUrl, hasPages: $hasPages, owner: $owner, commitsUrl: $commitsUrl, compareUrl: $compareUrl, gitCommitsUrl: $gitCommitsUrl, blobsUrl: $blobsUrl, gitTagsUrl: $gitTagsUrl, mergesUrl: $mergesUrl, downloadsUrl: $downloadsUrl, hasIssues: $hasIssues, url: $url, contentsUrl: $contentsUrl, mirrorUrl: $mirrorUrl, milestonesUrl: $milestonesUrl, teamsUrl: $teamsUrl, fork: $fork, issuesUrl: $issuesUrl, eventsUrl: $eventsUrl, issueEventsUrl: $issueEventsUrl, assigneesUrl: $assigneesUrl, openIssues: $openIssues, watchersCount: $watchersCount, nodeId: $nodeId, homepage: $homepage, forksCount: $forksCount, subscribersCount: $subscribersCount, parent: $parent, source: $source}';
  }
}

RepoEntity _$RepoEntityFromJson(Map<String, dynamic> json) {
  return RepoEntity(
    stargazersCount: json['stargazers_count'] as int,
    pushedAt: json['pushed_at'] as String,
    subscriptionUrl: json['subscription_url'] as String,
    language: json['language'] as String,
    branchesUrl: json['branches_url'] as String,
    issueCommentUrl: json['issueComment_url'] as String,
    labelsUrl: json['labels_url'] as String,
    subscribersUrl: json['subscribers_url'] as String,
    permissions: json['permissions'] == null
        ? null
        : RepoPermissions.fromJson(json['permissions'] as Map<String, dynamic>),
    releasesUrl: json['releases_url'] as String,
    svnUrl: json['svn_url'] as String,
    id: json['id'] as int,
    forks: json['forks'] as int,
    archiveUrl: json['archive_url'] as String,
    gitRefsUrl: json['git_refs_url'] as String,
    forksUrl: json['forks_url'] as String,
    statusesUrl: json['statuses_url'] as String,
    sshUrl: json['ssh_url'] as String,
    license: json['license'] == null
        ? null
        : RepoLicense.fromJson(json['license'] as Map<String, dynamic>),
    fullName: json['full_name'] as String,
    size: json['size'] as int,
    languagesUrl: json['languages_url'] as String,
    htmlUrl: json['html_url'] as String,
    collaboratorsUrl: json['collaborators_url'] as String,
    cloneUrl: json['clone_url'] as String,
    name: json['name'] as String,
    pullsUrl: json['pulls_url'] as String,
    defaultBranch: json['default_branch'] as String,
    hooksUrl: json['hooks_url'] as String,
    treesUrl: json['trees_url'] as String,
    tagsUrl: json['tags_url'] as String,
    private: json['private'] as bool,
    contributorsUrl: json['contributors_url'] as String,
    hasDownloads: json['has_downloads'] as bool,
    notificationsUrl: json['notifications_url'] as String,
    openIssuesCount: json['open_issues_count'] as int,
    description: json['description'] as String,
    createdAt: json['created_at'] as String,
    watchers: json['watchers'] as int,
    keysUrl: json['keys_url'] as String,
    deploymentsUrl: json['deployments_url'] as String,
    hasProjects: json['has_projects'] as bool,
    archived: json['archived'] as bool,
    hasWiki: json['has_wiki'] as bool,
    updatedAt: json['updated_at'] as String,
    commentsUrl: json['comments_url'] as String,
    stargazersUrl: json['stargazers_url'] as String,
    disabled: json['disabled'] as bool,
    gitUrl: json['git_url'] as String,
    hasPages: json['has_pages'] as bool,
    owner: json['owner'] == null
        ? null
        : UserEntity.fromJson(json['owner'] as Map<String, dynamic>),
    commitsUrl: json['commits_url'] as String,
    compareUrl: json['compare_url'] as String,
    gitCommitsUrl: json['git_commits_url'] as String,
    blobsUrl: json['blobs_url'] as String,
    gitTagsUrl: json['gitTags_url'] as String,
    mergesUrl: json['merges_url'] as String,
    downloadsUrl: json['downloads_url'] as String,
    hasIssues: json['has_issues'] as bool,
    url: json['url'] as String,
    contentsUrl: json['contents_url'] as String,
    mirrorUrl: json['mirror_url'],
    milestonesUrl: json['milestones_url'] as String,
    teamsUrl: json['teams_url'] as String,
    fork: json['fork'] as bool,
    issuesUrl: json['issues_url'] as String,
    eventsUrl: json['events_url'] as String,
    issueEventsUrl: json['issue_events_url'] as String,
    assigneesUrl: json['assignees_url'] as String,
    openIssues: json['open_issues'] as int,
    watchersCount: json['watchers_count'] as int,
    nodeId: json['node_id'] as String,
    homepage: json['homepage'],
    forksCount: json['forks_count'] as int,
    subscribersCount: json['subscribers_count'] as int,
    parent: json['parent'] == null
        ? null
        : RepoEntity.fromJson(json['parent'] as Map<String, dynamic>),
    source: json['source'] == null
        ? null
        : RepoEntity.fromJson(json['source'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RepoEntityToJson(RepoEntity instance) =>
    <String, dynamic>{
      'stargazers_count': instance.stargazersCount,
      'pushed_at': instance.pushedAt,
      'subscription_url': instance.subscriptionUrl,
      'language': instance.language,
      'branches_url': instance.branchesUrl,
      'issueComment_url': instance.issueCommentUrl,
      'labels_url': instance.labelsUrl,
      'subscribers_url': instance.subscribersUrl,
      'permissions': instance.permissions,
      'releases_url': instance.releasesUrl,
      'svn_url': instance.svnUrl,
      'id': instance.id,
      'forks': instance.forks,
      'archive_url': instance.archiveUrl,
      'git_refs_url': instance.gitRefsUrl,
      'forks_url': instance.forksUrl,
      'statuses_url': instance.statusesUrl,
      'ssh_url': instance.sshUrl,
      'license': instance.license,
      'full_name': instance.fullName,
      'size': instance.size,
      'languages_url': instance.languagesUrl,
      'html_url': instance.htmlUrl,
      'collaborators_url': instance.collaboratorsUrl,
      'clone_url': instance.cloneUrl,
      'name': instance.name,
      'pulls_url': instance.pullsUrl,
      'default_branch': instance.defaultBranch,
      'hooks_url': instance.hooksUrl,
      'trees_url': instance.treesUrl,
      'tags_url': instance.tagsUrl,
      'private': instance.private,
      'contributors_url': instance.contributorsUrl,
      'has_downloads': instance.hasDownloads,
      'notifications_url': instance.notificationsUrl,
      'open_issues_count': instance.openIssuesCount,
      'description': instance.description,
      'created_at': instance.createdAt,
      'watchers': instance.watchers,
      'keys_url': instance.keysUrl,
      'deployments_url': instance.deploymentsUrl,
      'has_projects': instance.hasProjects,
      'archived': instance.archived,
      'has_wiki': instance.hasWiki,
      'updated_at': instance.updatedAt,
      'comments_url': instance.commentsUrl,
      'stargazers_url': instance.stargazersUrl,
      'disabled': instance.disabled,
      'git_url': instance.gitUrl,
      'has_pages': instance.hasPages,
      'owner': instance.owner,
      'commits_url': instance.commitsUrl,
      'compare_url': instance.compareUrl,
      'git_commits_url': instance.gitCommitsUrl,
      'blobs_url': instance.blobsUrl,
      'gitTags_url': instance.gitTagsUrl,
      'merges_url': instance.mergesUrl,
      'downloads_url': instance.downloadsUrl,
      'has_issues': instance.hasIssues,
      'url': instance.url,
      'contents_url': instance.contentsUrl,
      'mirror_url': instance.mirrorUrl,
      'milestones_url': instance.milestonesUrl,
      'teams_url': instance.teamsUrl,
      'fork': instance.fork,
      'issues_url': instance.issuesUrl,
      'events_url': instance.eventsUrl,
      'issue_events_url': instance.issueEventsUrl,
      'assignees_url': instance.assigneesUrl,
      'open_issues': instance.openIssues,
      'watchers_count': instance.watchersCount,
      'node_id': instance.nodeId,
      'homepage': instance.homepage,
      'forks_count': instance.forksCount,
      'subscribers_count': instance.subscribersCount,
      'parent': instance.parent,
      'source': instance.source,
    };
