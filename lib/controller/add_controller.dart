// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meter_reading_app/controller/home_controller.dart';
import 'package:meter_reading_app/model/data_model.dart';
import 'package:meter_reading_app/service/service.dart';
import 'package:meter_reading_app/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AddController extends ChangeNotifier {
  // ===>>> VARIABLES
  GlobalKey<FormState> addDataFormKey = GlobalKey<FormState>();
  final meterIdController = TextEditingController();
  final meterNumberController = TextEditingController();
  final meterNameController = TextEditingController();
  final serialNumController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String image = '';
  String imageToString = '';

  // ===>>> INIT METHOD
  void onInit() {
    image = '';
    meterIdController.clear();
    meterNumberController.clear();
    meterNameController.clear();
    serialNumController.clear();
    selectedDate = DateTime.now();
  }

  // ===>>> ON SUBMIT BUTTON
  Future<void> onSubmitButton(context) async {
    if (addDataFormKey.currentState!.validate()) {
      final data = MeterDataModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        meterId: int.parse(meterIdController.text.trim()),
        meterNumber: meterNumberController.text.trim(),
        meterName: meterNameController.text.trim(),
        serialNumber: serialNumController.text.trim(),
        lastReadDate: selectedDate,
        image: image,
      );
      await MeterDataService.instance.addMeterData(data);
      final dataList = await MeterDataService.instance.getAllData();
      Provider.of<HomeController>(context, listen: false)
          .addAllMeterData(data: dataList);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        ),
      );
    }
  }

  // ===>>> TO SELECT DATE
  Future<void> selectDate(context) async {
    final _selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (_selectedDate == null) {
      return;
    } else {
      selectedDate = _selectedDate;
      notifyListeners();
    }
  }

  // ===>>> TO TAKE PHOTO
  Future<void> pickImage() async {
    final selectedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (selectedImage == null) {
      return;
    } else {
      final imageTemporary = File(selectedImage.path).readAsBytesSync();
      imageToString = base64Encode(imageTemporary);
      image = imageToString;
      notifyListeners();
    }
  }
}
