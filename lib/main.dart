import 'package:fin_infocom/views/login.dart';
import 'package:fin_infocom/views/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyAYSK78awHHxpRJncGte6IVEd8tejGLciQ", appId: "1:618942944822:web:7418eff7af01cb5de42a97", messagingSenderId: "618942944822", projectId: "user-management-ddc2b"));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: LoginPage(),
    );
  }
}




