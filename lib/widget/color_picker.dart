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
                        color: screenPickerColor,
                        onColorChanged: (Color color) {
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
