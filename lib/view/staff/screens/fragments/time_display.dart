import 'package:beerbox/utils/time_utils.dart';
import 'package:beerbox/view/custom_theme.dart';
import 'package:flutter/cupertino.dart';

class TimeDisplay extends StatelessWidget {

  final DateTime time;

  final TextStyle minuteStyle;
  final TextStyle secondStyle;

  const TimeDisplay({Key? key,
    required this.time,
    this.minuteStyle = const TextStyle(),
    this.secondStyle = const TextStyle()}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = getDisplayColor(time);

    TextStyle ss = secondStyle.apply(color: color);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(time.minute.toString().padLeft(2, '0'), style: minuteStyle.apply(color: color)),
        Text(":", style: ss),
        Text(time.second.toString().padLeft(2, '0'), style: ss),
      ],
    );
  }

  Color getDisplayColor(DateTime time) {
    if (veryShortTime.isAfter(time)) return CustomTheme.trafficLight[0];
    if (shortTime.isAfter(time)) return CustomTheme.trafficLight[1];
    if (someTime.isAfter(time)) return CustomTheme.trafficLight[2];
    if (longTime.isAfter(time)) return CustomTheme.trafficLight[3];
    if (veryLongTime.isAfter(time)) return CustomTheme.trafficLight[4];
    return CustomTheme.trafficLight[5];
  }
}
