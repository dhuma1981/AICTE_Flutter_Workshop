import 'package:flutter/material.dart';
import 'package:flutter_application_demo_1/api_demo/provider/DataProvider.dart';
import 'package:provider/provider.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    Key? key,
    this.title = '',
    this.value = '',
    this.buttonLabel = '',
  }) : super(key: key);

  final String title;
  final String value;
  final String buttonLabel;

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
          Provider.of<DataProvider>(context, listen: false).filterData(buttonLabel);
        },
        child: Text('Total $buttonLabel'),
      );
    });
  }
}
