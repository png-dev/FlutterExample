import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RepoContentLinks {
  String git;
  String self;
  String html;

  RepoContentLinks(this.git, this.self, this.html);

  factory RepoContentLinks.fromJson(Map<String, dynamic> json) =>
      _$RepoContentLinksFromJson(json);

  Map<String, dynamic> toJson() => _$RepoContentLinksToJson(this);

  @override
  String toString() {
    return '{git: $git, self: $self, html: $html}';
  }
}

RepoContentLinks _$RepoContentLinksFromJson(Map<String, dynamic> json) {
  return RepoContentLinks(
    json['git'] as String,
    json['self'] as String,
    json['html'] as String,
  );
}

Map<String, dynamic> _$RepoContentLinksToJson(RepoContentLinks instance) =>
    <String, dynamic>{
      'git': instance.git,
      'self': instance.self,
      'html': instance.html,
    };
