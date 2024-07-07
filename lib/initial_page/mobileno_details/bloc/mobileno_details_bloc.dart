import 'dart:async';

import 'package:bloc/bloc.dart';

part 'mobileno_details_event.dart';
part 'mobileno_details_state.dart';

class MobileNumberDetailsBloc
    extends Bloc<MobileNumberDetailEvent, MobileNumberDetailState> {
  MobileNumberDetailsBloc() : super(MobileNumberDetailInitialState()) {
    on<MobileNumberDetailInitialEvent>(mobileNumberDetailInitialEvent);
  }

  FutureOr<void> mobileNumberDetailInitialEvent(
      MobileNumberDetailInitialEvent event,
      Emitter<MobileNumberDetailState> emit) {}
}
