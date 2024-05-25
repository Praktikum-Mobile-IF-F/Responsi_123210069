import 'package:flutter/material.dart';
import 'package:responsiprakmobile/view/home_view.dart';
import 'package:responsiprakmobile/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
      routes: {
        //'/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (_isLoggedIn) {
      return Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        },
      );
    } else {
      return Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => LoginScreen());
        },
      );
    }
  }
}
