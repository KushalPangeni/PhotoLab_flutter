import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/color_filter_provider.dart';
import 'package:flutter_application_1/providers/opacity_provider.dart';
import 'package:flutter_application_1/screens/photo_edit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

String name = "Your name";

class _FirstPageState extends State<FirstPage> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8, 8, 0),
                child: Text(
                  "Photo Lab",
                  style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 26),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Hi There,",
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.orange[100], fontSize: 30),
              ),
              InkWell(
                onTap: () {
                  openDialogBox();
                },
                child: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.w500, color: Colors.orange[100], fontSize: 26),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "1. Photo Editor",
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Provider.of<ColorFilterProvider>(context, listen: false).setColors(Colors.transparent);
                    Provider.of<ColorFilterProvider>(context, listen: false).setBlendMode(BlendMode.color);
                    Provider.of<OpacityProvider>(context, listen: false).setOpacity(1);
                    Navigator.push(
                        context, PageTransition(child: const PhotoEditor(), type: PageTransitionType.rightToLeft));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 4),
                    child: Container(
                      height: 130,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.orange.shade50, Colors.orange.shade50]),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.add_a_photo,
                            size: 70,
                            color: Colors.black,
                          ),
                          Text(
                            "Photo Editor",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Edit like Pro",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "2. Other features coming soon...",
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = nameController.text;
      log(name);
      pref.setString("Name", name);
    });
  }

  void getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      if (pref.getString("Name") == null) {
        log("Is null");
        pref.setString("Name", name);
        name = pref.getString("Name") ?? name;
      }
      log("Is not null");
      name = pref.getString("Name") ?? name;
      log(name);
    });
  }

  void openDialogBox() {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            AlertDialog(
              backgroundColor: Colors.transparent,
              title: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                // height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Change your name',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        maxLength: 15,
                        controller: nameController,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () async {
                          changeName();
                        },
                        child: const Text("Okay"),
                      ),
                    )
                  ],
                ),
              ),
              elevation: 10,
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getName();
  }
}
