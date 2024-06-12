import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBackBtn extends StatelessWidget {

  final double size;

  const AppBackBtn({super.key,
    this.size = 24
    });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios_new_outlined,
        size: size,
        color: Colors.white,
      ),
    );
  }



}