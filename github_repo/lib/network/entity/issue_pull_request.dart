import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class IssuePullRequest {
  String url;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  @JsonKey(name: 'diff_url')
  String diffUrl;
  @JsonKey(name: 'patch_url')
  String patchUrl;

  IssuePullRequest({this.url, this.htmlUrl, this.diffUrl, this.patchUrl});

  factory IssuePullRequest.fromJson(Map<String, dynamic> json) =>
      _$IssuePullRequestFromJson(json);

  Map<String, dynamic> toJson() => _$IssuePullRequestToJson(this);

  @override
  String toString() {
    return '{url: $url, htmlUrl: $htmlUrl, diffUrl: $diffUrl, patchUrl: $patchUrl}';
  }
}

IssuePullRequest _$IssuePullRequestFromJson(Map<String, dynamic> json) {
  return IssuePullRequest(
    url: json['url'] as String,
    htmlUrl: json['html_url'] as String,
    diffUrl: json['diff_url'] as String,
    patchUrl: json['patch_url'] as String,
  );
}

Map<String, dynamic> _$IssuePullRequestToJson(IssuePullRequest instance) =>
    <String, dynamic>{
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'diff_url': instance.diffUrl,
      'patch_url': instance.patchUrl,
    };
