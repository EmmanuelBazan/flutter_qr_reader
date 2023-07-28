import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/pages/pages.dart';
import 'package:flutter_qr_reader/services/scan_provider.dart';
import 'package:flutter_qr_reader/services/ui_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'homePage',
        routes: {
          'homePage': (_) => HomePage(),
          'mapPage': (_) => MapPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
      ),
    );
  }
}
