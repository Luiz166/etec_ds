import 'package:etec_ds/components/welcome_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xff5430F4), Color(0xffB4A4FA)])),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          SvgPicture.asset(
            "assets/images/logo.svg",
            width: MediaQuery.of(context).size.width * 0.85,
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(
            height: 90,
          ),
          const WelcomeBlock(),
          const SizedBox(
            height: 30,
          )
        ]),
      ),
    );
  }
}
