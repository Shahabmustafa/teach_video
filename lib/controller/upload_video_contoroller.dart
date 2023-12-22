import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UploadVideoController extends GetxController{

  uploadVideo(String songName,String caption,String videoPath)async{
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot userDoc = await
  }
}