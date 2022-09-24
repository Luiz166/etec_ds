import 'package:etec_ds/widgets/welcome_widget.dart';
import 'package:etec_ds/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: ProjectColors.backgroundGradient),
              child: Stack(alignment: AlignmentDirectional.center, children: [
                Positioned(
                  top: 200,
                  child: SvgPicture.asset(
                    "assets/images/logo.svg",
                    width: MediaQuery.of(context).size.width * 0.85,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                const WelcomeWidget(),
                const SizedBox(
                  height: 30,
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
