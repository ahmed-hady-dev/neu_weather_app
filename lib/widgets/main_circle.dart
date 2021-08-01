import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MainCircle extends StatelessWidget {
  final String temperature;
  final String mainWeather;
  const MainCircle({
    Key key,
    @required this.backColor,
    this.temperature, this.mainWeather,
  }) : super(key: key);

  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.shortestSide * 0.9,
      child: Neumorphic(
        // padding: EdgeInsets.symmetric(vertical: 20),
        margin: EdgeInsets.symmetric(vertical: 20),
        style: NeumorphicStyle(
          depth: 10,
          boxShape: NeumorphicBoxShape.circle(),
          color: backColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          overflow: Overflow.clip,
          children: [
            Neumorphic(
              margin: EdgeInsets.all(30),
              style: NeumorphicStyle(
                depth: -100,
                boxShape: NeumorphicBoxShape.circle(),
                intensity: 1,
              ),
              child: Image.asset(
                'assets/images/rain.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(55),
              child: Neumorphic(
                style: NeumorphicStyle(
                  depth: 10,
                  boxShape: NeumorphicBoxShape.circle(),
                  intensity: 0.6,
                  color: backColor,
                ),
                child: buildInnerText(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildInnerText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              "$temperature°",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontSize: 60, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            mainWeather,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 1.0),
          ),
        ),
      ],
    );
  }
}
