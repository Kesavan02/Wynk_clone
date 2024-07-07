part of 'hellotune_bloc.dart';

abstract class HellotuneState {}

abstract class HellotuneActionState extends HellotuneState {}

class HellotuneInitialState extends HellotuneState {}

class HellotuneSuccessState extends HellotuneState {}

class HellotuneErrorState extends HellotuneState {}
