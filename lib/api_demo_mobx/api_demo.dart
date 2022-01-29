import 'package:flutter/material.dart';
import 'package:flutter_application_demo_1/api_demo/model/api_response.dart';
import 'package:flutter_application_demo_1/api_demo/utils/constants.dart';
import 'package:flutter_application_demo_1/api_demo/widgets/label_widget.dart';
import 'package:flutter_application_demo_1/api_demo_mobx/store/data_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

final dataStore = DataStore();

class APIDemoMobx extends StatefulWidget {
  const APIDemoMobx({Key? key}) : super(key: key);

  @override
  State<APIDemoMobx> createState() => _APIDemoMobxState();
}

class _APIDemoMobxState extends State<APIDemoMobx> {
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
  void initState() {
    super.initState();

    autorun((_) {
      final stringValue = dataStore.selectedOption;
      final bool = dataStore.fetchingData;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("AUTO RUN $stringValue")));
    });

    reaction((_) => dataStore.fetchingData, (_) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("WHEN FECTCHING DATA CHAGNES")));
    });
  }

  @override
  Widget build(BuildContext context) {
    dataStore.fetchData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Demo"),
      ),
      body: Observer(
        builder: (context) => dataStore.fetchingData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      LabelWidget(
                        title: optionConfirmed,
                        value: dataStore.summary?.confirmedCasesIndian?.toString() ?? 'N/A',
                        buttonLabel: optionConfirmed,
                        dataStore: dataStore,
                      ),
                      LabelWidget(
                        title: optionCured,
                        value: dataStore.summary?.discharged?.toString() ?? 'N/A',
                        buttonLabel: optionCured,
                        dataStore: dataStore,
                      ),
                      LabelWidget(
                        title: optionDeath,
                        value: dataStore.summary?.deaths?.toString() ?? 'N/A',
                        buttonLabel: optionDeath,
                        dataStore: dataStore,
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.red,
                  ),
                  Center(
                    child: Text(
                      "Showing Data of ${dataStore.selectedOption}",
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
                          title: const Text('No Data found'),
                          subtitle: Text(getNumbersAccordingToSelection(
                            regional: dataStore.regional![index],
                            selectedOption: dataStore.selectedOption ?? optionConfirmed,
                          )),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: Colors.amber,
                        );
                      },
                      itemCount: dataStore.regional?.length ?? 0,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
