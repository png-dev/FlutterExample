import 'package:github_repo/network/entity/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AssetEntity {
  int id;

  @JsonKey(name: 'node_id')
  String nodeId;
  String name;
  String label;
  UserEntity uploader;

  @JsonKey(name: 'content_type')
  String contentType;

  String state;
  int size;
  @JsonKey(name: 'download_count')
  int downloadCount;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  @JsonKey(name: 'browser_download_url')
  String browserDownloadUrl;

  AssetEntity(
      {this.id,
      this.nodeId,
      this.name,
      this.label,
      this.uploader,
      this.contentType,
      this.state,
      this.size,
      this.downloadCount,
      this.createdAt,
      this.updatedAt,
      this.browserDownloadUrl});

  factory AssetEntity.fromJson(Map<String, dynamic> json) =>
      _$AssetEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AssetEntityToJson(this);
}

AssetEntity _$AssetEntityFromJson(Map<String, dynamic> json) {
  return AssetEntity(
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      name: json['name'] as String,
      label: json['label'] as String,
      uploader: json['uploader'] == null
          ? null
          : UserEntity.fromJson(json['uploader'] as Map<String, dynamic>),
      contentType: json['content_type'] as String,
      state: json['state'] as String,
      size: json['size'] as int,
      downloadCount: json['download_count'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      browserDownloadUrl: json['browser_download_url'] as String);
}

Map<String, dynamic> _$AssetEntityToJson(AssetEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'name': instance.name,
      'label': instance.label,
      'uploader': instance.uploader,
      'content_type': instance.contentType,
      'state': instance.state,
      'size': instance.size,
      'download_count': instance.downloadCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'browser_download_url': instance.browserDownloadUrl
    };
