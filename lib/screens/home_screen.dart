import 'package:flutter/material.dart';
import 'package:flutter_seccion6/Theme/app_theme.dart';
import 'package:flutter_seccion6/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.menuOptions;
    final colorTheme = AppTheme.primary;
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(
                    router[index].icon,
                    color: colorTheme,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  onTap: () {
                    //Todo: Definimos el MaterialPageRoute para definir la ruta
/*                     final router = MaterialPageRoute(
                      builder: (context) => const Listview1Screen(),
                    ); */
                    //Todo: Utilizamos el navegator Push para navegar en rutas definidad en variables
                    //! Si quiero utilizar PushNamed tendre que definir una ruta en String
                    Navigator.pushNamed(context, router[index].route);
                  },
                  title: Text(router[index].name),
                ),
            //! Cuando definimos el Separator no necesitamos el Context y el Index asi que colocamos _ y __
            separatorBuilder: (_, __) => const Divider(),
            itemCount: router.length));
  }
}
