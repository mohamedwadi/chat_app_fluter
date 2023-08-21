part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class SuccessState extends AuthState {}
class FailureState extends AuthState {}
class LoadingState extends AuthState {}
