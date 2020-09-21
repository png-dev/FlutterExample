import 'package:json_annotation/json_annotation.dart';

import 'repo_content_links.dart';

@JsonSerializable()
class RepoContentEntity {
  String type;
  String encoding;
  int size;
  String name;
  String path;
  String content;
  String sha;
  String url;
  @JsonKey(name: 'git_url')
  String gitUrl;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  @JsonKey(name: 'download_url')
  String downloadUrl;
  @JsonKey(name: '_links')
  RepoContentLinks links;

  RepoContentEntity(
      this.type,
      this.encoding,
      this.size,
      this.name,
      this.path,
      this.content,
      this.sha,
      this.url,
      this.gitUrl,
      this.htmlUrl,
      this.downloadUrl,
      this.links);

  factory RepoContentEntity.fromJson(Map<String, dynamic> json) =>
      _$RepoContentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RepoContentEntityToJson(this);

  bool get isFile => type == 'file';

  String getFormattedSize() {
    if (size < 1024) {
      return '$size B';
    } else if (size < 1024 * 1024) {
      return '${(size / 1024).toStringAsFixed(2)} KB';
    } else if (size < 1024 * 1024 * 1024) {
      return '${(size / (1024 * 1024)).toStringAsFixed(2)} MB';
    } else if (size < 1024 * 1024 * 1024 * 1024) {
      return '${(size / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    } else if (size < 1024 * 1024 * 1024 * 1024 * 1024) {
      return '${(size / (1024 * 1024 * 1024 * 1024)).toStringAsFixed(2)} TB';
    }
    return '$size Bytes';
  }

  @override
  String toString() {
    return '{type: $type, encoding: $encoding, size: $size, name: $name, path: $path, content: $content, sha: $sha, url: $url, gitUrl: $gitUrl, htmlUrl: $htmlUrl, downloadUrl: $downloadUrl, links: $links}';
  }
}

RepoContentEntity _$RepoContentEntityFromJson(Map<String, dynamic> json) {
  return RepoContentEntity(
    json['type'] as String,
    json['encoding'] as String,
    json['size'] as int,
    json['name'] as String,
    json['path'] as String,
    json['content'] as String,
    json['sha'] as String,
    json['url'] as String,
    json['git_url'] as String,
    json['html_url'] as String,
    json['download_url'] as String,
    json['_links'] == null
        ? null
        : RepoContentLinks.fromJson(json['_links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RepoContentEntityToJson(RepoContentEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'encoding': instance.encoding,
      'size': instance.size,
      'name': instance.name,
      'path': instance.path,
      'content': instance.content,
      'sha': instance.sha,
      'url': instance.url,
      'git_url': instance.gitUrl,
      'html_url': instance.htmlUrl,
      'download_url': instance.downloadUrl,
      '_links': instance.links,
    };
