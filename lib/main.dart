import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelpad/presentation/home_page.dart';
import 'package:travelpad/presentation/login_page.dart';
import 'package:travelpad/presentation/signup_page.dart';
import 'package:travelpad/presentation/splash_page.dart';
import 'package:travelpad/store/user_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>.value(value: UserStore()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (BuildContext context) => SplashPage(),
          SignUpPage.routeName: (BuildContext context) => SignUpPage(),
          LoginPage.routeName: (BuildContext context) => LoginPage(),
          HomePage.routeName: (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
