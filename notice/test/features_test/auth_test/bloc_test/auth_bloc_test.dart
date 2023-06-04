import 'package:bloc_test/features/auth/bloc/auth_bloc.dart';
import 'package:bloc_test/features/auth/model/user_model.dart';
import 'package:bloc_test/features/auth/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


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
    test('emits [AuthChecking, AuthChecked] when LoginEvent is added', () {
      const mockUser = User(
          id: '123',
          firstName: 'John Doe',
          lastName: 'John Doe',
          userName: 'John Doe',
          email: "bem@gmail.com",
          password: "skljf123424",
          YearOfStudy: 3,
          Program: "software");
      const mockToken = 'mockToken';
      final mockResult = {'user': mockUser, 'token': mockToken};

      when(mockAuthRepository.login(any, any)).thenAnswer(
          (_) async => Future<Map<String, dynamic>>.value(mockResult));

      authBloc.add(LoginEvent(email: 'test@test.com', password: 'password'));
      expectLater(
        authBloc,
        emitsInOrder([
          AuthChecking(),
          AuthChecked(user: mockUser, token: mockToken),
        ]),
      );
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

      authBloc.add(SignUpEvent(
          user: User(
              firstName: 'firstName',
              lastName: 'lastName',
              userName: 'userName',
              email: 'email',
              password: 'password',
              YearOfStudy: 3,
              Program: 'Program')));
    });

    test('emits [AuthChecking, AuthFailed] when signup fails', () {
      final mockError = 'Failed to sign up';

      when(mockAuthRepository.signup(User(
              id: '123',
              firstName: 'John Doe',
              lastName: 'John Doe',
              userName: 'John Doe',
              email: "bem@gmail.com",
              password: "skljf123424",
              YearOfStudy: 3,
              Program: "software")))
          .thenThrow(mockError);

      expect(
        authBloc.stream,
        emitsInOrder([
          AuthChecking(),
          AuthFailed(error: mockError),
        ]),
      );

      authBloc.add(SignUpEvent(
          user: User(
              id: '123',
              firstName: 'John Doe',
              lastName: 'John Doe',
              userName: 'John Doe',
              email: "bem@gmail.com",
              password: "skljf123424",
              YearOfStudy: 3,
              Program: "software")));
    });

    test('emits [AuthChecking, AuthChecked] when CheckAuthEvent is added', () {
      final mockUser = User(
          id: '123',
          firstName: 'John Doe',
          lastName: 'John Doe',
          userName: 'John Doe',
          email: "bem@gmail.com",
          password: "skljf123424",
          YearOfStudy: 3,
          Program: "software");
      final mockToken = 'mockToken';
      final mockTokenAndUser = {'user': mockUser, 'token': mockToken};

      when(mockAuthRepository.retrieveToken())
          .thenAnswer((_) async => mockTokenAndUser);

      expect(
        authBloc.stream,
        emitsInOrder([
          AuthChecking(),
          AuthChecked(user: mockUser, token: mockToken),
        ]),
      );

      authBloc.add(CheckAuthEvent());
    });

    test('emits [AuthChecking, AuthFailed] when token retrieval fails', () {
      final mockTokenAndUser = {};

      when(mockAuthRepository.retrieveToken())
          .thenAnswer((_) async => mockTokenAndUser);

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
