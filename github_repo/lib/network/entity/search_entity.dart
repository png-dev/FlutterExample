import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SearchEntity {
  @JsonKey(name: 'total_count')
  int totalCount;
  @JsonKey(name: 'incomplete_results')
  bool incompleteResults;
  List<dynamic> items;

  SearchEntity({this.totalCount, this.incompleteResults, this.items});

  factory SearchEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchEntityToJson(this);

  @override
  String toString() {
    return '{totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items}';
  }
}

SearchEntity _$SearchEntityFromJson(Map<String, dynamic> json) {
  return SearchEntity(
    totalCount: json['total_count'] as int,
    incompleteResults: json['incomplete_results'] as bool,
    items: json['items'] as List,
  );
}

Map<String, dynamic> _$SearchEntityToJson(SearchEntity instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };
