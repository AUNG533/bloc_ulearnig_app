//unify BlocProvider and  routes and pages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/bloc/app_blocs.dart';
import 'package:ulearning_app/pages/application/widgets/application_page.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning_app/pages/home/home_page.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sing_in/bloc/sing_in_blocs.dart';
import 'package:ulearning_app/pages/sing_in/sing_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return  [
      PageEntity(
        route: AppRoutes.INITTAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SING_IN,
        page: const SingIn(),
        bloc: BlocProvider(create: (_) => SingInBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBlocs()),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomePageBlocs()),
      ),
    ];
  }
// return all blocProvider
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()){
        blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if(settings.name != null){
      // check for route name macthing when navigator gets triggered.
      var result = routes().where((element) => element.route == settings.name);
      if(result.isNotEmpty){

        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if(result.first.route == AppRoutes.INITTAL && deviceFirstOpen) {
          bool isLoggedin = Global.storageService.getIsLoggedIn();
          if(isLoggedin){
            return MaterialPageRoute(builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(builder: (_) => const SingIn(), settings: settings);
        }
        return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_) => const SingIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
