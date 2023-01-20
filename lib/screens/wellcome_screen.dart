import 'package:educational_app_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(color: Colors.white),
        ),
        Container(
          height: height / 1.6,
          width: width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
              color: Color(0xFF674AEF)),
          child: Image.asset(
            'assets/images/books.png',
            scale: 1,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height / 2.666,
            width: width,
            decoration: const BoxDecoration(color: Color(0xFF674AEF)),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.only(top: 40),
            height: height / 2.666,
            width: width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
                color: Colors.white),
            child: Column(
              children: [
                const Text(
                  'Learning is Everthing',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2),
                ),
                SizedBox(height: height * 0.015),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                      'Learing with pleasure with Dear programmer, Whereever you are',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17, color: Colors.black.withOpacity(0.6))),
                ),
                SizedBox(height: height * 0.065),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.7,
                  height: height * 0.07,
                  decoration: BoxDecoration(
                      color: const Color(0xFF674AEF),
                      borderRadius: BorderRadius.circular(20)),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
                        return const HomeScreen();
                      })));
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
