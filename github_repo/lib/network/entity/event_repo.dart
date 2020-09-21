import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EventRepo {
  int id;
  String name;
  String url;

  EventRepo({this.id, this.name, this.url});

  factory EventRepo.fromJson(Map<String, dynamic> json) =>
      _$EventRepoFromJson(json);

  Map<String, dynamic> toJson() => _$EventRepoToJson(this);

  @override
  String toString() {
    return '{id: $id, name: $name, url: $url}';
  }
}

EventRepo _$EventRepoFromJson(Map<String, dynamic> json) {
  return EventRepo(
    id: json['id'] as int,
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$EventRepoToJson(EventRepo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
    };
