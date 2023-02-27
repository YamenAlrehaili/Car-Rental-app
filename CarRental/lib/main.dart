import 'package:carrental/Models/TheUser.dart';
import 'package:carrental/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carrental/Authentication/Authentication.dart';
import 'package:carrental/Selector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser?>.value(
      initialData: null,
        value: Auth().user ,
        child : MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Car Rental",
          home: FutureBuilder(
            builder: (context,snapshot) {
              if (snapshot.hasError) {
                print('You have an error! ${snapshot.error.toString()}');
                return Text('S Worng!');
              } else {
                return const Selectors();
              }
            },
          ),
        ),

    );
  }
}

