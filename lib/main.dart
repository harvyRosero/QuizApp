import 'package:flutter/material.dart';
import 'util/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'util/shared_pref.dart';

final Preferences preferences = Preferences();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool data = await preferences.checkIfDataExists();
  runApp(MyApp(dataExist: data,));
}

class MyApp extends StatelessWidget {
  final bool dataExist;
  const MyApp({super.key, required this.dataExist});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: dataExist? '/home' : '/',
        routes: routes_,
      );
  }
}
