// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherState on _WeatherState, Store {
  late final _$clientAtom =
      Atom(name: '_WeatherState.client', context: context);

  @override
  WeatherData get client {
    _$clientAtom.reportRead();
    return super.client;
  }

  @override
  set client(WeatherData value) {
    _$clientAtom.reportWrite(value, super.client, () {
      super.client = value;
    });
  }

  late final _$dataAtom = Atom(name: '_WeatherState.data', context: context);

  @override
  WeatherModel? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(WeatherModel? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$_latitudeAtom =
      Atom(name: '_WeatherState._latitude', context: context);

  @override
  double get _latitude {
    _$_latitudeAtom.reportRead();
    return super._latitude;
  }

  @override
  set _latitude(double value) {
    _$_latitudeAtom.reportWrite(value, super._latitude, () {
      super._latitude = value;
    });
  }

  late final _$_longitudeAtom =
      Atom(name: '_WeatherState._longitude', context: context);

  @override
  double get _longitude {
    _$_longitudeAtom.reportRead();
    return super._longitude;
  }

  @override
  set _longitude(double value) {
    _$_longitudeAtom.reportWrite(value, super._longitude, () {
      super._longitude = value;
    });
  }

  late final _$scrollControllerAtom =
      Atom(name: '_WeatherState.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_WeatherState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_WeatherState.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_WeatherState.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  late final _$_WeatherStateActionController =
      ActionController(name: '_WeatherState', context: context);

  @override
  void setLatitude(double latitude) {
    final _$actionInfo = _$_WeatherStateActionController.startAction(
        name: '_WeatherState.setLatitude');
    try {
      return super.setLatitude(latitude);
    } finally {
      _$_WeatherStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLongitude(double longitude) {
    final _$actionInfo = _$_WeatherStateActionController.startAction(
        name: '_WeatherState.setLongitude');
    try {
      return super.setLongitude(longitude);
    } finally {
      _$_WeatherStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentIndex(int index) {
    final _$actionInfo = _$_WeatherStateActionController.startAction(
        name: '_WeatherState.setCurrentIndex');
    try {
      return super.setCurrentIndex(index);
    } finally {
      _$_WeatherStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<String>? getDataForIndex(int index) {
    final _$actionInfo = _$_WeatherStateActionController.startAction(
        name: '_WeatherState.getDataForIndex');
    try {
      return super.getDataForIndex(index);
    } finally {
      _$_WeatherStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
client: ${client},
data: ${data},
scrollController: ${scrollController},
isLoading: ${isLoading},
currentIndex: ${currentIndex}
    ''';
  }
}
