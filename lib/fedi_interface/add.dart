import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  final VoidCallback? onTap;

  const Add({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return SafeArea(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding:
              EdgeInsets.only(right: size.width * 0.1, top: size.height * 0.2),
          child: Container(
            alignment: Alignment.topRight,
            child: const CircleAvatar(child: Icon(Icons.add)),
          ),
        ),
      ),
    );
  }
}
