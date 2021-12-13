import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marvel_chars/core/constants/image/image_constants.dart';

class MarvelAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MarvelAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Image.asset(
        ImageConstants.splashImage,
        alignment: Alignment.center,
        height: 100,
        width: 100,
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }
}
