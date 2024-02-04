// ignore_for_file: prefer_const_constructors

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/color_filter_provider.dart';
import 'package:provider/provider.dart';

Widget colorIcon(BuildContext context, IconData icon) {
  Color screenPickerColor = Colors.blue;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Wrap(children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Card(
                      elevation: 2,
                      child: ColorPicker(
                        // Use the screenPickerColor as start color.
                        color: screenPickerColor,
                        // Update the screenPickerColor using the callback.
                        onColorChanged: (Color color) {
                          // screenPickerColor = color;
                          Provider.of<ColorFilterProvider>(context, listen: false).setColors(color);
                        },
                        width: 44,
                        height: 44,
                        borderRadius: 22,
                        heading: Text(
                          'Select color',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        subheading: Text(
                          'Select color shade',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                ]);
              },
            );
          },
          child: Column(
            children: [
              Icon(
                icon,
                size: 38,
              ),
              Text("Colors")
            ],
          ),
        )
      ],
    ),
  );
}


              // showModalBottomSheet(
              //   context: context,
              //   builder: (BuildContext context) {
              //     // Set the desired height here (50 in this case)
              //     double desiredHeight = 115;
              //     return Container(
              //       height: desiredHeight,
              //       child: ListView(
              //         physics: const BouncingScrollPhysics(),
              //         scrollDirection: Axis.horizontal,
              //         children: [
              //           SizedBox(width: 15),
              //           GestureDetector(
              //             onTap: () {
              //               Provider.of<ColorFilterProvider>(context, listen: false).setColors(a);
              //             },
              //             child: Icon(
              //               Icons.color_lens,
              //               color: a,
              //               size: 38,
              //             ),
              //           ),
              //           SizedBox(width: 15),
              //           GestureDetector(
              //             onTap: () {
              //               Provider.of<ColorFilterProvider>(context, listen: false).setColors(b);
              //             },
              //             child: Icon(
              //               Icons.color_lens,
              //               color: b,
              //               size: 38,
              //             ),
              //           ),
              //           SizedBox(width: 15),
              //           GestureDetector(
              //             onTap: () {
              //               Provider.of<ColorFilterProvider>(context, listen: false).setColors(c);
              //             },
              //             child: Icon(
              //               Icons.color_lens,
              //               color: c,
              //               size: 38,
              //             ),
              //           ),
              //           SizedBox(width: 15),
              //           GestureDetector(
              //             onTap: () {
              //               Provider.of<ColorFilterProvider>(context, listen: false).setColors(Colors.amber);
              //             },
              //             child: Icon(
              //               Icons.color_lens,
              //               color: Colors.amber,
              //               size: 38,
              //             ),
              //           ),
              //           SizedBox(width: 15),
              //           GestureDetector(
              //             onTap: () {
              //               Provider.of<ColorFilterProvider>(context, listen: false).setColors(Colors.amber);
              //             },
              //             child: Icon(
              //               Icons.color_lens,
              //               color: Colors.amber,
              //               size: 38,
              //             ),
              //           ),
              //           SizedBox(width: 15),
              //           GestureDetector(
              //             onTap: () {
              //               Provider.of<ColorFilterProvider>(context, listen: false).setColors(Colors.amber);
              //             },
              //             child: Icon(
              //               Icons.color_lens,
              //               color: Colors.amber,
              //               size: 38,
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // );

              //---------------------------------------
