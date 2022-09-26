import 'package:etec_ds/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _savePrefs(String nome) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('nome', nome);
  }

  final TextEditingController nomeController = TextEditingController();

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
          Text(
            'Primeiro precisamos do seu nome e número do celular',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          TextFormField(
            controller: nomeController,
            decoration: InputDecoration(
                fillColor: const Color(0xfff1efef),
                contentPadding: const EdgeInsets.all(20),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: 'Nome Completo',
                filled: true,
                hintStyle: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffAAAAAA))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                fillColor: const Color(0xfff1efef),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: 'Número de celular',
                filled: true,
                hintStyle: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffAAAAAA))),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  final navigator = Navigator.of(context);
                  await _savePrefs(nomeController.text);

                  navigator.push(MaterialPageRoute(
                      builder: (context) => const MainScreen()));
                },
                child: Container(
                    padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7455F6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Continuar',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
