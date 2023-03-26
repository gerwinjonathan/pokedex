import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:stocks/model/stats/stat.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

@freezed
class Stats with _$Stats {
  @JsonSerializable(explicitToJson: true)
  const factory Stats({double? base_stat, double? effort, Stat? stat}) = _Stats;
  factory Stats.fromJson(Map<String, Object?> json) => _$StatsFromJson(json);
}
