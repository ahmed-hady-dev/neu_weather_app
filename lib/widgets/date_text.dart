import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateText extends StatelessWidget {
  const DateText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateTimeNow = DateTime.now();
    var formatedDate = DateFormat.yMMMMEEEEd().format(dateTimeNow);
    return Center(
      child: Text(
        formatedDate,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontWeight: FontWeight.w500, letterSpacing: 1.0),
      ),
    );
  }
}
