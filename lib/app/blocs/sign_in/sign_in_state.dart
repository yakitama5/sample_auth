import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  const SignInState();
  @override
  List<Object> get props => [];
}

class SignInStatePure extends SignInState {}

class SignInStateProgress extends SignInState {}

class SignInStateSuccess extends SignInState {}

class SignInStateSignOut extends SignInState {}

class SignInStateFialure extends SignInState {}
