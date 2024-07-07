import 'dart:async';

import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeNotificationButtonNavigateClickedEvent>(
        homeNotificationButtonNavigateClickedEvent);
    on<HomeSearchButtonClickedEvent>(homeSearchButtonClickedEvent);
    on<MusicPlayableCardsClickedEvent>(musicPlayableCardsClickedEvent);
    on<HomeSeeAllClickedEvent>(homeSeeAllClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadedState());
    emit(HomeSuccessState());
  }

  FutureOr<void> homeNotificationButtonNavigateClickedEvent(
      HomeNotificationButtonNavigateClickedEvent event,
      Emitter<HomeState> emit) {
    emit(HomeNotificationButtonNavigateClickedState());
  }

  FutureOr<void> musicPlayableCardsClickedEvent(
      MusicPlayableCardsClickedEvent event, Emitter<HomeState> emit) {
    emit(MusicPlayableCardsClickedState());
  }

  FutureOr<void> homeSearchButtonClickedEvent(
      HomeSearchButtonClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeSearchButtonClickedState());
  }

  FutureOr<void> homeSeeAllClickedEvent(
      HomeSeeAllClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeSeeAllClickedState());
  }
}
