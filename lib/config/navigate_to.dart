import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget where) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => where),
  );
}


void navigatePushAndRemoveUtilTo(BuildContext context, Widget where) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => where),
    (route) => false,
  );
}
