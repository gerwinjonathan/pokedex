import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'types.freezed.dart';
part 'types.g.dart';

@freezed
class Types with _$Types {
  @JsonSerializable(explicitToJson: true)
  const factory Types({String? name, String? url}) = _Types;
  factory Types.fromJson(Map<String, Object?> json) => _$TypesFromJson(json);
}

@HiveType(typeId: 0)
class TypesHive extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? url;

  @HiveField(2)
  String? color;

  @HiveField(3)
  String? urlSprites;

  @HiveField(4)
  dynamic elements;

  TypesHive({this.name, this.url, this.color, this.urlSprites, this.elements});

  Map toJson() => {
        "name": name,
        "url": url,
        "color": color,
        "urlSprites": urlSprites,
        "elements": elements
      };
}
