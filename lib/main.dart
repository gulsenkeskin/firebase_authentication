import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/home_page.dart';
import 'package:firebase_authentication/widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frebase Authentication',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.blueGrey[50],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            //auth durum değişikliklerini almak için firebase auth paketini kullanırız
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //kullanıcı oturum açtıysa
                return HomePage();
              } else {
                return LoginWidget();
              }
            }),
      );
}
