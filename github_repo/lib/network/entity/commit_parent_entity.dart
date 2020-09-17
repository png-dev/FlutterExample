import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CommitParentEntity {
  @JsonKey(name: 'html_url')
  String htmlUrl;
  String url;
  String sha;

  CommitParentEntity({this.htmlUrl, this.url, this.sha});

  factory CommitParentEntity.fromJson(Map<String, dynamic> json) =>
      _$CommitParentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommitParentEntityToJson(this);

  @override
  String toString() {
    return '{htmlUrl: $htmlUrl, url: $url, sha: $sha}';
  }
}

CommitParentEntity _$CommitParentEntityFromJson(Map<String, dynamic> json) {
  return CommitParentEntity(
    htmlUrl: json['html_url'] as String,
    url: json['url'] as String,
    sha: json['sha'] as String,
  );
}

Map<String, dynamic> _$CommitParentEntityToJson(CommitParentEntity instance) =>
    <String, dynamic>{
      'html_url': instance.htmlUrl,
      'url': instance.url,
      'sha': instance.sha,
    };
