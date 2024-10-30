import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../failure/failure.dart';
import '../utils/logger.dart';

class ServerException implements Exception {}

class EmptyCacheException implements Exception {}

class OfflineException implements Exception {}

class CacheException implements Exception {}

String mapFailureToMessage(Failure failure) {
  if (kDebugMode) {
    logger.e(failure);
  }
  switch (failure.runtimeType) {
    case const (ServerException):
      return "SERVER_FAILURE_MESSAGE";
    case const (CacheException):
      return "EMPTY_CACHE_FAILURE_MESSAGE";
    case const (OfflineException):
      return "OFFLINE_FAILURE_MESSAGE";
    case const (InternetDisconnectedFailure):
      return "INTERNET_DISCONNECTED_FAILURE_MESSAGE";
    default:
      return "Unexpected Error ,${failure.message}";
  }
}

class NetworkException implements Exception {}

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NoInternetException Occurred']) {
    if (globalMessengerKey.currentState != null) {
      globalMessengerKey.currentState!
          .showSnackBar(SnackBar(content: Text(message)));
    }
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
