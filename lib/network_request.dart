import 'package:spa_sdk/remote_handler.dart';

import 'model/event_spa.dart';
import 'network_handler.dart';

/// Network requester which will get the data from the remote.
class NetworkRequest extends NetworkHandler {

  /// A remote handler which will handle the remote calls.
  final RemoteHandler _remoteHandler = RemoteHandler();

  @override
  Future<Map<String, dynamic>> getIpAddress() async {
    try {
      Map<String, dynamic> data = await _remoteHandler.getIpAddress();
      return {'ip': data};
    } catch (_) {
      throw Exception('Not able to find the Ip Address.');
    }
  }

  @override
  Future<Map<String, dynamic>> postSpaMessage(EventSpa event, String uriServiceSpa) {
    try {
      return _remoteHandler.postSpaMessage(event, uriServiceSpa);
    } catch (_) {
      throw Exception('Error while sending the message.');
    }
  }
}
