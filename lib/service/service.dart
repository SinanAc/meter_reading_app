import 'package:hive_flutter/hive_flutter.dart';
import 'package:meter_reading_app/model/data_model.dart';

class MeterDataService {
  // ===>>> LOCAL DB NAME
  final String meterDbName = 'meter_db';
  
  // ===>>> SINGLETON
  MeterDataService._internal();
  static MeterDataService instance = MeterDataService._internal();
  factory MeterDataService() {
    return instance;
  }

  // ===>>> ADD METHOD
  Future<void> addMeterData(MeterDataModel value) async {
    final meterDataDb = await Hive.openBox<MeterDataModel>(meterDbName);
    meterDataDb.put(value.id, value);
    getAllData();
  }

  // ===>>> EDIT METHOD
  Future<void> editMeterData({required data, required id}) async {
    final transactionDB = await Hive.openBox<MeterDataModel>(meterDbName);
    transactionDB.put(id, data);
    getAllData();
  }

  // ===>>> TO GET ALL DATA
  Future<List<MeterDataModel>> getAllData() async {
    final meterDataDb = await Hive.openBox<MeterDataModel>(meterDbName);
    return meterDataDb.values.toList();
  }
}
