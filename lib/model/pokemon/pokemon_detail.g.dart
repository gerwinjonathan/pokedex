// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokemonDetail _$$_PokemonDetailFromJson(Map<String, dynamic> json) =>
    _$_PokemonDetail(
      id: json['id'] as int?,
      name: json['name'] as String?,
      height: (json['height'] as num?)?.toDouble(),
      sprites: json['sprites'] == null
          ? null
          : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: json['stats'] == null
          ? null
          : Stats.fromJson(json['stats'] as Map<String, dynamic>),
      weight: (json['weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PokemonDetailToJson(_$_PokemonDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'sprites': instance.sprites?.toJson(),
      'stats': instance.stats?.toJson(),
      'weight': instance.weight,
    };
