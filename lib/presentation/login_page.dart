import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:travelpad/models/user.dart';
import 'package:travelpad/presentation/home_page.dart';
import 'package:travelpad/presentation/signup_page.dart';
import 'package:travelpad/store/user_store.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "LoginPage";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.07,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/LoginPage.png"),
              alignment: Alignment.bottomCenter),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.07,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      child: Image.asset(
                        "assets/LoginDecorator.png",
                        color: Colors.greenAccent,
                        scale: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.14,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isEmpty || value.trim().isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      setState(() {
                        email = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Email Id",
                      hintText: "Email Id",
                      hintStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.amber,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (String value) {
                      if (value.isEmpty || value.trim().isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      setState(() {
                        password = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.amber,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  InkWell(
                    onTap: () async {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        FocusScope.of(context).unfocus();
                        try {
                          User user;
                          AuthResult authResult = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: email.trim(),
                            password: password,
                          );
                          user = new User();
                          user.email = authResult.user.email;
                          user.password = password;
                          user.id = authResult.user.uid;
                          print(user);
                          UserStore _userStore =
                              Provider.of(context, listen: true);
                          await _userStore.login(user);
                          Navigator.pushReplacementNamed(
                              context, HomePage.routeName);
                        } catch (error) {
                          FocusScope.of(context).unfocus();
                          Toast.show(error.toString(), context);
                          print(error);
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpPage.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("New To Travel Pad? "),
                        Text(
                          " Create New",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
