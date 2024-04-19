import 'package:ably_flutter/ably_flutter.dart';
import 'package:eden/data/services/ably_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  _registerExternalDependencies();
}

void _registerExternalDependencies() {
  final realtimeInstance =
      Realtime(key: const String.fromEnvironment('ABLY_API_KEY'));

  final ablyService = AblyService(realtimeInstance);
  locator.registerSingleton<AblyService>(ablyService);
}
