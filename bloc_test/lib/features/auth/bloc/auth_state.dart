part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthChecking extends AuthState {}

class AuthChecked extends AuthState {
  final User user;
  final String token;
  const AuthChecked({
    required this.user,
    required this.token,
  });
  @override
  List<Object> get props => [User, token];
}

class SignupChecked extends AuthState {}

class AuthFailed extends AuthState {
  final String error;
  const AuthFailed({
    required this.error,
  });
}
