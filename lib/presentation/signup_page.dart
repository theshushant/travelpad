import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:travelpad/models/user.dart';
import 'package:travelpad/presentation/home_page.dart';
import 'package:travelpad/presentation/login_page.dart';
import 'package:travelpad/store/user_store.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = "SignUpPage";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
        padding: EdgeInsets.symmetric(
          vertical: height * 0.07,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/SignUpPage.png"),
          ),
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
                        "assets/SignUpDecorator.png",
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  TextFormField(
                    validator: (String value) {
                      if (value.isEmpty || value.trim().isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "User Name",
                      hintText: "User Name",
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
                    keyboardType: TextInputType.emailAddress,
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
                    height: height * 0.02,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (String value) {
                      if (value.isEmpty || value.trim().isEmpty) {
                        return "Required";
                      }
                      if (password != value) {
                        return "Password didn't match";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Confirm Password",
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
//                  SizedBox(
//                    height: height * 0.02,
//                  ),
//                  TextFormField(
//                    validator: (String value) {
//                      if (value.isEmpty || value.trim().isEmpty) {
//                        return "Required";
//                      }
//                      return null;
//                    },
//                    keyboardType: TextInputType.phone,
//                    decoration: InputDecoration(
//                      labelText: "Phone Number",
//                      hintText: "Phone Number",
//                      hintStyle: TextStyle(
//                        fontSize: 18,
//                      ),
//                      border: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(12),
//                        borderSide: BorderSide(
//                          color: Colors.greenAccent,
//                        ),
//                      ),
//                      enabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(12),
//                        borderSide: BorderSide(
//                          color: Colors.amber,
//                        ),
//                      ),
//                      focusedBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(12),
//                        borderSide: BorderSide(
//                          color: Colors.greenAccent,
//                        ),
//                      ),
//                    ),
//                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  InkWell(
                    onTap: () async {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        FocusScope.of(context).unfocus();
                        FirebaseAuth auth = FirebaseAuth.instance;
                        try {
                          print(password);
                          AuthResult authResult =
                              await auth.createUserWithEmailAndPassword(
                                  email: email.trim(), password: password);
                          print(authResult.user);
                          print(authResult.user.providerId);
                          User user = new User();
                          user.email = email;
                          user.password = password;
                          user.id = authResult.user.uid;
                          UserStore _userStore = Provider.of(context, listen: false);
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
                        "Sign Up",
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
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already An User? "),
                        Text(
                          " SignUp",
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
