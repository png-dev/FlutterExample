import 'package:json_annotation/json_annotation.dart';

import 'asset_entity.dart';
import 'user_entity.dart';

@JsonSerializable()
class ReleaseEntity {
  int id;
  @JsonKey(name: 'node_id')
  String noteId;
  @JsonKey(name: 'tag_name')
  String tagName;
  String name;
  bool draft;
  bool prerelease;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'published_at')
  String publishedAt;
  String body;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  UserEntity author;
  @JsonKey(name: 'tarball_url')
  String tarballUrl;
  @JsonKey(name: 'zipball_url')
  String zipballUrl;
  List<AssetEntity> assets;

  ReleaseEntity(
      {this.id,
      this.noteId,
      this.tagName,
      this.name,
      this.draft,
      this.prerelease,
      this.createdAt,
      this.publishedAt,
      this.body,
      this.htmlUrl,
      this.author,
      this.tarballUrl,
      this.zipballUrl,
      this.assets});

  factory ReleaseEntity.fromJson(Map<String, dynamic> json) =>
      _$ReleaseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseEntityToJson(this);

  @override
  String toString() {
    return '{id: $id, noteId: $noteId, tagName: $tagName, name: $name, draft: $draft, prerelease: $prerelease, createdAt: $createdAt, publishedAt: $publishedAt, body: $body, htmlUrl: $htmlUrl, author: $author, tarballUrl: $tarballUrl, zipballUrl: $zipballUrl, assets: $assets}';
  }
}

ReleaseEntity _$ReleaseEntityFromJson(Map<String, dynamic> json) {
  return ReleaseEntity(
    id: json['id'] as int,
    noteId: json['node_id'] as String,
    tagName: json['tag_name'] as String,
    name: json['name'] as String,
    draft: json['draft'] as bool,
    prerelease: json['prerelease'] as bool,
    createdAt: json['created_at'] as String,
    publishedAt: json['published_at'] as String,
    body: json['body'] as String,
    htmlUrl: json['html_url'] as String,
    author: json['author'] == null
        ? null
        : UserEntity.fromJson(json['author'] as Map<String, dynamic>),
    tarballUrl: json['tarball_url'] as String,
    zipballUrl: json['zipball_url'] as String,
    assets: (json['assets'] as List)
        ?.map((e) =>
            e == null ? null : AssetEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReleaseEntityToJson(ReleaseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.noteId,
      'tag_name': instance.tagName,
      'name': instance.name,
      'draft': instance.draft,
      'prerelease': instance.prerelease,
      'created_at': instance.createdAt,
      'published_at': instance.publishedAt,
      'body': instance.body,
      'html_url': instance.htmlUrl,
      'author': instance.author,
      'tarball_url': instance.tarballUrl,
      'zipball_url': instance.zipballUrl,
      'assets': instance.assets,
    };
