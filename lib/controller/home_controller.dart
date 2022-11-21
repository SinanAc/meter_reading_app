import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meter_reading_app/model/data_model.dart';

class HomeController extends ChangeNotifier {
  final List<MeterDataModel> meterDataList = [];
  Future<void>onInit() async {
    final meterDataDb = await Hive.openBox<MeterDataModel>('meter_db');
    meterDataList.clear();
    meterDataList.addAll(meterDataDb.values);
  }
  void addAllMeterData({required List<MeterDataModel> data}) {
    meterDataList.clear();
    meterDataList.addAll(data);
    notifyListeners();
  }
}
