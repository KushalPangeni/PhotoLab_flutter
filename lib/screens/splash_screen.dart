import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/firstpage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double percent = 0;
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
              // Image.asset('assets/icon.png'),
              const Icon(
                Icons.add_a_photo,
                size: 70,
              ),
              const SizedBox(height: 20),
              // DefaultTextStyle(
              //   style: const TextStyle(
              //     fontSize: 20.0,
              //   ),
              //   child: AnimatedTextKit(
              //     animatedTexts: [
              //       WavyAnimatedText('Photo Lab',
              //           textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 26)),
              //       WavyAnimatedText('Edit like Pro',
              //           textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 26)),
              //     ],
              //     isRepeatingAnimation: true,
              //     onTap: () {
              //       print("Tap Event");
              //     },
              //   ),
              // ),
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
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
              ),

              const Spacer(),
              LinearPercentIndicator(
                lineHeight: 20,
                percent: percent / 100,
                progressColor: Colors.deepPurple.shade300,
                backgroundColor: Colors.deepPurple.shade100,
                animation: true,
                barRadius: const Radius.circular(50),
                // trailing: Text(percent.toString()),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  changeProgress() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        percent += 10;
      });
      if (percent < 100) {
        changeProgress();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    changeProgress();

    //Load AppOpen Ad
    //Show AppOpen Ad After 8 Seconds
    Future.delayed(const Duration(seconds: 10)).then(
      (value) {
        //Here we will wait for 8 seconds to load our ad
        //After 8 second it will go to HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FirstPage(),
          ),
        );
      },
    );
  }
}
