import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserPlan {
  @JsonKey(name: 'private_repos')
  int privateRepos;
  String name;
  int collaborators;
  int space;

  UserPlan({this.privateRepos, this.name, this.collaborators, this.space});

  factory UserPlan.fromJson(Map<String, dynamic> json) =>
      _$UserPlanFromJson(json);

  Map<String, dynamic> toJson() => _$UserPlanToJson(this);

  @override
  String toString() {
    return '{privateRepos:$privateRepos, name: $name , collaborators:$collaborators, space: $space}';
  }
}

Map<String, dynamic> _$UserPlanToJson(UserPlan instance) => <String, dynamic>{
      'private_repos': instance.privateRepos,
      'name': instance.name,
      'collaborators': instance.collaborators,
      'space': instance.space
    };

UserPlan _$UserPlanFromJson(Map<String, dynamic> json) {
  return UserPlan(
      privateRepos: json['private_repos'] as int,
      name: json['name'] as String,
      collaborators: json['collaborators'] as int,
      space: json['space'] as int);
}
