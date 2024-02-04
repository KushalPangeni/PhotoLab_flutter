import 'package:flutter/material.dart';

Widget fontIcon(BuildContext context, IconData icon) {
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
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: const [
                      SizedBox(width: 15),
                      Icon(
                        Icons.color_lens,
                        size: 38,
                      ),
                    ],
                  ),
                );
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
