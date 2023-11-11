// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RenterModelAdapter extends TypeAdapter<RenterModel> {
  @override
  final int typeId = 2;

  @override
  RenterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RenterModel(
      name: fields[0] as String,
      id: fields[1] as String,
      image: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RenterModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RenterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
