import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/user_model.dart';
import '../repository/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
    on<SignUpEvent>(_onSignUpEvent);
    on<CheckAuthEvent>(_onCheckAuthEvent);
  }

  FutureOr<void> _onLoginEvent(
      LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthChecking());
    try {
      final result = await authRepository.login(event.email, event.password);
      emit(AuthChecked(user: result["user"], token: result["token"]));
      await authRepository.storeToken(
        result["token"],
        result["user"],
      );
    } catch (e) {
      emit(AuthFailed(error: e.toString()));
    }
  }

  FutureOr<void> _onSignUpEvent(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthChecking());
    try {
      await authRepository.signup(event.user);
      emit(SignupChecked());
    } catch (e) {
      emit(AuthFailed(error: e.toString()));
      print(e);
    }
  }

  FutureOr<void> _onCheckAuthEvent(
      CheckAuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthChecking());
    final tokenAndUser = await authRepository.retrieveToken();
    if (tokenAndUser.isNotEmpty) {
      emit(AuthChecked(
          user: tokenAndUser["user"], token: tokenAndUser["tokken"]));
    } else {
      emit(const AuthFailed(error: "couldnt login"));
    }
  }
}
