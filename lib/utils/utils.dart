import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

void changeStatusBarColor(Color color) async {
  await FlutterStatusbarcolor.setStatusBarColor(color);
  if (useWhiteForeground(color)) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  } else {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  }
}
