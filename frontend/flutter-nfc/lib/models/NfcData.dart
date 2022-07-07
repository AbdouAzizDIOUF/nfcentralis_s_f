import 'package:nfcentralis/models/utilisateur.dart';
enum NFCStatus { none, reading, read, stopped, error, writing }

class NfcData {
  final Utilisateur id;
  final String content;
  final String error;
  final String statusMapper;

  NFCStatus status;

  NfcData({
    required this.id,
    required this.content,
    required this.error,
    required this.statusMapper,
    required this.status
  });

  factory NfcData.fromMap(Map data) {
    NfcData result = NfcData(
      id: data['nfcId'],
      content: data['nfcContent'],
      error: data['nfcError'],
      statusMapper: data['nfcStatus'],
      status: data['nfcstatus'],
    );
    switch (result.statusMapper) {
      case 'writing':
        result.status = NFCStatus.writing;
        break;
      case 'none':
        result.status = NFCStatus.none;
        break;
      case 'reading':
        result.status = NFCStatus.reading;
        break;
      case 'stopped':
        result.status = NFCStatus.stopped;
        break;
      case 'error':
        result.status = NFCStatus.error;
        break;
      default:
        result.status = NFCStatus.none;
    }
    return result;
  }
}
