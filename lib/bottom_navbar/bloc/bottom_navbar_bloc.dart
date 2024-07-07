import 'dart:async';

import 'package:bloc/bloc.dart';

part 'bottom_navbar_event.dart';
part 'bottom_navbar_state.dart';

class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarState> {
  BottomNavbarBloc() : super(BottomNavbarInitialState()) {
    on<BottomNavbarInitialEvent>(bottomNavbarInitialEvent);
  }

  FutureOr<void> bottomNavbarInitialEvent(
      BottomNavbarInitialEvent event, Emitter<BottomNavbarState> emit) {}
}
