import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RepoPermissions {
  bool pull;
  bool admin;
  bool push;

  RepoPermissions({this.pull, this.admin, this.push});

  factory RepoPermissions.fromJson(Map<String, dynamic> json) =>
      _$RepoPermissionsFromJson(json);

  Map<String, dynamic> toJson() => _$RepoPermissionsToJson(this);

  @override
  String toString() {
    return '{pull: $pull, admin: $admin, push: $push}';
  }
}

RepoPermissions _$RepoPermissionsFromJson(Map<String, dynamic> json) {
  return RepoPermissions(
    pull: json['pull'] as bool,
    admin: json['admin'] as bool,
    push: json['push'] as bool,
  );
}

Map<String, dynamic> _$RepoPermissionsToJson(RepoPermissions instance) =>
    <String, dynamic>{
      'pull': instance.pull,
      'admin': instance.admin,
      'push': instance.push,
    };
