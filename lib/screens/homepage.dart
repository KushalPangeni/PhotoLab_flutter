// import 'package:flex_color_picker/flex_color_picker.dart';
// import 'package:flutter/material.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
// // Color for the picker shown in Card on the screen.
//   late Color screenPickerColor = Colors.blue;
//   // Color for the picker in a dialog using onChanged.
//   late Color dialogPickerColor = Colors.blue;
//   // Color for picker using the color select dialog.
//   late Color dialogSelectColor = Colors.blue;

//   @override
//   void initState() {
//     super.initState();
//     screenPickerColor = Colors.blue; // Material blue.
//     dialogPickerColor = Colors.red; // Material red.
//     dialogSelectColor = const Color(0xFFA239CA); // A purple color.
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             ListView(
//               shrinkWrap: true,
//               padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
//               children: <Widget>[
//                 // Show the selected color.
//                 ListTile(
//                   title: const Text('Select color below to change this color'),
//                   subtitle: Text(
//                     '${ColorTools.materialNameAndCode(screenPickerColor)} '
//                     'aka ${ColorTools.nameThatColor(screenPickerColor)}',
//                     style: TextStyle(color: screenPickerColor),
//                   ),
//                   trailing: ColorIndicator(
//                     width: 44,
//                     height: 44,
//                     borderRadius: 22,
//                     color: screenPickerColor,
//                   ),
//                 ),
//               ],
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   showModalBottomSheet(
//                     isScrollControlled: true,
//                     context: context,
//                     builder: (context) {
//                       return Wrap(children: [
//                         Padding(
//                           padding: const EdgeInsets.all(6),
//                           child: Card(
//                             elevation: 2,
//                             child: ColorPicker(
//                               // Use the screenPickerColor as start color.
//                               color: screenPickerColor,
//                               // Update the screenPickerColor using the callback.
//                               onColorChanged: (Color color) => setState(() => screenPickerColor = color),
//                               width: 44,
//                               height: 44,
//                               borderRadius: 22,
//                               heading: Text(
//                                 'Select color',
//                                 style: Theme.of(context).textTheme.headlineSmall,
//                               ),
//                               subheading: Text(
//                                 'Select color shade',
//                                 style: Theme.of(context).textTheme.titleSmall,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ]);
//                     },
//                   );
//                 },
//                 child: const Text("Choose color")),
//           ],
//         ),
//       ),
//     );
//   }
// }
