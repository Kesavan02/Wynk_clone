part of 'home_bloc.dart';

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadedState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeNotificationButtonNavigateClickedState extends HomeActionState {}

class HomeSearchButtonClickedState extends HomeActionState {}

class MusicPlayableCardsClickedState extends HomeActionState {}

class HomeSeeAllClickedState extends HomeActionState {}
