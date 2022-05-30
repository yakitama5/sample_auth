import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/app/blocs/authentication/auth_state.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth;

  AuthBloc({FirebaseAuth? auth})
      : _auth = auth ?? FirebaseAuth.instance,
        // 初期状態は「初期化されていない状態」
        super(UnInitialized()) {
    on<AppStarted>(_appStarted);
    on<AuthenticationUserChanged>(_onAuthenticationUserChanged);
  }

  _appStarted(AppStarted event, Emitter<AuthState> emit) async {
    _auth.userChanges().listen((user) => add(AuthenticationUserChanged(user)));
  }

  _onAuthenticationUserChanged(
      AuthenticationUserChanged event, Emitter<AuthState> emit) async {
    final user = event.user;
    if (user == null) {
      emit(NotAuth());
    } else {
      emit(Authenticated());
    }
  }
}
