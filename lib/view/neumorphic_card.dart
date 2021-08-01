import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicCard extends StatelessWidget {
  final String header;
  final String firstSubTitle;
  final String secondSubTite;
  final IconData icon;
  const NeumorphicCard({
    Key key,
    @required this.backColor,
    this.header,
    this.firstSubTitle,
    this.secondSubTite,
    this.icon,
  }) : super(key: key);

  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Neumorphic(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
        style: NeumorphicStyle(
          depth: 5,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(10),
          ),
          color: backColor,
        ),
        child: Card(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    header,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          letterSpacing: 1.5,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      text: firstSubTitle,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                      children: [
                        TextSpan(
                          text: secondSubTite,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              NeumorphicIcon(
                icon,
                size: 25,
                style: NeumorphicStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
