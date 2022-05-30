import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// アプリ起動
class AppStarted extends AuthEvent {}

/// 認証情報の変更検知
class AuthenticationUserChanged extends AuthEvent {
  const AuthenticationUserChanged(this.user);

  @override
  List<Object> get props => [user ?? ""];

  final User? user;
}
