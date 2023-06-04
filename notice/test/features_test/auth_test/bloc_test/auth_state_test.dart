
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/features/auth/bloc/auth_bloc.dart';
import 'package:bloc_test/features/auth/model/user_model.dart';
import 'package:bloc_test/features/auth/repository/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late AuthBloc authBloc;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    authBloc = AuthBloc(authRepository: mockAuthRepository);
  });

  tearDown(() {
    authBloc.close();
  });

  group('AuthBloc', () {
    final mockUser = User(
      id: '123',
      firstName: 'John',
      lastName: 'Doe',
      userName: 'johndoe',
      email: 'johndoe@example.com',
      password: 'password',
      YearOfStudy: 2,
      Program: 'Computer Science',
    );

    test('emits [AuthChecking, AuthChecked] when LoginEvent is added', () {
      final mockToken = 'mockToken';
      final mockResult = {'user': mockUser, 'token': mockToken};

      when(mockAuthRepository.login(any, any))
          .thenAnswer((_) async => mockResult);

      expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthChecking(),
          AuthChecked(user: mockUser, token: mockToken),
        ]),
      );

      authBloc.add(LoginEvent(email: 'test@test.com', password: 'password'));
    });

    test('emits [AuthChecking, AuthFailed] when login fails', () {
      final mockError = 'Invalid credentials';

      when(mockAuthRepository.login(any, any)).thenThrow(mockError);

      expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthChecking(),
          AuthFailed(error: mockError),
        ]),
      );

      authBloc.add(LoginEvent(email: 'test@test.com', password: 'password'));
    });

    test('emits [AuthChecking, SignupChecked] when SignUpEvent is added', () {
      expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthChecking(),
          SignupChecked(),
        ]),
      );

      authBloc.add(SignUpEvent(user: mockUser));
    });

    test('emits [AuthChecking, AuthFailed] when signup fails', () {
      final mockError = 'Failed to sign up';

      when(mockAuthRepository.signup(mockUser)).thenThrow(mockError);

      expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthChecking(),
          AuthFailed(error: mockError),
        ]),
      );

      authBloc.add(SignUpEvent(user: mockUser));
    });

    test('emits [AuthChecking, AuthChecked] when CheckAuthEvent is added', () {
      final mockToken = 'mockToken';
      final mockTokenAndUser = {'user': mockUser, 'token': mockToken};

      when(mockAuthRepository.retrieveToken())
          .thenAnswer((_) async => mockTokenAndUser);

      expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthChecking(),
          AuthChecked(user: mockUser, token: mockToken),
        ]),
      );

      authBloc.add(CheckAuthEvent());
    });

    test('emits [AuthChecking, AuthFailed] when token retrieval fails', () {
      when(mockAuthRepository.retrieveToken()).thenAnswer((_) async => {});

      expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthChecking(),
          AuthFailed(error: 'couldnt login'),
        ]),
      );

      authBloc.add(CheckAuthEvent());
    });
  });
}
