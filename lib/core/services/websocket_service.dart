import 'dart:async';
import 'dart:convert';
import 'package:torliga/core/constants/app_end_points.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../utils/logger.dart';
import '../../features/matches/data/model/score_model.dart';

class WebSocketService {
  static WebSocketService? _instance;
  static WebSocketChannel? _channel;
  final StreamController<ScoreModel> _scoreController =
      StreamController.broadcast();

  // Singleton instance
  WebSocketService._internal();

  factory WebSocketService() {
    _instance ??= WebSocketService._internal();
    return _instance!;
  }

  // Expose score updates stream
  Stream<ScoreModel> get scoreStream => _scoreController.stream;

  // Initialize WebSocket connection
  void initWebSocket() {
    if (_channel == null) {
      _channel = WebSocketChannel.connect(Uri.parse(ApiEndPoints.websocketURL));

      _channel?.stream.listen(
        (message) {
          final decodedMessage = jsonDecode(message);
          if (decodedMessage['event'] == 'score-event') {
            final score = ScoreModel.fromJson(decodedMessage['data']);
            _scoreController.add(score);
            logger.e("Score Data: $score");
          }
        },
        onError: (error) {
          logger.e('WebSocket error: $error');
          _scoreController.addError(error);
        },
        onDone: () {
          logger.e('WebSocket connection closed');
          _scoreController.close();
        },
      );
    }
  }

  void dispose() {
    _channel?.sink.close();
    _channel = null;
    _scoreController.close();
  }
}
