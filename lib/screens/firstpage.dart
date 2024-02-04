import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/color_filter_provider.dart';
import 'package:flutter_application_1/providers/opacity_provider.dart';
import 'package:flutter_application_1/screens/photo_edit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Photo Lab"),
        ),
        body: IconButton(
          onPressed: () {
            Provider.of<ColorFilterProvider>(context, listen: false).setColors(Colors.transparent);
            Provider.of<ColorFilterProvider>(context, listen: false).setBlendMode(BlendMode.color);
            Provider.of<OpacityProvider>(context, listen: false).setOpacity(1);
            Navigator.push(context, PageTransition(child: const PhotoEditor(), type: PageTransitionType.rightToLeft));
          },
          icon: const Column(
            children: [
              Icon(
                Icons.add_a_photo,
                size: 55,
              ),
              Text(
                "Photo Editor",
                style: TextStyle(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
