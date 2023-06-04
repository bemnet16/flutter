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
      email: 'john@example.com',
      password: 'password',
      YearOfStudy: 3,
      Program: 'Computer Science',
      role: 'user',
      profileImage: null,
    );

    test('emits [AuthChecking, AuthChecked] when LoginEvent is added', () {
      final mockToken = 'mockToken';
      final mockResult = {'user': mockUser, 'token': mockToken};

      when(mockAuthRepository.login(any, any))
          .thenAnswer((_) async => mockResult);

      expect(
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

      expect(
        authBloc.stream,
        emitsInOrder([
          AuthChecking(),
          AuthFailed(error: mockError),
        ]),
      );

      authBloc.add(LoginEvent(email: 'test@test.com', password: 'password'));
    });

    test('emits [AuthChecking, SignupChecked] when SignUpEvent is added', () {
      expect(
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

      expect(
        authBloc.stream,
        emitsInOrder([
          AuthChecking(),
          AuthFailed(error: mockError),
        ]),
      );

      authBloc.add(SignUpEvent(user: mockUser));
    });

    test('emits [AuthChecking, AuthChecked] when CheckAuthEvent is added', () {
      final mockTokenAndUser = {'user': mockUser, 'token': 'mockToken'};

      when(mockAuthRepository.retrieveToken())
          .thenAnswer((_) async => mockTokenAndUser);

      expect(
        authBloc.stream,
        emitsInOrder([
          AuthChecking(),
          AuthChecked(user: mockUser, token: 'mockToken'),
        ]),
      );

      authBloc.add(CheckAuthEvent());
    });

    test('emits [AuthChecking, AuthFailed] when token retrieval fails', () {
      when(mockAuthRepository.retrieveToken()).thenAnswer((_) async => {});

      expect(
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
