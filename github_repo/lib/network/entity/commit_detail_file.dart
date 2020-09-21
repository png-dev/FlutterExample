import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CommitDetailFile {
  String filename;
  int additions;
  int deletions;
  int changes;
  String status;
  @JsonKey(name: 'raw_url')
  String rawUrl;
  @JsonKey(name: 'blob_url')
  String blobUrl;
  String patch;

  CommitDetailFile(
      {this.filename,
      this.additions,
      this.deletions,
      this.changes,
      this.status,
      this.rawUrl,
      this.blobUrl,
      this.patch});

  factory CommitDetailFile.fromJson(Map<String, dynamic> json) =>
      _$CommitDetailFileFromJson(json);

  Map<String, dynamic> toJson() => _$CommitDetailFileToJson(this);

  @override
  String toString() {
    return '{filename: $filename, additions: $additions, deletions: $deletions, changes: $changes, status: $status, rawUrl: $rawUrl, blobUrl: $blobUrl, patch: $patch}';
  }
}

CommitDetailFile _$CommitDetailFileFromJson(Map<String, dynamic> json) {
  return CommitDetailFile(
    filename: json['filename'] as String,
    additions: json['additions'] as int,
    deletions: json['deletions'] as int,
    changes: json['changes'] as int,
    status: json['status'] as String,
    rawUrl: json['raw_url'] as String,
    blobUrl: json['blob_url'] as String,
    patch: json['patch'] as String,
  );
}

Map<String, dynamic> _$CommitDetailFileToJson(CommitDetailFile instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'additions': instance.additions,
      'deletions': instance.deletions,
      'changes': instance.changes,
      'status': instance.status,
      'raw_url': instance.rawUrl,
      'blob_url': instance.blobUrl,
      'patch': instance.patch,
    };
