import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SimpleCameraExample extends StatefulWidget {
  const SimpleCameraExample({super.key});

  @override
  State<SimpleCameraExample> createState() => _SimpleCameraExampleState();
}

class _SimpleCameraExampleState extends State<SimpleCameraExample> {
  File? photo;
  final ImagePicker picker = ImagePicker();
  //bottom sheet dialog for select gallery or camera
  void ShowBottomSheetDialog(context){
    showModalBottomSheet(context: context,
        builder: (BuildContext bc)
    {
      return SafeArea(child: Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.photo_library_rounded),
            title: Text("Gellery"),
            onTap: (){
               imgFromGallery();
               Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_camera),
            title: Text("Camera"),
            onTap: (){
              imgFromCamere();
              Navigator.of(context).pop();
            },
          )
        ],
      )
      );
    });
  }

  //for taking image from galler
  Future imgFromGallery()async{
    final pickeFile = await picker.pickImage(
        source:ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
      imageQuality: 100,
    );
    setState(() {
      if(pickeFile != null)
      {
        photo =  File(pickeFile.path);
      }
      else{
        log('no_image_selected');
        //print("no Image selected");
      }
    });
  }
  //for taking image from camera
  Future imgFromCamere() async{
    final pickeFile = await picker.pickImage(
        source: ImageSource.camera,
      maxHeight: 300,
        maxWidth: 300,
      imageQuality: 100,
    );
    setState(() {
      if(pickeFile != null)
        {
          photo =  File(pickeFile.path);
        }
      else{
        log('no_image_selected');
        //print("no Image selected");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            photo != null ? 
                Image.file(photo!,
          fit: BoxFit.cover,
           width: 300,
           height: 300,
           ) :
            Image.asset("assets/images/images.png",
            fit: BoxFit.fitWidth,
               width: MediaQuery.sizeOf(context).width,
               height: MediaQuery.sizeOf(context).height/2,
            ),
            SizedBox(height: 21,),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  onPressed: (){
                    ShowBottomSheetDialog(context);
              }, child: Text("take pic")),
            )
          ],
        ),
      ),
    );
  }
}
