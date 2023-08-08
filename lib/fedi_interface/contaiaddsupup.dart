import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Liste_Cont.dart';

class Gerer extends StatelessWidget {
  final String? title;

  const Gerer({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      height: size.height * 0.8,
      width: size.width * 0.9,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(
                Icons.settings,
                color: Color(0xFFFF5400),
              ),
              const SizedBox(width: 16),
              Text(
                title ?? "",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Expanded(
            child: ContList(),
          ),
        ],
      ),
    );
  }
}
