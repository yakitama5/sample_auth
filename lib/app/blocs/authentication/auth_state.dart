import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

/// 未初期化
class UnInitialized extends AuthState {}

/// 未認証
class NotAuth extends AuthState {}

/// 認証済
class Authenticated extends AuthState {}
