import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class IssueLabel {
  int id;
  @JsonKey(name: 'node_id')
  String noteId;
  String url;
  String name;
  String description;
  String color;
  @JsonKey(name: 'default')
  bool defaulted;

  IssueLabel(
      {this.id,
      this.noteId,
      this.url,
      this.name,
      this.description,
      this.color,
      this.defaulted});

  factory IssueLabel.fromJson(Map<String, dynamic> json) =>
      _$IssueLabelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueLabelToJson(this);

  @override
  String toString() {
    return '{id: $id, noteId: $noteId, url: $url, name: $name, description: $description, color: $color, defaulted: $defaulted}';
  }
}

IssueLabel _$IssueLabelFromJson(Map<String, dynamic> json) {
  return IssueLabel(
    id: json['id'] as int,
    noteId: json['node_id'] as String,
    url: json['url'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    color: json['color'] as String,
    defaulted: json['default'] as bool,
  );
}

Map<String, dynamic> _$IssueLabelToJson(IssueLabel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.noteId,
      'url': instance.url,
      'name': instance.name,
      'description': instance.description,
      'color': instance.color,
      'default': instance.defaulted,
    };
