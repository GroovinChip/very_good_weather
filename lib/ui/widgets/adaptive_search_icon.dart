import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveSearchIcon extends StatelessWidget {
  const AdaptiveSearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return Icon(CupertinoIcons.search);
    } else {
      return Icon(Icons.search);
    }
  }
}
