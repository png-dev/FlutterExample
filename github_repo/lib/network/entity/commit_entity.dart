import 'package:json_annotation/json_annotation.dart';

import 'commit_commit_entity.dart';
import 'commit_parent_entity.dart';
import 'user_entity.dart';

@JsonSerializable()
class CommitEntity {
  String url;
  String sha;
  @JsonKey(name: 'node_id')
  String nodeId;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  @JsonKey(name: 'comments_url')
  String commentsUrl;
  CommitCommitEntity commit;
  UserEntity author;
  UserEntity committer;
  List<CommitParentEntity> parents;

  CommitEntity(
      {this.url,
      this.sha,
      this.nodeId,
      this.htmlUrl,
      this.commentsUrl,
      this.commit,
      this.author,
      this.committer,
      this.parents});

  factory CommitEntity.fromJson(Map<String, dynamic> json) =>
      _$CommitEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommitEntityToJson(this);

  @override
  String toString() {
    return '{url: $url, sha: $sha, nodeId: $nodeId, htmlUrl: $htmlUrl, commentsUrl: $commentsUrl, commit: $commit, author: $author, committer: $committer, parents: $parents}';
  }
}

CommitEntity _$CommitEntityFromJson(Map<String, dynamic> json) {
  return CommitEntity(
    url: json['url'] as String,
    sha: json['sha'] as String,
    nodeId: json['node_id'] as String,
    htmlUrl: json['html_url'] as String,
    commentsUrl: json['comments_url'] as String,
    commit: json['commit'] == null
        ? null
        : CommitCommitEntity.fromJson(json['commit'] as Map<String, dynamic>),
    author: json['author'] == null
        ? null
        : UserEntity.fromJson(json['author'] as Map<String, dynamic>),
    committer: json['committer'] == null
        ? null
        : UserEntity.fromJson(json['committer'] as Map<String, dynamic>),
    parents: (json['parents'] as List)
        ?.map((e) => e == null
            ? null
            : CommitParentEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CommitEntityToJson(CommitEntity instance) =>
    <String, dynamic>{
      'url': instance.url,
      'sha': instance.sha,
      'node_id': instance.nodeId,
      'html_url': instance.htmlUrl,
      'comments_url': instance.commentsUrl,
      'commit': instance.commit,
      'author': instance.author,
      'committer': instance.committer,
      'parents': instance.parents,
    };
