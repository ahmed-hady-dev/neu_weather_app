import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;


import '../widgets/date_text.dart';
import '../widgets/main_circle.dart';
import 'neumorphic_card.dart';

const apiKey = 'e63efa8ff4f00689cead142c5dd59db2';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color backColor = Color(0xFFE9EDF0);
  double latitude;
  double longitude;
  String cityName;
  double temperature;
  String mainWeather;
  double windSpeed;
  int humadity;
  int pressure;
  var cloudiness;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);

      Future getWeather() async {
        http.Response response = await http.get(
            'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey');
        if (response.statusCode == 200) {
          String data = response.body;
          var decodedData = jsonDecode(data);
          setState(() {
            this.cityName = decodedData['name'];
            this.temperature = decodedData['main']['temp'];
            this.mainWeather = decodedData['weather'][0]['main'];
            this.windSpeed = decodedData['wind']['speed'];
            this.humadity = decodedData['main']['humidity'];
            this.pressure = decodedData['main']['pressure'];
            this.cloudiness = decodedData['clouds']['all'];
          });
        } else {
          print(response.statusCode);
          print('something went wrong');
        }
      }

      getWeather();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    this.getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backColor,
        appBar: NeumorphicAppBar(
          title: Text(
            cityName != null ? cityName : 'loading..',
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: 20,
                ),
          ),
          centerTitle: true,
          leading: NeumorphicButton(
            margin: EdgeInsets.all(5),
            onPressed: () {},
            child: Icon(
              Icons.add_rounded,
              size: 30,
            ),
            style: NeumorphicStyle(
              color: Color(0xFFE9EDF0),
              depth: 3,
              intensity: 10,
              shape: NeumorphicShape.flat,
              lightSource: LightSource.right,
            ),
          ),
          actions: [
            NeumorphicButton(
              margin: EdgeInsets.all(5),
              onPressed: () {},
              child: Icon(
                Icons.settings,
                size: 25,
              ),
              style: NeumorphicStyle(
                color: Color(0xFFE9EDF0),
                depth: 3,
                intensity: 10,
                shape: NeumorphicShape.flat,
                lightSource: LightSource.right,
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            DateText(),
            MainCircle(
              backColor: backColor,
              temperature: temperature != null
                  ? temperature.toStringAsFixed(0).toString()
                  : '...',
              mainWeather: mainWeather != null ? mainWeather : 'loading..',
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.065),
              child: Wrap(
                children: [
                  Row(
                    children: [
                      NeumorphicCard(
                        backColor: backColor,
                        header: 'Wind',
                        firstSubTitle: windSpeed != null
                            ? '${windSpeed.toString()} '
                            : 'loading..',
                        secondSubTite: 'km/h',
                        icon: FlutterIcons.air_ent,
                      ),
                      NeumorphicCard(
                        backColor: backColor,
                        header: 'Humadity',
                        firstSubTitle: humadity != null
                            ? "${humadity.toString()} %"
                            : 'loading..',
                        secondSubTite: '',
                        icon: FlutterIcons.drop_sli,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      NeumorphicCard(
                        backColor: backColor,
                        header: 'Pressure',
                        firstSubTitle: pressure != null
                            ? "${pressure.toString()} "
                            : 'loading..',
                        secondSubTite: 'hPa',
                        icon: FlutterIcons.temperature_low_faw5s,
                      ),
                      NeumorphicCard(
                        backColor: backColor,
                        header: 'Cloudiness',
                        firstSubTitle: cloudiness != null
                            ? "${cloudiness.toString()} %"
                            : 'loading..',
                        secondSubTite: '',
                        icon: FlutterIcons.cloud_fea,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
