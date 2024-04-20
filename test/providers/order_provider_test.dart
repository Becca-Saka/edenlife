import 'package:ably_flutter/ably_flutter.dart';
import 'package:eden/data/providers/order_provider.dart';
import 'package:eden/data/services/ably_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'helpers.dart';
import 'order_provider_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<Realtime>(),
  MockSpec<AblyService>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late OrderProvider sut;
  late MockAblyService mockAblyService;
  late MockRealtime realtime;

  late MockMethodCallManager manager;

  setUp(() {
    manager = MockMethodCallManager();
    realtime = MockRealtime();
    mockAblyService = MockAblyService();

    sut = OrderProvider(ablyService: mockAblyService);
  });
  tearDown(() {
    manager.reset();
  });

  test('initial values are correct', () {
    expect(sut.isLoading, false);
    expect(sut.statusList, isEmpty);
    expect(sut.orderDetails, isEmpty);
  });
  group('initialize - ', () {
    test('update loading state after 5 seconds', () async {
      when(mockAblyService.realtimeInstance).thenAnswer((_) => realtime);

      sut.initialize();
      expect(sut.isLoading, true);
      await Future.delayed(const Duration(seconds: 5), () {});
      expect(sut.isLoading, false);
    });
  });
}
