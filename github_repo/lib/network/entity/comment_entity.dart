import 'package:github_repo/network/entity/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CommentEntity {
  int id;
  @JsonKey(name: 'node_id')
  String noteId;
  String body;
  UserEntity user;
  @JsonKey(name: 'author_association')
  String authorAssociation;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;

  CommentEntity(
      {this.id,
      this.noteId,
      this.body,
      this.user,
      this.authorAssociation,
      this.createdAt,
      this.updatedAt});

  factory CommentEntity.fromJson(Map<String, dynamic> json) =>
      _$CommentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommentEntityToJson(this);

  @override
  String toString() {
    return '{id: $id, noteId: $noteId, body: $body, user: $user, authorAssociation: $authorAssociation, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}

CommentEntity _$CommentEntityFromJson(Map<String, dynamic> json) {
  return CommentEntity(
    id: json['id'] as int,
    noteId: json['node_id'] as String,
    body: json['body'] as String,
    user: json['user'] == null
        ? null
        : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
    authorAssociation: json['author_association'] as String,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$CommentEntityToJson(CommentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.noteId,
      'body': instance.body,
      'user': instance.user,
      'author_association': instance.authorAssociation,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
