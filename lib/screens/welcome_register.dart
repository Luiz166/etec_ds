import 'package:etec_ds/components/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
        const SizedBox(
          height: 90,
        ),
        const RegisterForm(),
        const SizedBox(
          height: 50,
        ),
        SvgPicture.asset(
          "assets/images/logo.svg",
          width: MediaQuery.of(context).size.width * 0.70,
          fit: BoxFit.scaleDown,
        ),
        const SizedBox(
          height: 50,
        ),
      ]),
    ));
  }
}
