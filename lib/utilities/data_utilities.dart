import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
Widget loading() {
  return Container(
    padding: EdgeInsets.only(top: 16, bottom: 16),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget noData() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text("no Data Avaiable !!!"),
  );
}

Widget error(var error) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text(error.toString()),
  );
}

Widget ConnectioError() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text("Connection Error!!!"),
  );
}

String parseHumanDateTime(String datetime) {
  Duration time = DateTime.now().difference(DateTime.parse(datetime));
  DateTime thedifference = DateTime.now().subtract(time);
  return timeago.format(thedifference);
}