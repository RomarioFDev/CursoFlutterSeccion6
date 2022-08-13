import 'package:flutter/material.dart';
import 'package:flutter_seccion6/Theme/app_theme.dart';
import 'package:flutter_seccion6/router/app_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Listview2Screen(),
      //! Siempre leer que pide cada propiedad cuando feninimos una ruta
      initialRoute: AppRouter.initialRouter,
      routes: AppRouter.getAppRouter(),
      //! Para que se pueda mandar el argumento tenemos que definir el tipo
      //! y no puede quedar como dynamic
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: AppTheme.theme,
    );
  }
}
