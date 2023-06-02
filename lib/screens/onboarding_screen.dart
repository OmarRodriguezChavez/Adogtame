import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:proyectofinal_cont_rdz/card.dart';
import '../responsive.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final data = [
    CardtecnmData(
      title: "Adogtame",
      subtitle:
          "Perros Esperando un Hogar Aquí. Encuentra Tu Mascota Ideal.",
      image: const AssetImage("assets/cora.png"),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      titleColor: Color.fromARGB(255, 0, 0, 0),
      subtitleColor: Color.fromARGB(255, 8, 7, 7),
      background: LottieBuilder.asset("assets/animations/background.json"),
    ),
    CardtecnmData(
      title: "Centro de adopción de perros",
      subtitle:
          "¡No Compres, Adopta! Cientos de Perros Todas las Razas.",
      image: const AssetImage("assets/pirito1.png"),
      backgroundColor: Color.fromARGB(255, 207, 183, 211),
      titleColor: Color.fromARGB(255, 86, 33, 104),
      subtitleColor: Color.fromARGB(255, 0, 0, 0),
      background: LottieBuilder.asset("assets/animations/background.json"),
    ),
    CardtecnmData(
      title: "Protección animal",
      subtitle:
          "¡Encuentra el Tuyo Hoy! Esterilizados. Adopta Hoy. Sanos. Vacunados.",
      image: const AssetImage("assets/pirito3.png"),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      titleColor: Color.fromARGB(255, 89, 39, 116),
      subtitleColor: Color.fromARGB(255, 0, 0, 0),
      background: LottieBuilder.asset("assets/animations/background.json"),
    ),
    
    CardtecnmData(
      title: "¡Registrate!",
      subtitle: "Entra ya a nuestra aplicación y conoce más, presiona el botón",
      image: const AssetImage("assets/login1.png"),
      backgroundColor: Color.fromARGB(255, 229, 240, 218),
      titleColor: Color.fromARGB(255, 13, 15, 143),
      subtitleColor: Color.fromARGB(255, 0, 0, 0),
      background: LottieBuilder.asset("assets/animations/background.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Responsive(
        mobile: ConcentricPageView(
          colors: data.map((e) => e.backgroundColor).toList(),
          verticalPosition: 0.73,
          itemCount: data.length,
          itemBuilder: (int index) {
            return Cardtecnm(data: data[index]);
          }
          /*itemBuilder: (int index, double value) {
          return Cardtecnm(data: data[index]);
        }*/
          ,
          onFinish: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
        desktop: ConcentricPageView(
          colors: data.map((e) => e.backgroundColor).toList(),
          verticalPosition: 0.85,
          radius: 1000,
          itemCount: data.length,
          itemBuilder: (int index) {
            return Cardtecnm(data: data[index]);
          },
          onFinish: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
      ),
    );
  }
}