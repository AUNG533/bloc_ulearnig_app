import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_events.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_states.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePagesStates> {
  HomePageBlocs(): super(const HomePagesStates()) {
    on<HomePageDots>(_homePageDots);

  }

  void _homePageDots(HomePageDots event, Emitter<HomePagesStates> emit) {
    emit(state.copyWith(index: event.index));
}

}