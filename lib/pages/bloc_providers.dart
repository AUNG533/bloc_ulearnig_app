import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/app_bolcs.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_app/pages/sing_in/bloc/sing_in_blocs.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
    BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
    // BlocProvider(lazy: false, create: (context) => AppBlocs()),
    BlocProvider(create: (context) => SingInBloc()),
    BlocProvider(create: (context) => RegisterBloc()),
  ];
}