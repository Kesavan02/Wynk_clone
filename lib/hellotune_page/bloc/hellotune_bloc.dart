import 'dart:async';

import 'package:bloc/bloc.dart';

part 'hellotune_event.dart';
part 'hellotune_state.dart';

class HellotuneBloc extends Bloc<HellotuneEvent, HellotuneState> {
  HellotuneBloc() : super(HellotuneInitialState()) {
    on<HellotuneInitialEvent>(hellotuneInitialEvent);
  }

  FutureOr<void> hellotuneInitialEvent(
      HellotuneInitialEvent event, Emitter<HellotuneState> emit) {
    emit(HellotuneInitialState());
  }
}
