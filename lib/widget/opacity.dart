import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/opacity_provider.dart';
import 'package:provider/provider.dart';

Widget opacityIcon(BuildContext context, IconData icon) {
  // var provider = Provider.of<OpacityProvider>(context, listen: false);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                // Set the desired height here (50 in this case)
                double desiredHeight = 115;

                return SizedBox(
                    height: desiredHeight,
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        const Text(
                          "Opacity",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Change colors to see effects",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Consumer<OpacityProvider>(
                          builder: (context, _, child) => Slider(
                            value: _.opacity,
                            onChanged: (value) {
                              _.setOpacity(value);
                            },
                          ),
                        ),
                      ],
                    ));
              },
            );
          },
          child: Column(
            children: [
              Icon(
                icon,
                size: 38,
              ),
              const Text("Opacity")
            ],
          ),
        )
      ],
    ),
  );
}
