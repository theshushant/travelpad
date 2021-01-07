import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:provider/provider.dart';
import 'package:travelpad/animation/flare_animation/flare_animation.dart';
import 'package:travelpad/models/address.dart';
import 'package:travelpad/models/user.dart';
import 'package:travelpad/presentation/custom/detail_fetch.dart';
import 'package:travelpad/service/location_service.dart';
import 'package:travelpad/store/user_store.dart';

import 'custom/provide_animation_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Address _address;
  double height;
  double width;
  bool viewAddress;
  bool askUserAddress;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final databaseReference = FirebaseDatabase.instance.reference();
  String email;
  UserStore _userStore;
  bool locationAsked;
  List<String> list;
  int i;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermission();
    viewAddress = false;
    askUserAddress = false;
    locationAsked = false;
    list = [];
    i = list.length;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }

  checkPermission() async {
    PermissionStatus checkPermission =
        await LocationPermissions().checkPermissionStatus();

    if (checkPermission != PermissionStatus.granted &&
        checkPermission != PermissionStatus.restricted) {
      await LocationPermissions().requestPermissions(
          permissionLevel: LocationPermissionLevel.locationAlways);
    }
  }

  void requestedCheck(String email) {
    databaseReference.child(email.split("@")[0]).onValue.listen((event) {
      final snapshot = event.snapshot;
      if (!snapshot.value["request"] || snapshot.value["request"] == "false") {
        Map<dynamic, dynamic> map = snapshot.value["address"];
        Address address = new Address();

        address.address1 = map['subThoroughfare'].toString();
        address.address2 = map['thoroughfare'].toString();
        address.region = map["subLocality"].toString();
        address.city = map["locality"].toString();
        address.district = map["subAdministrativeArea"].toString();
        address.state = map["administrativeArea"].toString();
        address.postalCode = map["postalCode"].toString();
        address.country = map["country"].toString();
        address.phoneNumber = map["phoneNumber"].toString();
        address.latitude = double.parse(map["latitude"].toString());
        address.longitude = double.parse(map["longitude"].toString());

        _address = address;
        setState(() {
          viewAddress = true;
        });
        Future.delayed(const Duration(seconds: 5), () {
          _address = null;
          setState(() {
            viewAddress = false;
          });
        });
      }
    });
  }

  void dataVisibility() {
    if (_userStore.user != null) {
      User user = _userStore.user;
      databaseReference.child(user.email.split("@")[0]).onValue.listen((event) {
        final snapshot = event.snapshot;
        if (snapshot.value != null &&
            (snapshot.value["request"] ||
                snapshot.value["request"] == "true")) {
          showDialog(
            context: this.context,
            child: new AlertDialog(
              content: Text("Faculty has requested For Your Location"),
              actions: <Widget>[
                RaisedButton(
                  child: Text("Allow"),
                  onPressed: () async {
                    _address = await LocationService.getInstance()
                        .getCurrentLocationAddress();
                    if (user != null) {
                      await databaseReference
                          .child(user.email.split("@")[0])
                          .set({
                        "request": false,
                        "address": Address.toJson(_address)
                      });
                    }
                    Navigator.pop(context);
                  },
                ),
                RaisedButton(
                  child: Text("Deny"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    dataVisibility();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.1),
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  viewAddress = false;
                  askUserAddress = false;
                });
              },
              child: FlareAnimation(
                image: "assets/Submitted.flr",
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: DetailFetch(
                text: "Ask For User Address?",
                onTap: () {
                  setState(() {
                    askUserAddress = true;
                  });
//                  Navigator.pushNamed(
//                      context, FirebaseRealtimeDemoScreen.routeName);
                },
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: DetailFetch(
                isLeft: false,
                text: "Get Your Current Address",
                onTap: () async {
                  if (_address == null) {
                    _address = await LocationService.getInstance()
                        .getCurrentLocationAddress();
                  }
                  viewAddress = true;
                  setState(() {});
                },
              ),
            ),
            _address != null && viewAddress
                ? ProvideAnimation(
                    transitionFormat: TransitionFormat.leftToRight,
                    child: Align(
                      alignment: Alignment.center,
                      child: _addressView(),
                    ),
                  )
                : Container(),
            askUserAddress
                ? ProvideAnimation(
                    transitionFormat: TransitionFormat.rightToLeft,
                    child: Align(
                      alignment: Alignment.center,
                      child: _userAddress(),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _labelText(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addressView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.17),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _labelText("Longitude", _address.longitude.toString()),
          _labelText("Latitude", _address.latitude.toString()),
          _labelText("City", _address.city),
          _labelText("Full Address", _address.addressString),
        ],
      ),
    );
  }

  Widget _userAddress() {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.17),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextFormField(
              cursorColor: Colors.black45,
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
                labelText: "User Email Id",
                hintText: "User Email Id",
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
              height: 10,
            ),
            RaisedButton(
              onPressed: () async {
                _formKey.currentState.save();
                if (_formKey.currentState.validate()) {
                  FocusScope.of(context).unfocus();
                  await databaseReference
                      .child(email.split("@")[0])
                      .set({"request": true});
                  requestedCheck(email);
                  setState(() {
                    askUserAddress = false;
                  });
                }
              },
              color: Colors.amber,
              child: Text(
                "Request",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
