import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final FirebaseAuth _auth;

  SignInBloc({FirebaseAuth? auth})
      : _auth = auth ?? GetIt.I<FirebaseAuth>(),
        super(SignInStatePure()) {
    on<SignInWithAnonymous>(_signInWithAnonymous);
    on<SignOut>(_signOut);
  }

  ///
  /// Event: 匿名サインイン
  _signInWithAnonymous(
      SignInWithAnonymous event, Emitter<SignInState> emit) async {
    emit(SignInStateProgress());

    try {
      await _auth.signInAnonymously();
      emit(SignInStateSuccess());
    } catch (e) {
      emit(SignInStateFialure());
    }
  }

  ///
  /// Event: サインアウト
  _signOut(SignOut event, Emitter<SignInState> emit) {
    _auth.signOut();
  }
}
