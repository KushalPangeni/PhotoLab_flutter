import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/firstpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  double percent = 0;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.orange.shade100, Colors.white]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              RotationTransition(
                  turns: animation,
                  child: Image.asset(
                    'assets/logo.jpg',
                    height: 130,
                  )),
              const SizedBox(height: 40),
              SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 7.0,
                        color: Colors.white,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Center(
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FlickerAnimatedText('Photo Lab',
                            textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 26)),
                        FlickerAnimatedText("Made by kushal..",
                            textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 26)),
                        FlickerAnimatedText('In Flutter',
                            textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 26)),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // LinearPercentIndicator(
              //   lineHeight: 20,
              //   percent: percent / 100,
              //   progressColor: Colors.deepPurple.shade300,
              //   backgroundColor: Colors.deepPurple.shade100,
              //   animation: true,
              //   barRadius: const Radius.circular(50),
              //   // trailing: Text(percent.toString()),
              // ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  // changeProgress() {
  //   Future.delayed(const Duration(seconds: 1)).then((value) {
  //     setState(() {
  //       percent += 15;
  //     });
  //     if (percent < 100) {
  //       changeProgress();
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // changeProgress();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.repeat();

    Future.delayed(const Duration(seconds: 8)).then(
      (value) {
        //Here we will wait for 5 seconds
        //After 5 second it will go to HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FirstPage(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
