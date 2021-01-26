import 'package:cryptokeep/provider/password_provider.dart';
import 'package:cryptokeep/routes.dart';
import 'package:cryptokeep/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF2C2D31), // navigation bar color,
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PasswordProvider(),
      child: MaterialApp(
        title: 'CryptoKeep',
        theme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routes: appRoutes,
        initialRoute: "/splash",
      ),
    );
  }
}
