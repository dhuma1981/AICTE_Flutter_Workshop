// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DataStore on _DataStore, Store {
  final _$fetchingDataAtom = Atom(name: '_DataStore.fetchingData');

  @override
  bool get fetchingData {
    _$fetchingDataAtom.reportRead();
    return super.fetchingData;
  }

  @override
  set fetchingData(bool value) {
    _$fetchingDataAtom.reportWrite(value, super.fetchingData, () {
      super.fetchingData = value;
    });
  }

  final _$summaryAtom = Atom(name: '_DataStore.summary');

  @override
  Summary? get summary {
    _$summaryAtom.reportRead();
    return super.summary;
  }

  @override
  set summary(Summary? value) {
    _$summaryAtom.reportWrite(value, super.summary, () {
      super.summary = value;
    });
  }

  final _$regionalAtom = Atom(name: '_DataStore.regional');

  @override
  List<Regional>? get regional {
    _$regionalAtom.reportRead();
    return super.regional;
  }

  @override
  set regional(List<Regional>? value) {
    _$regionalAtom.reportWrite(value, super.regional, () {
      super.regional = value;
    });
  }

  final _$selectedOptionAtom = Atom(name: '_DataStore.selectedOption');

  @override
  String? get selectedOption {
    _$selectedOptionAtom.reportRead();
    return super.selectedOption;
  }

  @override
  set selectedOption(String? value) {
    _$selectedOptionAtom.reportWrite(value, super.selectedOption, () {
      super.selectedOption = value;
    });
  }

  final _$fetchDataAsyncAction = AsyncAction('_DataStore.fetchData');

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  final _$_DataStoreActionController = ActionController(name: '_DataStore');

  @override
  void filterData(String value) {
    final _$actionInfo =
        _$_DataStoreActionController.startAction(name: '_DataStore.filterData');
    try {
      return super.filterData(value);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchingData: ${fetchingData},
summary: ${summary},
regional: ${regional},
selectedOption: ${selectedOption}
    ''';
  }
}
