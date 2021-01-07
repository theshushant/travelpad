import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelpad/presentation/home_page.dart';
import 'package:travelpad/presentation/signup_page.dart';
import 'package:travelpad/store/user_store.dart';

class SplashPage extends StatefulWidget {
  static const routeName = "SplashPage";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      login();
    });
  }

  login() async {
    UserStore _userStore = Provider.of(context, listen: true);

    await _userStore.reset();

    if (_userStore.user != null) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      Navigator.pushReplacementNamed(context, SignUpPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
