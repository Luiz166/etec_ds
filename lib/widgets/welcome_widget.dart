import 'package:etec_ds/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({super.key});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget>
    with TickerProviderStateMixin {
  bool didTap = false;

  late AnimationController animationController;
  late Animation<double> opacityTween;
  late Animation<double> transformTween;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        lowerBound: 0,
        upperBound: 1);

    opacityTween = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController.view, curve: Curves.ease));
    transformTween = Tween<double>(begin: 350, end: 0).animate(
        CurvedAnimation(parent: animationController.view, curve: Curves.ease));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animationController.forward();
    });
  }

  Widget _buildContent() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 320,
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.white),
      child: Column(children: [
        Text('Deseja saber mais sobre o curso de DS?',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        Text('DS = Desenvolvimento de Sistemas',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                color: const Color(0xFFAAAAAA),
                fontSize: 18)),
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Button(() {
              animationController.reverse().whenComplete(() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
              });
            })
          ],
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 30,
        child: AnimatedBuilder(
          animation: animationController,
          child: _buildContent(),
          builder: (context, child) => Transform.translate(
            offset: Offset(0.0, transformTween.value),
            child: Opacity(
              opacity: opacityTween.value,
              child: child,
            ),
          ),
        ));
  }
}

class _Button extends StatelessWidget {
  final void Function() onTap;
  const _Button(this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        decoration: BoxDecoration(
            color: const Color(0xFF7455F6),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Row(
          children: [
            Text(
              'Sim!',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            ),
            const SizedBox(width: 20),
            const FaIcon(
              FontAwesomeIcons.arrowRight,
              color: Colors.white,
            )
          ],
        )),
      ),
    );
  }
}
