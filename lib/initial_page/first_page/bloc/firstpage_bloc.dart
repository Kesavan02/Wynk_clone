import 'dart:async';

import 'package:bloc/bloc.dart';

part 'firstpage_event.dart';
part 'firstpage_state.dart';

class FirstpageBloc extends Bloc<FirstpageEvent, FirstpageState> {
  FirstpageBloc() : super(FirstPageInitialState()) {
    on<FirstPageInitialEvent>(firstPageInitialEvent);
  }

  FutureOr<void> firstPageInitialEvent(
      FirstPageInitialEvent event, Emitter<FirstpageState> emit) {}
}
