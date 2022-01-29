import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_demo_1/api_demo/model/api_response.dart';
import 'package:http/http.dart' as http;

class DataProvider extends ChangeNotifier {
  String? _selectedOption;

  Summary? _summary;
  List<Regional>? _regional;
  bool _fetchingData = false;

  get summary => _summary;
  get regional => _regional;
  get fetchingData => _fetchingData;
  get selectedOption => _selectedOption;

  void fetchData() async {
    _fetchingData = true;
    notifyListeners();
    final response = await http.get(Uri.parse('https://api.rootnet.in/covid19-in/stats/latest'));
    debugPrint("GET RESPIONSE ${response.body}");
    final jsonResponse = jsonDecode(response.body);
    ApiResponse apiResponse = ApiResponse.fromJson(jsonResponse);
    _summary = apiResponse.data?.summary;
    _regional = apiResponse.data?.regional;
    debugPrint("GET RESPIONSE $apiResponse");
    _fetchingData = false;
    notifyListeners();
  }

  void filterData(String value) {
    _selectedOption = value;
    notifyListeners();
  }
}
