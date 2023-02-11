import 'package:flutter/material.dart';
// import 'package:CRUD/firebase_services/splash_services.dart';
import 'package:medico/ui/splash_screen.dart';
import 'package:medico/firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'MEDICO SHOP ONLINE',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
    );
  }
}
