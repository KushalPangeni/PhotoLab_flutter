import 'package:flutter/material.dart';

Widget cropIcon(BuildContext context, IconData icon) {
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
                double desiredHeight = 150;

                return SizedBox(
                    height: desiredHeight,
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        const Text("Height"),
                        Slider(min: 0.2, value: 1.0, onChanged: (value) {}),
                        const Text("Width"),
                        Slider(min: 0.2, value: 1.0, onChanged: (value) {})
                      ],
                    ));
              },
            );
          },
          child: Icon(
            icon,
            size: 38,
          ),
        )
      ],
    ),
  );
}
