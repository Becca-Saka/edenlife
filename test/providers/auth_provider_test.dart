import 'package:eden/data/providers/auth_provider.dart';
import 'package:eden/data/services/auth_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthService with Mock implements AuthService {}

void main() {
  late AuthProvider sut;
  late MockAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService();
    sut = AuthProvider(authService: mockAuthService);
  });

  test('initial values are correct', () {
    expect(sut.isLoading, false);
  });

  group('on signInWithGoogle - ', () {
    test('on success', () {
      when(() => mockAuthService.signInWithGoogle())
          .thenAnswer((_) async => true);

      sut.signInWithGoogle();

      verify(() => mockAuthService.signInWithGoogle()).called(1);
    });
  });
  group('on signInWithGithub - ', () {
    test('on success', () {
      when(() => mockAuthService.signInWithGithub())
          .thenAnswer((_) async => true);

      sut.signInWithGithub();

      verify(() => mockAuthService.signInWithGithub()).called(1);
    });
  });
}
