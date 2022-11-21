import 'package:hive_flutter/hive_flutter.dart';
import 'package:meter_reading_app/model/data_model.dart';

class MeterDataService {
  final String meterDbName = 'meter_db';
  MeterDataService._internal();
  static MeterDataService instance = MeterDataService._internal();
  factory MeterDataService() {
    return instance;
  }

  Future<void> addMeterData(MeterDataModel value) async {
    final meterDataDb = await Hive.openBox<MeterDataModel>(meterDbName);
    meterDataDb.put(value.id, value);
    getAllData();
  }

  Future<void> editMeterData({required data, required id}) async {
    final transactionDB = await Hive.openBox<MeterDataModel>(meterDbName);
    transactionDB.put(id, data);
    getAllData();
  }

  Future<List<MeterDataModel>> getAllData() async {
    final meterDataDb = await Hive.openBox<MeterDataModel>(meterDbName);
    return meterDataDb.values.toList();
  }
}
