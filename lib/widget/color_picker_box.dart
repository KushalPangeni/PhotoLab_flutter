// import 'package:flex_color_picker/flex_color_picker.dart';
// import 'package:flutter/material.dart';

// Widget colorBox(BuildContext context,Color screenPickerColor){
//   return SizedBox(
//               width: double.infinity,
//               child: Padding(
//                 padding: const EdgeInsets.all(6),
//                 child: Card(
//                   elevation: 2,
//                   child: ColorPicker(
//                     // Use the screenPickerColor as start color.
//                     color: screenPickerColor,
//                     // Update the screenPickerColor using the callback.
//                     onColorChanged: (Color color) => setState(() => screenPickerColor = color),
//                     width: 44,
//                     height: 44,
//                     borderRadius: 22,
//                     heading: Text(
//                       'Select color',
//                       style: Theme.of(context).textTheme.headlineSmall,
//                     ),
//                     subheading: Text(
//                       'Select color shade',
//                       style: Theme.of(context).textTheme.titleSmall,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
// }