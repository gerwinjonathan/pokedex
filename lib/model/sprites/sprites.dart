import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sprites.freezed.dart';
part 'sprites.g.dart';

@freezed
class Sprites with _$Sprites {
  @JsonSerializable(explicitToJson: true)
  const factory Sprites(
      {String? back_default,
      String? back_female,
      String? back_shiny,
      String? back_shiny_female,
      String? front_default,
      String? front_female,
      String? front_shiny,
      String? front_shiny_female}) = _Sprites;
  factory Sprites.fromJson(Map<String, Object?> json) =>
      _$SpritesFromJson(json);
}
