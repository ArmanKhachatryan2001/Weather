import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:weather/location/maps_page.dart';
import '../store/weather_state.dart';
import '../widgets/get_color.dart';
import 'days.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM').format(dayInfo);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherState _weatherState;

  @override
  void initState() {
    super.initState();
    _weatherState = WeatherState();
    _weatherState.fetchData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_weatherState.scrollController.hasClients) {
        _weatherState.scrollController.animateTo(
          _weatherState.scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _weatherState.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String color = '${_weatherState.data?.condition}';

    return Scaffold(
      backgroundColor: const Color(0xFFE8FCFF),
      body: Observer(
        builder: (context) {
          if (_weatherState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.70,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: GetColor.getColor(
                        '${_weatherState.data?.condition}',
                      ),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 80,
                            ),
                            const SizedBox(
                              child: Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFFE8FCFF),
                                size: 20,
                              ),
                            ),
                            Text(
                              '${_weatherState.data?.country}, ${_weatherState.data?.cityName}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Color(0xFFE8FCFF),
                                fontSize: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MapsPage(
                                      onLocationSelected: (
                                        double latitude,
                                        double longitude,
                                      ) {
                                        _weatherState.setLatitude(latitude);
                                        _weatherState.setLongitude(longitude);
                                      },
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xFFE8FCFF),
                                size: 23,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.more_vert,
                              color: Color(0xFFE8FCFF),
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${_weatherState.data?.temp?.toInt()}°C',
                                  style: const TextStyle(
                                    color: Color(0xFFE8FCFF),
                                    fontSize: 80,
                                  ),
                                ),
                                Image.network(
                                  'https:${_weatherState.data?.icon}',
                                  width: size.width * 0.4,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  '${_weatherState.data?.condition}',
                                  style: const TextStyle(
                                    color: Color(0xFFE8FCFF),
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  dateFormat.split(',')[0],
                                  style: const TextStyle(
                                    color: Color(0xFFE8FCFF),
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '${_weatherState.data?.date?.split(' ')[0].split('-').reversed.join('/')}',
                                  style: const TextStyle(
                                    color: Color(0xFFE8FCFF),
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.fiber_manual_record_rounded,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.fiber_manual_record_outlined,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.fiber_manual_record_outlined,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '${_weatherState.data?.listDays.length} Days',
                        style: const TextStyle(
                          color: Color(0xff48738D),
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        weight: 10,
                        color: Color(0xff48738D),
                        size: 16,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    height: 150,
                    child: Scrollbar(
                      isAlwaysShown: true,
                      controller: _weatherState.scrollController,
                      child: ListView.builder(
                        controller: _weatherState.scrollController,
                        scrollDirection: Axis.horizontal,
                        reverse: false,
                        itemCount: _weatherState.data?.listDays.length,
                        itemBuilder: (BuildContext context, int index) {
                          var currentDate = dayInfo.add(
                            Duration(days: index),
                          );
                          var dateFormat =
                              DateFormat('EEEE, d MMM').format(currentDate);
                          var dayData = _weatherState.getDataForIndex(index);
                          return Days(
                            dateFormat: dateFormat,
                            data: dayData,
                            size: size,
                            colors: color,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
