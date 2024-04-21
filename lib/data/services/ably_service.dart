import 'package:ably_flutter/ably_flutter.dart';
import 'package:flutter/foundation.dart';

class AblyService {
  final Realtime realtimeInstance;
  AblyService(this.realtimeInstance);

  void listenToChanges({
    void Function(ConnectionStateChange)? onInitailized,
    void Function(ConnectionStateChange)? onConnecting,
    void Function(ConnectionStateChange)? onConnected,
    void Function(ConnectionStateChange)? onDisconnected,
    void Function(ConnectionStateChange)? onSuspended,
    void Function(ConnectionStateChange)? onClosing,
    void Function(ConnectionStateChange)? onClosed,
    void Function(ConnectionStateChange)? onFailed,
  }) async {
    _listenToState(ConnectionEvent.initialized, onInitailized);
    _listenToState(ConnectionEvent.connecting, onConnecting);
    _listenToState(ConnectionEvent.connected, onConnected);
    _listenToState(ConnectionEvent.disconnected, onDisconnected);
    _listenToState(ConnectionEvent.suspended, onSuspended);
    _listenToState(ConnectionEvent.closing, onClosing);
    _listenToState(ConnectionEvent.closed, onClosed);
    _listenToState(ConnectionEvent.failed, onFailed);
  }

  void _listenToState(ConnectionEvent event,
      void Function(ConnectionStateChange)? onStateChange) {
    realtimeInstance.connection
        .on(event)
        .listen((ConnectionStateChange stateChange) async {
      debugPrint('New state is: ${stateChange.current}');
      onStateChange?.call(stateChange);
    });
  }

  RealtimeChannel listenToChannel({
    required String channelName,
    required void Function(Message) onMessage,
  }) {
    final channel = realtimeInstance.channels.get(channelName);
    channel.subscribe().listen(onMessage);
    return channel;
  }

  void publishMessage(String channelName, String message) {
    final channel = realtimeInstance.channels.get(channelName);
    channel.publish(message: Message(data: message));
  }

  void close() {
    realtimeInstance.connection.close();
  }
}
