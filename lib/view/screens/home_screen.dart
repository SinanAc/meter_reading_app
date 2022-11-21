import 'package:flutter/material.dart';
import 'package:meter_reading_app/controller/home_controller.dart';
import 'package:meter_reading_app/model/data_model.dart';
import 'package:meter_reading_app/view/screens/add_screen.dart';
import 'package:meter_reading_app/view/widgets/main_card.dart';
import 'package:meter_reading_app/view/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homeController = context.read<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: FutureBuilder(
        future: homeController.onInit(),
        builder: (_, __) => Selector<HomeController, List<MeterDataModel>>(
          selector: (_, provider) => provider.meterDataList,
          builder: (_, dataList, __) => dataList.isEmpty
              ? Center(
                  child: TextWidget('No data available'),
                )
              : ListView.separated(
                  itemBuilder: (_, index) {
                    return MainCard(data: dataList[index], idx: index + 1);
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: dataList.length),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const AddScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
