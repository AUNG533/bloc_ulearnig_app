import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sing_in/bloc/sing_in_events.dart';
import 'package:ulearning_app/pages/sing_in/bloc/sing_in_states.dart';

class SingInBloc extends Bloc<SingInEvent, SingInState> {
  SingInBloc(): super(const SingInState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SingInState> emit) {
    // print("my email is ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SingInState> emit) {
    // print("my email is ${event.password}");
    emit(state.copyWith(password: event.password));
  }
}