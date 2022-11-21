import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meter_reading_app/model/data_model.dart';
import 'package:meter_reading_app/view/screens/edit_screen.dart';
import 'package:meter_reading_app/view/widgets/text_widget.dart';

class MainCard extends StatelessWidget {
  const MainCard({Key? key, required this.data, required this.idx})
      : super(key: key);
  final MeterDataModel data;
  final int idx;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => EditScreen(data: data),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget('# $idx'),
              const SizedBox(height: 5),
              TextWidget('Meter ID: ${data.meterId}'),
              const SizedBox(height: 5),
              TextWidget('Meter Number: ${data.meterNumber}'),
              const SizedBox(height: 5),
              TextWidget(
                  'Last read date: ${DateFormat.yMMMMd().format(data.lastReadDate ?? DateTime.now())}'),
            ],
          ),
        ),
      ),
    );
  }
}
