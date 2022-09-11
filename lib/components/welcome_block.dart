import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeBlock extends StatelessWidget {
  const WelcomeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.white),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Deseja saber mais sobre o curso de DS?',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            Text('DS (Desenvolvimento de Sistemas)',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFAAAAAA),
                    fontSize: 16)),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
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
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
          ]),
    );
  }
}
