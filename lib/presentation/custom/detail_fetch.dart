import 'package:flutter/material.dart';
import 'package:travelpad/animation/flare_animation/flare_animation.dart';

class DetailFetch extends StatelessWidget {
  final String text;
  final bool isLeft;
  final Function onTap;

  DetailFetch({
    @required this.text,
    this.isLeft = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(isLeft ? 0 : 12),
              bottomRight: Radius.circular(!isLeft ? 0 : 12),
              topLeft: Radius.circular(isLeft ? 0 : 12),
              topRight: Radius.circular(!isLeft ? 0 : 12),
            )),
        width: width * 0.6,
        height: height * 0.07,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            !isLeft
                ? Flexible(
                    child: FlareAnimation(
                      callback: (String value) {},
                      image: "assets/Blue-Check.flr",
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.only(
                left: isLeft ? width * 0.05 : 0,
                right: isLeft ? 0 : width * 0.05,
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            isLeft
                ? Flexible(
                    child: FlareAnimation(
                      callback: (String value) {},
                      image: "assets/Blue-Check.flr",
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
