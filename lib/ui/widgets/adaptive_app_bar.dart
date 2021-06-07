import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class AdaptiveAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AdaptiveAppBar({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  final String titleText;

  @override
  _AdaptiveAppBarState createState() => _AdaptiveAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _AdaptiveAppBarState extends State<AdaptiveAppBar> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isMacOS) {
      return PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: MoveWindow(
          child: AppBar(
            toolbarHeight: AppBar().toolbarHeight,
            title: Text(widget.titleText),
          ),
        ),
      );
    } else {
      final textColor = Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black;
      return AppBar(
        title: Text(
          widget.titleText,
          style: TextStyle(
            color: textColor,
          ),
        ),
      );
    }
  }
}
