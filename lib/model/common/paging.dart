import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'paging.freezed.dart';
part 'paging.g.dart';

@freezed
class Paging with _$Paging {
  @JsonSerializable(explicitToJson: true)
  const factory Paging({int? count, String? next, String? previous}) = _Paging;
  factory Paging.fromJson(Map<String, Object?> json) => _$PagingFromJson(json);
}
