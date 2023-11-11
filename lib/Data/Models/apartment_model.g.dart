// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApartmentModelAdapter extends TypeAdapter<ApartmentModel> {
  @override
  final int typeId = 1;

  @override
  ApartmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ApartmentModel(
      place: fields[0] as String,
      price: fields[1] as String,
      rating: fields[2] as String,
      image: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ApartmentModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.place)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApartmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
