import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meter_reading_app/model/data_model.dart';

class HomeController extends ChangeNotifier {
  // ===>>> LIST OF FULL DATA
  final List<MeterDataModel> meterDataList = [];

  // ===>>> INIT METHOD
  Future<void>onInit() async {
    final meterDataDb = await Hive.openBox<MeterDataModel>('meter_db');
    meterDataList.clear();
    meterDataList.addAll(meterDataDb.values);
  }

  // ===>>> ADD ALL DATA TO THE EXISTING LIST
  void addAllMeterData({required List<MeterDataModel> data}) {
    meterDataList.clear();
    meterDataList.addAll(data);
    notifyListeners();
  }
}
