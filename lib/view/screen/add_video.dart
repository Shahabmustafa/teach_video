import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_button/flutter_social_media_button.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../widget/glitch.dart';
import 'addcaption_screen.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({Key? key}) : super(key: key);

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {

  pickImage(BuildContext context,ImageSource imageSource)async{
    final pick = await ImagePicker().pickVideo(source: imageSource);
    if(pick != null){
      Get.snackbar("Video Select",pick.path);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> addCaption_Screen(videoFile: File(pick.path), videoPath: pick.path)));
    }else{
      Get.snackbar("Video Error", "Please Select Your Video");
    }
  }
  showDil(BuildContext context){
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: (){
                pickImage(context,ImageSource.camera);
              },
              child: const Text("Camera"),
            ),
            SimpleDialogOption(
              onPressed: (){
                pickImage(context,ImageSource.gallery);
              },
              child: const Text("Gellery"),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => showDil(context),
              child: GlithEffect(
                child: Center(
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Add Video",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
