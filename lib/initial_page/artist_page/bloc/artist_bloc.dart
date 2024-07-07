import 'dart:async';

import 'package:bloc/bloc.dart';

part 'artist_event.dart';
part 'artist_state.dart';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  ArtistBloc() : super(ArtistInitialState()) {
    on<ArtistInitialEvent>(artistInitialEvent);
  }

  FutureOr<void> artistInitialEvent(
      ArtistInitialEvent event, Emitter<ArtistState> emit) {}
}
