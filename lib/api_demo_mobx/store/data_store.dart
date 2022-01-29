import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_demo_1/api_demo/model/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'data_store.g.dart';

class DataStore = _DataStore with _$DataStore;

abstract class _DataStore with Store {
  @observable
  bool fetchingData = false;

  @observable
  Summary? summary;

  @observable
  List<Regional>? regional;

  @observable
  String? selectedOption;

  @action
  Future<void> fetchData() async {
    fetchingData = true;

    final response = await http.get(Uri.parse('https://api.rootnet.in/covid19-in/stats/latest'));
    debugPrint("GET RESPIONSE ${response.body}");
    final jsonResponse = jsonDecode(response.body);
    ApiResponse apiResponse = ApiResponse.fromJson(jsonResponse);
    summary = apiResponse.data?.summary;
    regional = apiResponse.data?.regional;
    debugPrint("GET RESPIONSE $apiResponse");
    fetchingData = false;
  }

  @action
  void filterData(String value) {
    selectedOption = value;
  }
}
