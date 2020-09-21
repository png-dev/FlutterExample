import 'package:json_annotation/json_annotation.dart';

import 'commit_commit_entity.dart';
import 'commit_detail_file.dart';
import 'commit_detail_stats.dart';
import 'commit_parent_entity.dart';
import 'user_entity.dart';

@JsonSerializable()
class CommitDetailEntity {
  @JsonKey(name: 'comments_url')
  String commentsUrl;
  @JsonKey(name: 'node_id')
  String nodeId;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  String sha;
  String url;
  UserEntity author;
  CommitCommitEntity commit;
  UserEntity committer;
  List<CommitDetailFile> files;
  List<CommitParentEntity> parents;
  CommitDetailStats stats;

  CommitDetailEntity(
      {this.commentsUrl,
      this.nodeId,
      this.htmlUrl,
      this.sha,
      this.url,
      this.author,
      this.commit,
      this.committer,
      this.files,
      this.parents,
      this.stats});

  factory CommitDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$CommitDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommitDetailEntityToJson(this);

  @override
  String toString() {
    return '{commentsUrl: $commentsUrl, nodeId: $nodeId, htmlUrl: $htmlUrl, sha: $sha, url: $url, author: $author, commit: $commit, committer: $committer, files: $files, parents: $parents, stats: $stats}';
  }
}

CommitDetailEntity _$CommitDetailEntityFromJson(Map<String, dynamic> json) {
  return CommitDetailEntity(
    commentsUrl: json['comments_url'] as String,
    nodeId: json['node_id'] as String,
    htmlUrl: json['html_url'] as String,
    sha: json['sha'] as String,
    url: json['url'] as String,
    author: json['author'] == null
        ? null
        : UserEntity.fromJson(json['author'] as Map<String, dynamic>),
    commit: json['commit'] == null
        ? null
        : CommitCommitEntity.fromJson(json['commit'] as Map<String, dynamic>),
    committer: json['committer'] == null
        ? null
        : UserEntity.fromJson(json['committer'] as Map<String, dynamic>),
    files: (json['files'] as List)
        ?.map((e) => e == null
            ? null
            : CommitDetailFile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    parents: (json['parents'] as List)
        ?.map((e) => e == null
            ? null
            : CommitParentEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    stats: json['stats'] == null
        ? null
        : CommitDetailStats.fromJson(json['stats'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommitDetailEntityToJson(CommitDetailEntity instance) =>
    <String, dynamic>{
      'comments_url': instance.commentsUrl,
      'node_id': instance.nodeId,
      'html_url': instance.htmlUrl,
      'sha': instance.sha,
      'url': instance.url,
      'author': instance.author,
      'commit': instance.commit,
      'committer': instance.committer,
      'files': instance.files,
      'parents': instance.parents,
      'stats': instance.stats,
    };
