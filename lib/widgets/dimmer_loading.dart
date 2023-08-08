import 'package:flutter/material.dart';

class FullScreenDimmer extends StatelessWidget {
  const FullScreenDimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
