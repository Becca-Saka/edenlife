// Mocks generated by Mockito 5.4.4 from annotations
// in eden/test/providers/order_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:ably_flutter/ably_flutter.dart' as _i2;
import 'package:eden/data/services/ably_service.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAuth_0 extends _i1.SmartFake implements _i2.Auth {
  _FakeAuth_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeClientOptions_1 extends _i1.SmartFake implements _i2.ClientOptions {
  _FakeClientOptions_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePush_2 extends _i1.SmartFake implements _i2.Push {
  _FakePush_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeConnection_3 extends _i1.SmartFake implements _i2.Connection {
  _FakeConnection_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRealtimeChannels_4 extends _i1.SmartFake
    implements _i2.RealtimeChannels {
  _FakeRealtimeChannels_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDateTime_5 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLocalDevice_6 extends _i1.SmartFake implements _i2.LocalDevice {
  _FakeLocalDevice_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFuture_7<T1> extends _i1.SmartFake implements _i3.Future<T1> {
  _FakeFuture_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRealtime_8 extends _i1.SmartFake implements _i2.Realtime {
  _FakeRealtime_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRealtimeChannel_9 extends _i1.SmartFake
    implements _i2.RealtimeChannel {
  _FakeRealtimeChannel_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Realtime].
///
/// See the documentation for Mockito's code generation for more information.
class MockRealtime extends _i1.Mock implements _i2.Realtime {
  @override
  _i2.Auth get auth => (super.noSuchMethod(
        Invocation.getter(#auth),
        returnValue: _FakeAuth_0(
          this,
          Invocation.getter(#auth),
        ),
        returnValueForMissingStub: _FakeAuth_0(
          this,
          Invocation.getter(#auth),
        ),
      ) as _i2.Auth);

  @override
  set auth(_i2.Auth? _auth) => super.noSuchMethod(
        Invocation.setter(
          #auth,
          _auth,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.ClientOptions get options => (super.noSuchMethod(
        Invocation.getter(#options),
        returnValue: _FakeClientOptions_1(
          this,
          Invocation.getter(#options),
        ),
        returnValueForMissingStub: _FakeClientOptions_1(
          this,
          Invocation.getter(#options),
        ),
      ) as _i2.ClientOptions);

  @override
  set options(_i2.ClientOptions? _options) => super.noSuchMethod(
        Invocation.setter(
          #options,
          _options,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.Push get push => (super.noSuchMethod(
        Invocation.getter(#push),
        returnValue: _FakePush_2(
          this,
          Invocation.getter(#push),
        ),
        returnValueForMissingStub: _FakePush_2(
          this,
          Invocation.getter(#push),
        ),
      ) as _i2.Push);

  @override
  set push(_i2.Push? _push) => super.noSuchMethod(
        Invocation.setter(
          #push,
          _push,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.Connection get connection => (super.noSuchMethod(
        Invocation.getter(#connection),
        returnValue: _FakeConnection_3(
          this,
          Invocation.getter(#connection),
        ),
        returnValueForMissingStub: _FakeConnection_3(
          this,
          Invocation.getter(#connection),
        ),
      ) as _i2.Connection);

  @override
  _i2.RealtimeChannels get channels => (super.noSuchMethod(
        Invocation.getter(#channels),
        returnValue: _FakeRealtimeChannels_4(
          this,
          Invocation.getter(#channels),
        ),
        returnValueForMissingStub: _FakeRealtimeChannels_4(
          this,
          Invocation.getter(#channels),
        ),
      ) as _i2.RealtimeChannels);

  @override
  _i3.Future<int> get handle => (super.noSuchMethod(
        Invocation.getter(#handle),
        returnValue: _i3.Future<int>.value(0),
        returnValueForMissingStub: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);

  @override
  _i3.Future<int?> createPlatformInstance() => (super.noSuchMethod(
        Invocation.method(
          #createPlatformInstance,
          [],
        ),
        returnValue: _i3.Future<int?>.value(),
        returnValueForMissingStub: _i3.Future<int?>.value(),
      ) as _i3.Future<int?>);

  @override
  _i3.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> connect() => (super.noSuchMethod(
        Invocation.method(
          #connect,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<DateTime> time() => (super.noSuchMethod(
        Invocation.method(
          #time,
          [],
        ),
        returnValue: _i3.Future<DateTime>.value(_FakeDateTime_5(
          this,
          Invocation.method(
            #time,
            [],
          ),
        )),
        returnValueForMissingStub: _i3.Future<DateTime>.value(_FakeDateTime_5(
          this,
          Invocation.method(
            #time,
            [],
          ),
        )),
      ) as _i3.Future<DateTime>);

  @override
  _i3.Future<_i2.LocalDevice> device() => (super.noSuchMethod(
        Invocation.method(
          #device,
          [],
        ),
        returnValue: _i3.Future<_i2.LocalDevice>.value(_FakeLocalDevice_6(
          this,
          Invocation.method(
            #device,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.LocalDevice>.value(_FakeLocalDevice_6(
          this,
          Invocation.method(
            #device,
            [],
          ),
        )),
      ) as _i3.Future<_i2.LocalDevice>);

  @override
  _i3.Future<T?> invokeWithoutHandle<T>(
    String? method, [
    Map<String, dynamic>? argument,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #invokeWithoutHandle,
          [
            method,
            argument,
          ],
        ),
        returnValue: _i3.Future<T?>.value(),
        returnValueForMissingStub: _i3.Future<T?>.value(),
      ) as _i3.Future<T?>);

  @override
  _i3.Future<T?> invoke<T>(
    String? method, [
    Map<String, dynamic>? arguments,
    int? externalHandle,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #invoke,
          [
            method,
            arguments,
            externalHandle,
          ],
        ),
        returnValue: _i3.Future<T?>.value(),
        returnValueForMissingStub: _i3.Future<T?>.value(),
      ) as _i3.Future<T?>);

  @override
  _i3.Future<T> invokeRequest<T>(
    String? method, [
    Map<String, dynamic>? arguments,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #invokeRequest,
          [
            method,
            arguments,
          ],
        ),
        returnValue: _i4.ifNotNull(
              _i4.dummyValueOrNull<T>(
                this,
                Invocation.method(
                  #invokeRequest,
                  [
                    method,
                    arguments,
                  ],
                ),
              ),
              (T v) => _i3.Future<T>.value(v),
            ) ??
            _FakeFuture_7<T>(
              this,
              Invocation.method(
                #invokeRequest,
                [
                  method,
                  arguments,
                ],
              ),
            ),
        returnValueForMissingStub: _i4.ifNotNull(
              _i4.dummyValueOrNull<T>(
                this,
                Invocation.method(
                  #invokeRequest,
                  [
                    method,
                    arguments,
                  ],
                ),
              ),
              (T v) => _i3.Future<T>.value(v),
            ) ??
            _FakeFuture_7<T>(
              this,
              Invocation.method(
                #invokeRequest,
                [
                  method,
                  arguments,
                ],
              ),
            ),
      ) as _i3.Future<T>);

  @override
  _i3.Stream<T> listen<T>(
    String? method, [
    Object? payload,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #listen,
          [
            method,
            payload,
          ],
        ),
        returnValue: _i3.Stream<T>.empty(),
        returnValueForMissingStub: _i3.Stream<T>.empty(),
      ) as _i3.Stream<T>);
}

/// A class which mocks [AblyService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAblyService extends _i1.Mock implements _i5.AblyService {
  @override
  _i2.Realtime get realtimeInstance => (super.noSuchMethod(
        Invocation.getter(#realtimeInstance),
        returnValue: _FakeRealtime_8(
          this,
          Invocation.getter(#realtimeInstance),
        ),
        returnValueForMissingStub: _FakeRealtime_8(
          this,
          Invocation.getter(#realtimeInstance),
        ),
      ) as _i2.Realtime);

  @override
  set realtimeInstance(_i2.Realtime? _realtimeInstance) => super.noSuchMethod(
        Invocation.setter(
          #realtimeInstance,
          _realtimeInstance,
        ),
        returnValueForMissingStub: null,
      );

  @override
  void listenToChanges({
    void Function(_i2.ConnectionStateChange)? onInitailized,
    void Function(_i2.ConnectionStateChange)? onConnecting,
    void Function(_i2.ConnectionStateChange)? onConnected,
    void Function(_i2.ConnectionStateChange)? onDisconnected,
    void Function(_i2.ConnectionStateChange)? onSuspended,
    void Function(_i2.ConnectionStateChange)? onClosing,
    void Function(_i2.ConnectionStateChange)? onClosed,
    void Function(_i2.ConnectionStateChange)? onFailed,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #listenToChanges,
          [],
          {
            #onInitailized: onInitailized,
            #onConnecting: onConnecting,
            #onConnected: onConnected,
            #onDisconnected: onDisconnected,
            #onSuspended: onSuspended,
            #onClosing: onClosing,
            #onClosed: onClosed,
            #onFailed: onFailed,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.RealtimeChannel listenToChannel({
    required String? channelName,
    required void Function(_i2.Message)? onMessage,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #listenToChannel,
          [],
          {
            #channelName: channelName,
            #onMessage: onMessage,
          },
        ),
        returnValue: _FakeRealtimeChannel_9(
          this,
          Invocation.method(
            #listenToChannel,
            [],
            {
              #channelName: channelName,
              #onMessage: onMessage,
            },
          ),
        ),
        returnValueForMissingStub: _FakeRealtimeChannel_9(
          this,
          Invocation.method(
            #listenToChannel,
            [],
            {
              #channelName: channelName,
              #onMessage: onMessage,
            },
          ),
        ),
      ) as _i2.RealtimeChannel);

  @override
  void publishMessage(
    String? channelName,
    String? message,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #publishMessage,
          [
            channelName,
            message,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
