// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeterDataModelAdapter extends TypeAdapter<MeterDataModel> {
  @override
  final int typeId = 1;

  @override
  MeterDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeterDataModel(
      id: fields[0] as String?,
      meterId: fields[1] as int?,
      meterNumber: fields[2] as String?,
      meterName: fields[3] as String?,
      serialNumber: fields[4] as String?,
      lastReadDate: fields[5] as DateTime?,
      image: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MeterDataModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.meterId)
      ..writeByte(2)
      ..write(obj.meterNumber)
      ..writeByte(3)
      ..write(obj.meterName)
      ..writeByte(4)
      ..write(obj.serialNumber)
      ..writeByte(5)
      ..write(obj.lastReadDate)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeterDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
