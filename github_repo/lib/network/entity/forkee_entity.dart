import 'package:json_annotation/json_annotation.dart';

import 'user_entity.dart';

@JsonSerializable()
class ForkeeEntity {
  int id;
  String name;
  @JsonKey(name: 'full_name')
  String fullName;
  bool private;
  UserEntity owner;
  bool fork;

  ForkeeEntity(
      {this.id, this.name, this.fullName, this.private, this.owner, this.fork});

  factory ForkeeEntity.fromJson(Map<String, dynamic> json) =>
      _$ForkeeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ForkeeEntityToJson(this);

  @override
  String toString() {
    return '{id: $id, name: $name, fullName: $fullName, private: $private, owner: $owner, fork: $fork}';
  }
}

ForkeeEntity _$ForkeeEntityFromJson(Map<String, dynamic> json) {
  return ForkeeEntity(
    id: json['id'] as int,
    name: json['name'] as String,
    fullName: json['full_name'] as String,
    private: json['private'] as bool,
    owner: json['owner'] == null
        ? null
        : UserEntity.fromJson(json['owner'] as Map<String, dynamic>),
    fork: json['fork'] as bool,
  );
}

Map<String, dynamic> _$ForkeeEntityToJson(ForkeeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'private': instance.private,
      'owner': instance.owner,
      'fork': instance.fork,
    };
