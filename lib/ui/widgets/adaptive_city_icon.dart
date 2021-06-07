import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveCityIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return Icon(CupertinoIcons.building_2_fill);
    } else {
      return Icon(Icons.location_city);
    }
  }
}
