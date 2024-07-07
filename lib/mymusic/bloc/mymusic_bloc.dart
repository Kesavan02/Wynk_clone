import 'dart:async';

import 'package:bloc/bloc.dart';

part 'mymusic_event.dart';
part 'mymusic_state.dart';

class MyMusicBloc extends Bloc<MymusicEvent, MymusicState> {
  MyMusicBloc() : super(MymusicInitialState()) {
    on<MymusicInitialEvent>(mymusicInitialEvent);
  }

  FutureOr<void> mymusicInitialEvent(
      MymusicInitialEvent event, Emitter<MymusicState> emit) {}
}
