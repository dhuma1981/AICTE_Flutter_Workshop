import 'package:flutter/material.dart';
import 'package:flutter_application_demo_1/api_demo/model/api_response.dart';
import 'package:flutter_application_demo_1/api_demo/provider/DataProvider.dart';
import 'package:flutter_application_demo_1/api_demo/utils/constants.dart';
import 'package:flutter_application_demo_1/api_demo/widgets/label_widget.dart';
import 'package:flutter_application_demo_1/api_demo_mobx/store/data_store.dart';
import 'package:provider/provider.dart';

class APIDemo extends StatelessWidget {
  const APIDemo({Key? key}) : super(key: key);

  String getNumbersAccordingToSelection({
    required Regional regional,
    required String selectedOption,
  }) {
    switch (selectedOption) {
      case optionConfirmed:
        return 'Total Confirmed: ${regional.totalConfirmed ?? 0}';

      case optionCured:
        return 'Total Cured: ${regional.discharged ?? 0}';

      case optionDeath:
        return 'Total Deaths: ${regional.deaths ?? 0}';

      default:
        return 'No Data Available';
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DataStore>(context, listen: false).fetchData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Demo"),
      ),
      body: Consumer<DataProvider>(
        builder: (context, dataProvider, child) => dataProvider.fetchingData
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      LabelWidget(
                        title: optionConfirmed,
                        value: dataProvider.summary?.confirmedCasesIndian?.toString() ?? 'N/A',
                        buttonLabel: optionConfirmed,
                        dataStore: DataStore(),
                      ),
                      LabelWidget(
                        title: optionCured,
                        value: dataProvider.summary?.discharged?.toString() ?? 'N/A',
                        buttonLabel: optionCured,
                        dataStore: DataStore(),
                      ),
                      LabelWidget(
                        title: optionDeath,
                        value: dataProvider.summary?.deaths?.toString() ?? 'N/A',
                        buttonLabel: optionDeath,
                        dataStore: DataStore(),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.red,
                  ),
                  Center(
                    child: Text(
                      "Showing Data of ${dataProvider.selectedOption}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(dataProvider.regional?[index].loc ?? 'No Data found'),
                          subtitle: Text(getNumbersAccordingToSelection(
                            regional: dataProvider.regional![index],
                            selectedOption: dataProvider.selectedOption,
                          )),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: Colors.amber,
                        );
                      },
                      itemCount: dataProvider.regional?.length ?? 0,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
