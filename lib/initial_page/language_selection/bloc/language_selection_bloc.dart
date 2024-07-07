import 'dart:async';

import 'package:bloc/bloc.dart';

part 'language_selection_event.dart';
part 'language_selection_state.dart';

class LanguageSelectionBloc
    extends Bloc<LanguageSelectionEvent, LanguageSelectionState> {
  LanguageSelectionBloc() : super(LanguageSelectionInitialState()) {
    on<LanguageSelectionInitialEvent>(languageSelectionInitialEvent);
  }

  FutureOr<void> languageSelectionInitialEvent(
      LanguageSelectionInitialEvent event,
      Emitter<LanguageSelectionState> emit) {}
}
