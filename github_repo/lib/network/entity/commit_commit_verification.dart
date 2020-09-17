import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CommitCommitVerification {
  bool verified;
  String reason;
  dynamic signature;
  dynamic payload;

  CommitCommitVerification(
      {this.verified, this.reason, this.signature, this.payload});

  factory CommitCommitVerification.fromJson(Map<String, dynamic> json) =>
      _$CommitCommitVerificationFromJson(json);

  Map<String, dynamic> toJson() => _$CommitCommitVerificationToJson(this);

  @override
  String toString() {
    return '{verified: $verified, reason: $reason, signature: $signature, payload: $payload}';
  }
}

CommitCommitVerification _$CommitCommitVerificationFromJson(
    Map<String, dynamic> json) {
  return CommitCommitVerification(
    verified: json['verified'] as bool,
    reason: json['reason'] as String,
    signature: json['signature'],
    payload: json['payload'],
  );
}

Map<String, dynamic> _$CommitCommitVerificationToJson(
        CommitCommitVerification instance) =>
    <String, dynamic>{
      'verified': instance.verified,
      'reason': instance.reason,
      'signature': instance.signature,
      'payload': instance.payload,
    };
