import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/color_filter_provider.dart';
import 'package:flutter_application_1/providers/opacity_provider.dart';
import 'package:flutter_application_1/providers/text_provider.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OpacityProvider()),
        ChangeNotifierProvider(create: (_) => ColorFilterProvider()),
        ChangeNotifierProvider(create: (_) => TextProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Photo Editor',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
