// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypesHiveAdapter extends TypeAdapter<TypesHive> {
  @override
  final int typeId = 0;

  @override
  TypesHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypesHive(
      name: fields[0] as String?,
      url: fields[1] as String?,
      color: fields[2] as String?,
      urlSprites: fields[3] as String?,
      elements: fields[4] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, TypesHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.urlSprites)
      ..writeByte(4)
      ..write(obj.elements);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypesHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Types _$$_TypesFromJson(Map<String, dynamic> json) => _$_Types(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_TypesToJson(_$_Types instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
