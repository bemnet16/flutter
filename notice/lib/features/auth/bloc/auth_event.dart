part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final User user;
  const SignUpEvent({required this.user});
  @override
  List<Object> get props => [user];
}

class CheckAuthEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
