import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveSettingsIcon extends StatelessWidget {
  const AdaptiveSettingsIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return Icon(CupertinoIcons.settings);
    } else {
      return Icon(Icons.settings);
    }
  }
}
