import 'package:android_launcher_app/apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
          darkTheme: ThemeData.dark(),
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          routes: {
            "apps": (_) => AppsPage(),
          }),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          elevation: 0,
          child: Icon(Icons.apps),
          onPressed: () => Navigator.pushNamed(context, "apps"),
        ),
      ),
    );
  }
}
