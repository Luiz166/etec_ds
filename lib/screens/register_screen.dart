import 'package:etec_ds/utils/app_colors.dart';
import 'package:etec_ds/widgets/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScrenState();
}

class _RegisterScrenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  bool didTap = false;

  late AnimationController animationController;
  late Animation<double> opacityTween;
  late Animation<double> transformTween;
  late Animation<double> logoTween;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        lowerBound: 0,
        upperBound: 1);

    opacityTween = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController.view,
        curve: const Interval(0.5, 1, curve: Curves.ease)));
    transformTween = Tween<double>(begin: 350, end: 0).animate(CurvedAnimation(
        parent: animationController.view,
        curve: const Interval(0.5, 1, curve: Curves.ease)));
    logoTween = Tween<double>(begin: 200, end: 640).animate(CurvedAnimation(
        parent: animationController.view,
        curve: const Interval(0, 0.5, curve: Curves.ease)));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Container(
                decoration:
                    const BoxDecoration(gradient: AppColors.backgroundGradient),
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return Positioned(
                            top: 100,
                            left:
                                (MediaQuery.of(context).size.width * 0.15) / 2 +
                                    transformTween.value,
                            child: Opacity(
                                opacity: opacityTween.value,
                                child: RegisterForm()));
                      }),
                  AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) => Positioned(
                        top: logoTween.value,
                        child: SvgPicture.asset(
                          "assets/images/logo.svg",
                          width: MediaQuery.of(context).size.width * 0.85,
                          fit: BoxFit.scaleDown,
                        )),
                  )
                ])))
      ],
    ));
  }
}
