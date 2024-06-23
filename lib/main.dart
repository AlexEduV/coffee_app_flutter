 import 'package:coffee_app_flutter/model/coffee.dart';
import 'package:coffee_app_flutter/pages/details_page.dart';
import 'package:coffee_app_flutter/pages/home_page.dart';
import 'package:coffee_app_flutter/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

 /// The route configuration.
 final GoRouter _router = GoRouter(
   initialLocation: '/',
   routes: <RouteBase>[
     GoRoute(
       path: '/',
       name: 'root',
       builder: (BuildContext context, GoRouterState state) {
         return const MyHomePage();
       },
       routes: <RouteBase>[
         GoRoute(
           path: 'orderDetails',
           name: 'orderDetails',
           builder: (BuildContext context, GoRouterState state) {

             Coffee coffee = state.extra as Coffee;

             return DetailsPage(
               coffee: coffee,
             );
           },
         ),
       ],
     ),
   ],
 );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Coffee App',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'SF Pro',
        brightness: Brightness.dark,
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[700],
          ),
        ),
        searchBarTheme: SearchBarThemeData(
          hintStyle: WidgetStateProperty.all(
            TextStyle(
              color: Colors.grey[700],
            )
          ),
          backgroundColor: WidgetStateProperty.all(ProjectColors.textInputBackgroundColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ProjectColors.accentColor,
          unselectedItemColor: ProjectColors.hintColor,
        ),
      ),
    );
  }
}
