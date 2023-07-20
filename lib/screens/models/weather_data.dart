import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/screens/models/weather_model.dart';

class WeatherData {
  Future<WeatherModel> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=826c9027937f46f19d9110142232007&q=${latitude},${longitude}&days=7&aqi=no&alerts=yes');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);

    return WeatherModel.fromJson(body);
  }
}
