import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CommitCommitAuthor {
  String name;
  String email;
  String date;

  CommitCommitAuthor({this.name, this.email, this.date});

  factory CommitCommitAuthor.fromJson(Map<String, dynamic> json) =>
      _$CommitCommitAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$CommitCommitAuthorToJson(this);

  @override
  String toString() {
    return '{name: $name, email: $email, date: $date}';
  }
}

CommitCommitAuthor _$CommitCommitAuthorFromJson(Map<String, dynamic> json) {
  return CommitCommitAuthor(
    name: json['name'] as String,
    email: json['email'] as String,
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$CommitCommitAuthorToJson(CommitCommitAuthor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'date': instance.date,
    };
