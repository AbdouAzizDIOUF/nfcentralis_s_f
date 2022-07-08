import 'dart:async';
import 'package:flutter/services.dart';
import 'package:nfcentralis/models/NfcData.dart';

class FlutterNfcReader {
  static const MethodChannel _channel =
  const MethodChannel('flutter_nfc_reader');
  static const stream =
  const EventChannel('it.matteocrippa.flutternfcreader.flutter_nfc_reader');

  void _onEvent(dynamic data) {
    print("Event");
    print(data);
  }

  void _onError() {
    print("Error");
  }

  FlutterNfcReader() {
    stream.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  static Stream<NfcData> get read {
    final resultStream = _channel
        .invokeMethod('NfcRead')
        .asStream()
        .asyncExpand((_) => stream
        .receiveBroadcastStream()
        .map((result) => NfcData.fromMap(result)));
    return resultStream;
  }

  static Stream<NfcData> writeToCard(String stuffToWrite) {
    return _channel
        .invokeMethod('NfcWrite', {"text": stuffToWrite})
        .asStream()
        .asyncExpand((_) => stream
        .receiveBroadcastStream()
        .map((result) => NfcData.fromMap(result)));
  }

  static Stream<NfcData> get write {
    final resultStream = _channel
        .invokeMethod('NfcWrite', {"text": "Write from flutter"})
        .asStream()
        .asyncExpand((_) => stream
        .receiveBroadcastStream()
        .map((result) => NfcData.fromMap(result)));
    return resultStream;
  }

  static Future<NfcData> get stop async {
    final Map data = await _channel.invokeMethod('NfcStop');

    final NfcData result = NfcData.fromMap(data);

    return result;
  }
}