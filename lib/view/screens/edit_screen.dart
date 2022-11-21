import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meter_reading_app/controller/edit_controller.dart';
import 'package:meter_reading_app/model/data_model.dart';
import 'package:meter_reading_app/view/widgets/text_field_widget.dart';
import 'package:meter_reading_app/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key, required this.data}) : super(key: key);
  final MeterDataModel data;
  @override
  Widget build(BuildContext context) {
    final editController = context.read<EditController>();
    editController.onInit(data);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit details'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: editController.editDataFormKey,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 100,
                      backgroundImage: data.image == null || data.image!.isEmpty
                          ? const AssetImage('assets/dummy_img.png')
                              as ImageProvider
                          : MemoryImage(
                              const Base64Decoder().convert(data.image ?? '')),
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      hintText: 'Meter ID',
                      controller: editController.meterIdController,
                    ),
                    const SizedBox(height: 15),
                    TextFieldWidget(
                      hintText: 'Meter Number',
                      controller: editController.meterNumberController,
                    ),
                    const SizedBox(height: 15),
                    TextFieldWidget(
                      hintText: 'Meter Name',
                      controller: editController.meterNameController,
                    ),
                    const SizedBox(height: 15),
                    TextFieldWidget(
                      hintText: 'Serial Number',
                      controller: editController.serialNumController,
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                        onPressed: () {
                          editController.editDataFormKey.currentState!
                              .validate();
                          editController.onSubmitChangesButton(
                              context, data.id ?? '');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextWidget('Submit Changes'),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
