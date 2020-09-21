import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CommitDetailStats {
  int additions;
  int deletions;
  int total;

  CommitDetailStats({this.additions, this.deletions, this.total});

  factory CommitDetailStats.fromJson(Map<String, dynamic> json) =>
      _$CommitDetailStatsFromJson(json);

  Map<String, dynamic> toJson() => _$CommitDetailStatsToJson(this);

  @override
  String toString() {
    return '{additions: $additions, deletions: $deletions, total: $total}';
  }
}

CommitDetailStats _$CommitDetailStatsFromJson(Map<String, dynamic> json) {
  return CommitDetailStats(
    additions: json['additions'] as int,
    deletions: json['deletions'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$CommitDetailStatsToJson(CommitDetailStats instance) =>
    <String, dynamic>{
      'additions': instance.additions,
      'deletions': instance.deletions,
      'total': instance.total,
    };
