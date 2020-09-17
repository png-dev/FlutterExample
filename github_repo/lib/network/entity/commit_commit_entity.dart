import 'package:json_annotation/json_annotation.dart';

import 'commit_commit_author.dart';
import 'commit_commit_verification.dart';
import 'commit_parent_entity.dart';

@JsonSerializable()
class CommitCommitEntity {
  String url;
  String message;
  @JsonKey(name: 'comment_count')
  int commentCount;
  CommitCommitAuthor author;
  CommitCommitAuthor committer;
  CommitParentEntity tree;
  CommitCommitVerification verification;

  CommitCommitEntity(
      {this.url,
      this.message,
      this.commentCount,
      this.author,
      this.committer,
      this.tree,
      this.verification});

  factory CommitCommitEntity.fromJson(Map<String, dynamic> json) =>
      _$CommitCommitEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommitCommitEntityToJson(this);

  @override
  String toString() {
    return '{url: $url, message: $message, commentCount: $commentCount, '
        'author: $author, committer: $committer, tree: $tree, verification: $verification}';
  }
}

CommitCommitEntity _$CommitCommitEntityFromJson(Map<String, dynamic> json) {
  return CommitCommitEntity(
    url: json['url'] as String,
    message: json['message'] as String,
    commentCount: json['comment_count'] as int,
    author: json['author'] == null
        ? null
        : CommitCommitAuthor.fromJson(json['author'] as Map<String, dynamic>),
    committer: json['committer'] == null
        ? null
        : CommitCommitAuthor.fromJson(
            json['committer'] as Map<String, dynamic>),
    tree: json['tree'] == null
        ? null
        : CommitParentEntity.fromJson(json['tree'] as Map<String, dynamic>),
    verification: json['verification'] == null
        ? null
        : CommitCommitVerification.fromJson(
            json['verification'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommitCommitEntityToJson(CommitCommitEntity instance) =>
    <String, dynamic>{
      'url': instance.url,
      'message': instance.message,
      'comment_count': instance.commentCount,
      'author': instance.author,
      'committer': instance.committer,
      'tree': instance.tree,
      'verification': instance.verification,
    };
