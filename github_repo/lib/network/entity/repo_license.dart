import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RepoLicense {
  String name;
  @JsonKey(name: 'spdx_id')
  String spdxId;
  String key;
  String url;
  String nodeId;

  RepoLicense({this.name, this.spdxId, this.key, this.url, this.nodeId});

  factory RepoLicense.fromJson(Map<String, dynamic> json) =>
      _$RepoLicenseFromJson(json);

  Map<String, dynamic> toJson() => _$RepoLicenseToJson(this);

  @override
  String toString() {
    return '{name: $name, spdxId: $spdxId, key: $key, url: $url, nodeId: $nodeId}';
  }
}

RepoLicense _$RepoLicenseFromJson(Map<String, dynamic> json) {
  return RepoLicense(
    name: json['name'] as String,
    spdxId: json['spdx_id'] as String,
    key: json['key'] as String,
    url: json['url'] as String,
    nodeId: json['nodeId'] as String,
  );
}

Map<String, dynamic> _$RepoLicenseToJson(RepoLicense instance) =>
    <String, dynamic>{
      'name': instance.name,
      'spdx_id': instance.spdxId,
      'key': instance.key,
      'url': instance.url,
      'nodeId': instance.nodeId,
    };
