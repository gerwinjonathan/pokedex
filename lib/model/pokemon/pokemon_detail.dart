import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:stocks/model/sprites/sprites.dart';
import 'package:stocks/model/stats/stats.dart';

part 'pokemon_detail.freezed.dart';
part 'pokemon_detail.g.dart';

@freezed
class PokemonDetail with _$PokemonDetail {
  @JsonSerializable(explicitToJson: true)
  const factory PokemonDetail(
      {int? id,
      String? name,
      double? height,
      Sprites? sprites,
      Stats? stats,
      double? weight}) = _PokemonDetail;
  factory PokemonDetail.fromJson(Map<String, Object?> json) =>
      _$PokemonDetailFromJson(json);
}
