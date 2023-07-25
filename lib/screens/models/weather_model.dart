class WeatherModel {
  var country;
  var cityName;
  var condition;
  var temp;
  var icon;
  var date;
  late List<List<String>> listDays;

  WeatherModel({
    required this.country,
    required this.cityName,
    required this.condition,
    required this.temp,
    required this.icon,
    required this.date,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    listDays = [];
    List<String> tmp;
    var tmpTime = json['location']['localtime'];
    tmpTime = int.parse(tmpTime.split(' ')[1].split(':')[0]);

    int countTime = 0;
    for (var forecastDay in json['forecast']['forecastday']) {
      for (var hour in forecastDay['hour']) {
        if (countTime != tmpTime) {
          ++countTime;
          continue;
        }
        tmp = [];
        temp = hour['temp_c'].toInt();
        icon = hour['condition']['icon'];
        date = hour['time'];
        tmp.add(temp.toString());
        tmp.add(icon);
        tmp.add(date);
        listDays.add(tmp);
        break;
      }
      countTime = 0;
    }
    country = json['location']['country'];
    cityName = json['location']['name'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    icon = json['current']['condition']['icon'];
    date = json['location']['localtime'];
  }
}
