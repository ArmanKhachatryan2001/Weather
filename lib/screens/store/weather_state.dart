import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import '../models/weather_data.dart';
import '../models/weather_model.dart';
part 'weather_state.g.dart';

class WeatherState = _WeatherState with _$WeatherState;

abstract class _WeatherState with Store {

  @observable
  WeatherData client = WeatherData();

  @observable
  WeatherModel? data;

  @observable
  double _latitude = 40.2079507;

  @observable
  double _longitude = 44.5298658;

  @observable
  ScrollController scrollController = ScrollController();

  @observable
  bool isLoading = true;

  @observable
  int currentIndex = 0;

  @action
  void setLatitude(double latitude) {
    _latitude = latitude;
  }

  @action
  void setLongitude(double longitude) {
    _longitude = longitude;
  }

  @action
  Future<void> fetchData() async {
    isLoading = true;
    data = await client.getData(_latitude, _longitude);
    isLoading = false;
  }

  @action
  void setCurrentIndex(int index) {
    currentIndex = index;
  }

  @action
  List<String>? getDataForIndex(int index) {
    if (index == 0) {
      data?.listDays[index][0] = data!.temp.toInt().toString();
      data?.listDays[index][1] = data?.icon;
    }
    return data?.listDays[index];
  }
}
