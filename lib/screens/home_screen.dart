import 'package:etec_ds/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Gera o cumprimento de acordo com a hora do dia
  String getGreeting() {
    final now = DateTime.now();
    String greeting = 'Bom dia';

    // entre 12h e 17h59 - tarde
    if (now.hour >= 12 && now.hour < 18) {
      greeting = 'Boa tarde';
    }
    // entre 18h e 23h59 - noite
    else if (now.hour >= 18 && now.hour <= 23) {
      greeting = 'Boa noite';
    }

    return greeting;
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _nome;

  @override
  void initState() {
    super.initState();

    _nome =
        _prefs.then((SharedPreferences prefs) => prefs.getString('nome') ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40))),
          padding: const EdgeInsets.fromLTRB(40, 100, 40, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: _nome,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();
                      default:
                        return Text(
                          'Olá ${snapshot.data.toString().split(' ')[0]}',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 48),
                        );
                    }
                  }),
              Text(
                getGreeting(),
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        const SizedBox(height: 40),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Conteúdo do curso',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 32)),
              const SizedBox(
                height: 20,
              ),
              LayoutGrid(
                columnSizes: [1.fr, 1.fr],
                rowSizes: const [auto, auto],
                columnGap: 20,
                rowGap: 20,
                children: [
                  HomeButton(
                      text: 'Desenvolvimento Web',
                      image: Image.asset('assets/images/des_web.png',
                          height: 100)),
                  HomeButton(
                      text: 'Design Digital',
                      image: Image.asset(
                        'assets/images/des_digital.png',
                        height: 100,
                      )),
                  HomeButton(
                      text: 'Banco de Dados',
                      image: Image.asset('assets/images/bd.png', height: 100)),
                  HomeButton(
                      text: 'Algoritmos',
                      image: Image.asset(
                        'assets/images/alg.png',
                        height: 100,
                      )),
                ],
              )
            ],
          ),
        ))
      ]),
    ));
  }
}

class HomeButton extends StatelessWidget {
  final String text;
  final Image image;
  HomeButton({super.key, required this.text, required this.image});

  static TextStyle initStyle(
          Color color, double fontSize, FontWeight fontWeight) =>
      GoogleFonts.montserrat(
          height: 1.2,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight);

  final TextStyle titleStyle = initStyle(Colors.black, 16, FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 7))
              ]),
          child: Column(
            children: [
              image,
              const SizedBox(height: 20),
              SizedBox(
                height: titleStyle.fontSize! * titleStyle.height! * 2,
                child:
                    Text(text, textAlign: TextAlign.center, style: titleStyle),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
