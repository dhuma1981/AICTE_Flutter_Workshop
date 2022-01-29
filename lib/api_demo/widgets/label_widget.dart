import 'package:flutter/material.dart';
import 'package:flutter_application_demo_1/api_demo_mobx/store/data_store.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    Key? key,
    this.title = '',
    this.value = '',
    this.buttonLabel = '',
    required this.dataStore,
  }) : super(key: key);

  final String title;
  final String value;
  final String buttonLabel;
  final DataStore dataStore;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(title),
          Text(value),
          getCoolWidget(buttonLabel),
        ],
      ),
    );
  }

  Widget getCoolWidget(String buttonLabel) {
    return Builder(builder: (context) {
      return ElevatedButton(
        onPressed: () {
          dataStore.filterData(buttonLabel);
          //Provider.of<DataStore>(context, listen: false).filterData(buttonLabel);
        },
        child: Text('Total $buttonLabel'),
      );
    });
  }
}
