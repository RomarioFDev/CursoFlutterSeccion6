import 'package:flutter/material.dart';
import 'package:flutter_seccion6/models/models.dart';
import 'package:flutter_seccion6/screens/inputs_screen.dart';
import 'package:flutter_seccion6/screens/listwiew_builder.dart';
import 'package:flutter_seccion6/screens/screens.dart';

class AppRouter {
  //Todo: Metodo que manda un string del nombre de la ruta que se presenta primero
  static const initialRouter = 'home';

  static final menuOptions = <MenuOptions>[
/*     MenuOptions(
        route: 'home',
        name: 'HomeScreen',
        screen: const HomeScreen(),
        icon: Icons.home), */
    MenuOptions(
        route: 'listview1',
        name: 'Listview1Screen',
        screen: const Listview1Screen(),
        icon: Icons.list_alt),
    MenuOptions(
        route: 'listview2',
        name: 'Listview2Screen',
        screen: const Listview2Screen(),
        icon: Icons.list_outlined),
    MenuOptions(
        route: 'alert',
        name: 'AlertScreen',
        screen: const AlertScreen(),
        icon: Icons.info_outline),
    MenuOptions(
        route: 'card',
        name: 'CardScreen',
        screen: const CardScreen(),
        icon: Icons.image_aspect_ratio),
    MenuOptions(
        route: 'avatar',
        name: 'AvatarScreen',
        screen: const AvatarScreen(),
        icon: Icons.supervised_user_circle_outlined),
    MenuOptions(
        route: 'animated',
        name: 'AnimatedScreen',
        screen: const AnimatedScreen(),
        icon: Icons.play_circle),
    MenuOptions(
        route: 'input',
        name: 'InputsScreen',
        screen: const InputsScreen(),
        icon: Icons.text_fields_rounded),
    MenuOptions(
        route: 'slider',
        name: 'SliderScreen',
        screen: const SliderScreen(),
        icon: Icons.slow_motion_video_rounded),
    MenuOptions(
        route: 'listviewbuilder',
        name: 'InfiniteScrol & Pull to Refresh',
        screen: const ListViewBuilderScreen(),
        icon: Icons.line_style),
  ];

  static Map<String, Widget Function(BuildContext context)> getAppRouter() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    //! Se agreaga el HomeScreen antes para poder accesar pero no se mostrara en la lista
    appRoutes.addAll({'home': (contex) => const HomeScreen()});
    for (var options in menuOptions) {
      appRoutes.addAll({options.route: (context) => options.screen});
    }
    return appRoutes;
  }

//! Se comenta, pero es recomendable trabajar las rutas como esta arriba
/*   static Map<String, Widget Function(BuildContext)> routes = {
    'home': (context) => const HomeScreen(),
    'card': (context) => const CardScreen(),
  }; */

  //! Definir el tipo es importante para que no pida el argumento de settings
  static Route<dynamic> onGenerateRoute(settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
