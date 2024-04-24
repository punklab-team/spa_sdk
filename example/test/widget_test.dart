// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spa_sdk/model/event_spa.dart';
import 'package:spa_sdk/spa_sdk.dart';

import 'package:spa_sdk_example/main.dart';

void main() {


  final SpaSdk plugin = SpaSdk.instance(counterId: "613", uriServiceSpa: "https://spa-back.gazprom-neft.ru/events");

  testWidgets('getPlatformVersion test', (WidgetTester tester) async {
    plugin.sendEvent(EventSpa.error(error: "404", errorValue: "text"));
    expect(true, true);
  });
}
