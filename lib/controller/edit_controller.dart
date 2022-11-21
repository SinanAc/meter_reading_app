import 'package:flutter/material.dart';
import 'package:meter_reading_app/controller/home_controller.dart';
import 'package:meter_reading_app/model/data_model.dart';
import 'package:meter_reading_app/service/service.dart';
import 'package:meter_reading_app/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

class EditController extends ChangeNotifier {
  // ===>>> VARIABLES
  GlobalKey<FormState> editDataFormKey = GlobalKey<FormState>();
  final meterIdController = TextEditingController();
  final meterNumberController = TextEditingController();
  final meterNameController = TextEditingController();
  final serialNumController = TextEditingController();
  DateTime date = DateTime.now();
  String image = '';

  // ===>>> INIT METHOD
  void onInit(MeterDataModel data) {
    meterIdController.text = data.meterId.toString();
    meterNumberController.text = data.meterNumber ?? '';
    meterNameController.text = data.meterName ?? '';
    serialNumController.text = data.serialNumber ?? '';
    date = data.lastReadDate ?? DateTime.now();
    image = data.image ?? '';
  }

  // ===>>> ON SUBMIT CHANGES BUTTON
  Future<void> onSubmitChangesButton(context, String id) async {
    if (editDataFormKey.currentState!.validate()) {
      final data = MeterDataModel(
        id: '',
        meterId: int.parse(meterIdController.text.trim()),
        meterNumber: meterNumberController.text.trim(),
        meterName: meterNameController.text.trim(),
        serialNumber: serialNumController.text.trim(),
        lastReadDate: date,
        image: image,
      );
      await MeterDataService.instance.editMeterData(data: data, id: id);
      final List<MeterDataModel> dataList =
          await MeterDataService.instance.getAllData();
      Provider.of<HomeController>(context, listen: false)
          .addAllMeterData(data: dataList);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const HomeScreen()));
    }
  }
}
