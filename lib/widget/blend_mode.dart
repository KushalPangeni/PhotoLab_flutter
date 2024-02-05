import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/color_filter_provider.dart';
import 'package:provider/provider.dart';

Widget blendIcon(BuildContext context, IconData icon, Uint8List? image) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        InkWell(
          onTap: () {
            // showModalBottomSheet(
            //   isScrollControlled: true,
            //   context: context,
            //   builder: (context) {
            //     return Wrap(children: [
            //       Padding(
            //         padding: const EdgeInsets.all(6),
            //         child: Card(
            //           elevation: 2,
            //           child: ColorPicker(
            //             // Use the screenPickerColor as start color.
            //             color: screenPickerColor,
            //             // Update the screenPickerColor using the callback.
            //             onColorChanged: (Color color) {
            //               // screenPickerColor = color;
            //             },
            //             width: 44,
            //             height: 44,
            //             borderRadius: 22,
            //             heading: Text(
            //               'Select color',
            //               style: Theme.of(context).textTheme.headlineSmall,
            //             ),
            //             subheading: Text(
            //               'Select color shade',
            //               style: Theme.of(context).textTheme.titleSmall,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ]);
            //   },
            // );
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                // Set the desired height here (50 in this case)
                double desiredHeight = 155;
                return Wrap(
                  children: [
                    const SizedBox(height: 25),
                    const Center(
                      child: Text(
                        "Select some Colors to see changes",
                        style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      // padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      height: desiredHeight,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false).setBlendMode(BlendMode.color);
                              },
                              child: blendModeIcon(image, BlendMode.color)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.colorBurn);
                              },
                              child: blendModeIcon(image, BlendMode.colorBurn)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.colorDodge);
                              },
                              child: blendModeIcon(image, BlendMode.colorDodge)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false).setBlendMode(BlendMode.darken);
                              },
                              child: blendModeIcon(image, BlendMode.darken)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.difference);
                              },
                              child: blendModeIcon(image, BlendMode.difference)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false).setBlendMode(BlendMode.dst);
                              },
                              child: blendModeIcon(image, BlendMode.dst)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.dstATop);
                              },
                              child: blendModeIcon(image, BlendMode.dstATop)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false).setBlendMode(BlendMode.dstIn);
                              },
                              child: blendModeIcon(image, BlendMode.dstIn)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.dstOver);
                              },
                              child: blendModeIcon(image, BlendMode.dstOver)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.exclusion);
                              },
                              child: blendModeIcon(image, BlendMode.exclusion)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.hardLight);
                              },
                              child: blendModeIcon(image, BlendMode.hardLight)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false).setBlendMode(BlendMode.hue);
                              },
                              child: blendModeIcon(image, BlendMode.hue)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.lighten);
                              },
                              child: blendModeIcon(image, BlendMode.lighten)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.luminosity);
                              },
                              child: blendModeIcon(image, BlendMode.luminosity)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.modulate);
                              },
                              child: blendModeIcon(image, BlendMode.modulate)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.multiply);
                              },
                              child: blendModeIcon(image, BlendMode.multiply)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.overlay);
                              },
                              child: blendModeIcon(image, BlendMode.overlay)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false).setBlendMode(BlendMode.plus);
                              },
                              child: blendModeIcon(image, BlendMode.plus)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.saturation);
                              },
                              child: blendModeIcon(image, BlendMode.saturation)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false).setBlendMode(BlendMode.screen);
                              },
                              child: blendModeIcon(image, BlendMode.screen)),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                Provider.of<ColorFilterProvider>(context, listen: false)
                                    .setBlendMode(BlendMode.softLight);
                              },
                              child: blendModeIcon(image, BlendMode.softLight)),
                          const SizedBox(width: 15),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Column(
            children: [
              Icon(
                icon,
                size: 38,
              ),
              Text("Blend")
            ],
          ),
        )
      ],
    ),
  );
}

Widget blendModeIcon(Uint8List? image, BlendMode mode) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 25,
        width: 80,
        // color: Colors.amber,
        child: Stack(
          children: [
            if (image != null)
              Consumer<ColorFilterProvider>(
                builder: (context, _, child) => ColorFiltered(
                  colorFilter: ColorFilter.mode(_.color, mode),
                  child: InteractiveViewer(
                    child: Image.memory(
                      image,
                      fit: BoxFit.fill,
                    ),
                    // customSize: double.in,
                    // enableRotation: true,
                    // imageProvider: MemoryImage(_image!),
                  ),
                ),
              ),
            if (image == null) Center(child: Text("Select image first"))
          ],
        ),
      ));
}
