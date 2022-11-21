import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meter_reading_app/controller/add_controller.dart';
import 'package:meter_reading_app/view/widgets/text_field_widget.dart';
import 'package:meter_reading_app/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final addController = context.read<AddController>();
    addController.onInit();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add details'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: addController.addDataFormKey,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        await addController.pickImage();
                      },
                      child: Stack(
                        children: [
                          Selector<AddController, String>(
                            selector: (_, provider) => provider.image,
                            builder: (_, img, __) => CircleAvatar(
                              backgroundColor:Colors.blue,
                              radius: 50,
                              backgroundImage: img.isEmpty
                                  ?  const AssetImage('assets/dummy_img.png') as ImageProvider:
                                   MemoryImage(
                                        const Base64Decoder().convert(img)),
                            ),
                          ),
                          const Positioned(
                            bottom: 0,
                            right: 10,
                            child: Icon(
                              Icons.camera_alt,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      hintText: 'Meter ID',
                      controller: addController.meterIdController,
                    ),
                    const SizedBox(height: 15),
                    TextFieldWidget(
                      hintText: 'Meter Number',
                      controller: addController.meterNumberController,
                    ),
                    const SizedBox(height: 15),
                    TextFieldWidget(
                      hintText: 'Meter Name',
                      controller: addController.meterNameController,
                    ),
                    const SizedBox(height: 15),
                    TextFieldWidget(
                      hintText: 'Serial Number',
                      controller: addController.serialNumController,
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 58,
                      child: GestureDetector(
                        onTap: () async {
                          addController.selectDate(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.9,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.grey,
                                size: 23,
                              ),
                              const SizedBox(width: 10),
                              Selector<AddController, DateTime>(
                                selector: (_, p) => p.selectedDate,
                                builder: (_, date, __) => Text(
                                  DateFormat.yMMMMd().format(date),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          addController.addDataFormKey.currentState!.validate();
                          addController.onSubmitButton(context);
                        },
                        child:  Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextWidget('Submit'),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
