import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'stat.freezed.dart';
part 'stat.g.dart';

@freezed
class Stat with _$Stat {
  @JsonSerializable(explicitToJson: true)
  const factory Stat({String? name, String? url}) = _Stat;
  factory Stat.fromJson(Map<String, Object?> json) => _$StatFromJson(json);
}
