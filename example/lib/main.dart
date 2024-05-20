import 'package:flutter/material.dart';
import 'package:spa_sdk/model/event_spa.dart';
import 'package:spa_sdk/spa_sdk.dart';

///flutter: {apiVersion: 1.0, counterId: 613, timestamp: 1715602727, channelType: CustomScript, user_id: null, channelName: RegEvents API, eventCaption: first_open, customparams: [{name: latitude, type: STRING, value: 55.731653129874154}, {name: latitude, type: STRING, value: 52.384645141366974}, {name: osName, type: STRING, value: iOS}, {name: deviceName, type: STRING, value: iPhone}, {name: libraryVersion, type: STRING, value: 0.0.1}, {name: ipAddress, type: STRING, value: none}, {name: deviceId, type: STRING, value: 353A3BE0-A080-4D07-801B-4F6F67004305}, {name: sessionId, type: STRING, value: e7124d0a-bd0c-48ad-80d7-65232c6aa4f9}, {name: osVersion, type: STRING, value: iOS 16.7.2}, {name: appVersion, type: STRING, value: 1.0.0}, {name: appName, type: STRING, value: spa_sdk_example}, {name: platform, type: STRING, value: ios}, {name: language, type: STRING, value: ru}, {name: resolutionWidth, type: STRING, value: 1125.0}, {name: resolutionHeight, type: STRING, value: 2436.0}, {name: timeZone, type: STRING, value: MSK}, {name: previous_gmp_app_id, type: STRING, value: previousGmpAppId}, {name: updated_with_analytics, type: STRING, value: updatedWithAnalytics}, {name: previous_first_open_count, type: STRING, value: previousFirstOpenCount}, {name: system_app, type: STRING, value: systemApp}, {name: system_app_update, type: STRING, value: systemAppUpdate}, {name: deferred_analytics_collection, type: STRING, value: deferredAnalyticsCollection}, {name: reset_analytics_cause, type: STRING, value: resetAnalyticsCause}, {name: engagement_time_msec, type: STRING, value: engagementTimeMSec}]}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late final TextEditingController textEditingControllerCounter;
  late final TextEditingController textEditingControllerUri;

  bool auth = false;

  @override
  void initState() {
    super.initState();

    textEditingControllerCounter = TextEditingController();
    textEditingControllerUri = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Builder(
            builder: (context) {
              if(!auth){
                return _auth();
              }
              return _test();
            }
          ),
        ),
      ),
    );
  }

  Widget _auth() {
    return Column(
      children: [
        TextField(
          controller: textEditingControllerCounter,
          decoration: const InputDecoration(
            hintText: "counterId",
          )
        ),
        TextField(
          controller: textEditingControllerUri,
          decoration: const InputDecoration(
            hintText: "uri",
          )
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              auth = true;
              SpaSdk.init(counterId: textEditingControllerCounter.text, uriServiceSpa: textEditingControllerUri.text);
            });
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color.fromRGBO(46, 70, 96, 1),
          ),
          child: const Text(
            "auth",
          ),
        ),
      ],
    );
  }

  Widget _test() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            SpaSdk.instance.activateLocation();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color.fromRGBO(46, 70, 96, 1),
          ),
          child: const Text(
            "location actiovete",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            SpaSdk.instance.sendEvent(EventSpa.error(error: "error", errorValue: "errorValue"));
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color.fromRGBO(46, 123, 96, 1),
          ),
          child: const Text(
            "error",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            SpaSdk.instance.sendEvent(const EventSpa.appSessionStart());
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color.fromRGBO(46, 123, 96, 1),
          ),
          child: const Text(
            "App Session Start",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            SpaSdk.instance.sendEvent(EventSpa.search(value: "value"));
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color.fromRGBO(46, 123, 96, 1),
          ),
          child: const Text(
            "search",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            SpaSdk.instance.sendEvent(EventSpa.appException(fatal: 'fatal', engagementTimeMSec: 'engagementTimeMSec'));
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color.fromRGBO(46, 123, 96, 1),
          ),
          child: const Text(
            "appException",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            SpaSdk.instance.sendEvent(const EventSpa.appSessionEnd());
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color.fromRGBO(46, 123, 96, 1),
          ),
          child: const Text(
            "appSessionEnd",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            SpaSdk.instance.sendEvent(EventSpa.appUpdate(previousAppVersion: "previousAppVersion"));
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color.fromRGBO(46, 123, 96, 1),
          ),
          child: const Text(
            "appUpdate",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            SpaSdk.instance.sendEvent(EventSpa.fileOpenedInLink(linkUri: 'linkUri', linkId: 'linkId', linkText: 'linkText', linkDomain: 'linkDomain', linkClassed: 'linkClassed', fileName: 'fileName', fileExtension: 'fileExtension'));
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color.fromRGBO(46, 123, 96, 1),
          ),
          child: const Text(
            "fileOpenedInLink",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            SpaSdk.instance.sendEvent(EventSpa.firstOpen(previousGmpAppId: "previousGmpAppId", updatedWithAnalytics: "updatedWithAnalytics", previousFirstOpenCount: "previousFirstOpenCount", systemApp: "systemApp", systemAppUpdate: "systemAppUpdate", deferredAnalyticsCollection: "deferredAnalyticsCollection", resetAnalyticsCause: "resetAnalyticsCause", engagementTimeMSec: "engagementTimeMSec"));
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color.fromRGBO(46, 123, 96, 1),
          ),
          child: const Text(
            "firstOpen",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            SpaSdk.instance.sendEvent(EventSpa.linkOpened(linkUri: "linkUri"));
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color.fromRGBO(46, 123, 96, 1),
          ),
          child: const Text(
            "linkOpened",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            SpaSdk.instance.sendEvent(EventSpa.screenView(pageLocation: "pageLocation", pageReferrer: "pageReferrer"));
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color.fromRGBO(46, 123, 96, 1),
          ),
          child: const Text(
            "screenView",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            SpaSdk.instance.sendEvent(EventSpa.custom(eventType: "eventType", customParam: {
              "customParam1": "valueCustomParam1",
              "customParam2": "valueCustomParam2",
            }));
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color.fromRGBO(46, 123, 96, 1),
          ),
          child: const Text(
            "custom",
          ),
        ),
      ],
    );
  }



}
