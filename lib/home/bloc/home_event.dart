part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeNotificationButtonNavigateClickedEvent extends HomeEvent {}

class HomeSearchButtonClickedEvent extends HomeEvent {}

class MusicPlayableCardsClickedEvent extends HomeEvent {}

class HomeSeeAllClickedEvent extends HomeEvent {}
