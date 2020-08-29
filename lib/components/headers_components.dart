import 'package:flutter/material.dart';
import '../utilities/styles.dart';
import '../utilities/constants.dart';

class AppBarHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        headerTitle,
        style: TextStyle(
          fontFamily: 'Kanit',
          fontWeight: FontWeight.w900,
          fontSize: 25.0,
        ),
      ),
      backgroundColor: blue700,
    );
  }
}
