import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class MeterDataModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  int? meterId;
  @HiveField(2)
  String? meterNumber;
  @HiveField(3)
  String? meterName;
  @HiveField(4)
  String? serialNumber;
  @HiveField(5)
  DateTime? lastReadDate;
  @HiveField(6)
  String? image;
  MeterDataModel({
    this.id,
    required this.meterId,
    required this.meterNumber,
    required this.meterName,
    required this.serialNumber,
    required this.lastReadDate,
    required this.image,
  });
}
