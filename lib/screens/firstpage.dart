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
          centerTitle: true,
          title: const Text(
            "Photo Lab",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Provider.of<ColorFilterProvider>(context, listen: false).setColors(Colors.transparent);
              Provider.of<ColorFilterProvider>(context, listen: false).setBlendMode(BlendMode.color);
              Provider.of<OpacityProvider>(context, listen: false).setOpacity(1);
              Navigator.push(context, PageTransition(child: const PhotoEditor(), type: PageTransitionType.rightToLeft));
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(8.0, 4, 8, 4),
              child: SizedBox(
                height: 120,
                child: Column(
                  children: [
                    Icon(
                      Icons.add_a_photo,
                      size: 70,
                      // color: Colors.blue,
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
      ),
    );
  }
}
