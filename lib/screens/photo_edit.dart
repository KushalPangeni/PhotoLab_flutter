// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/color_filter_provider.dart';
import 'package:flutter_application_1/providers/opacity_provider.dart';
import 'package:flutter_application_1/widget/blend_mode.dart';
import 'package:flutter_application_1/widget/color_picker.dart';
import 'package:flutter_application_1/widget/opacity.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

class PhotoEditor extends StatefulWidget {
  const PhotoEditor({super.key});

  @override
  State<PhotoEditor> createState() => _PhotoEditorState();
}

class _PhotoEditorState extends State<PhotoEditor> {
  ScreenshotController screenshotController = ScreenshotController();
  final imagePicker = ImagePicker();
  Uint8List? _image;
  XFile? selectedImage;

  late Color screenPickerColor = Colors.blue;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            //Image here
            _image != null
                ? Screenshot(
                    controller: screenshotController,
                    child: Stack(
                      children: [
                        Container(
                          // width: double.infinity,
                          height: MediaQuery.sizeOf(context).height - 200,
                          color: Colors.transparent,
                          // radius: 100,
                          child: Consumer<ColorFilterProvider>(
                            builder: (context, _, child) => Consumer<OpacityProvider>(
                              builder: (context, opacity, child) => Opacity(
                                opacity: 1,
                                child: ColorFiltered(
                                  colorFilter: _.srgbToLinearGammaCheck
                                      ? const ColorFilter.srgbToLinearGamma()
                                      : ColorFilter.mode(
                                          _.color == Colors.transparent
                                              ? _.color
                                              : _.color.withOpacity(opacity.opacity),
                                          _.blendmode),
                                  // colorFilter: ColorFilter.mode(_.color.withOpacity(opacity.opacity), _.blendmode),
                                  child: InteractiveViewer(
                                    child: Image.memory(
                                      _image!,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Consumer<TextProvider>(
                        //   builder: (context, _, child) => Text(
                        //     _.text,
                        //     style: TextStyle(fontSize: 25, color: _.color),
                        //   ),
                        // )
                      ],
                    ),
                  )
                : SizedBox(height: MediaQuery.sizeOf(context).height / 2 - 100),

            //Change Image button here
            _image != null
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            log('Select Image clicked');
                            final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
                            if (pickedImage != null) {
                              log(pickedImage.path.toString());
                              final image = await XFile(pickedImage.path).readAsBytes();
                              setState(() {
                                _image = image;
                              });
                            }
                          },
                          child: const Text("Change Image"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final image = await screenshotController.capture();
                            if (_image == null) return;
                            await saveImagee(image);
                          },
                          child: const Text("Save Image"),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            log('Select Image clicked');
                            final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
                            if (pickedImage != null) {
                              log(pickedImage.path.toString());
                              final image = await XFile(pickedImage.path).readAsBytes();
                              setState(() {
                                _image = image;
                              });
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.add_a_photo, size: 80),
                          ),
                        ),
                      ],
                    ),
                  ),
            const Spacer(),
            //Editing options
            Container(
              height: 100,
              color: Colors.white,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  colorIcon(context, Icons.color_lens),
                  // fontIcon(context, Icons.font_download_outlined),
                  opacityIcon(context, Icons.opacity_rounded),
                  blendIcon(context, Icons.color_lens, _image),
                  Consumer<ColorFilterProvider>(
                    builder: (context, _, child) => InkWell(
                        onTap: () {
                          if (_.srgbToLinearGammaCheck) {
                            _.srgbCheck(false);
                          } else {
                            _.srgbCheck(true);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Center(
                                  child: Icon(
                                _.srgbToLinearGammaCheck ? Icons.color_lens_outlined : Icons.color_lens_sharp,
                                size: 38,
                              )),
                              const Text("SRGB")
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Future<String> saveImagee(Uint8List? image) async {
    PermissionStatus status = await Permission.storage.request();

    final time = DateTime.now().toIso8601String().replaceAll('.', '-').replaceAll(':', '-');
    final name = 'screenshot_$time';
    if (status.isGranted) {
      final result = await ImageGallerySaver.saveImage(image!, name: name);
      return result['filePath'];
    } else if (status.isDenied) {
      return "Denied";
    } else if (status.isPermanentlyDenied) {
      return "Permanently Denied";
    } else {
      return "";
    }
  }
}
