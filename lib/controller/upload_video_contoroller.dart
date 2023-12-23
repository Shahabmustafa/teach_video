import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/model/video_model.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress_plus/video_compress_plus.dart';

class UploadVideoController extends GetxController{

  static UploadVideoController instance = Get.find();

  var uuid = Uuid();

  // compress thumbnail
  Future<File> _getThumb(String videoPath)async{
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }


  // upload thumbnail to storage
  Future<String> _uploadThumbToStorage(String id,String videoPath)async{
    Reference reference = FirebaseStorage.instance.ref().child("thumbnail").child(id);
    UploadTask uploadTask = reference.putFile(await _getThumb(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadURl = await snapshot.ref.getDownloadURL();
    return downloadURl;
  }


  // upload video firebasefirestore
  uploadVideo(String songName,String caption,String videoPath)async{
    try{
      String uid = FirebaseAuth.instance.currentUser!.uid;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection("user").doc(uid).get();
      String id = uuid.v1();
      String videoURL = await _uploadVideoToStorage(id,videoPath);

      String thumbnail = await _uploadThumbToStorage(id,videoPath);


      VideoModel videoModel = VideoModel(
          uid: uid,
          id: id,
          userName: (userDoc.data()! as Map<String,dynamic>)["name"],
          caption: caption,
          commentsCount: 0,
          likes: [],
          profilePic: (userDoc.data()! as Map<String,dynamic>)["profilePhoto"],
          shareCount: 0,
          songName: songName,
          videoUrl: videoURL,
          thumbnail: thumbnail,
      );

      print("videoModel ??????>>>>>>><<>>>>>>??????????????????????$videoModel");
      await FirebaseFirestore.instance.collection("videos").doc(id).set(videoModel.toJson()).then((value){
        Get.snackbar("Date Add", "Your Video Sucessfully Upload");
        Get.back();
      }).onError((error, stackTrace){
        Get.snackbar("Data Error", error.toString());
      });
    }catch(e){
      Get.snackbar("Video Upload Error", e.toString());
    }
  }

  // upload video to storage
  Future<String> _uploadVideoToStorage(String videoID,String videoPath)async{
    Reference reference = FirebaseStorage.instance.ref().child("videos").child(videoID);
    UploadTask uploadTask = reference.putFile(await _compressVideo(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadURl = await snapshot.ref.getDownloadURL();
    return downloadURl;
  }

  // video compress
  _compressVideo(String videoPath)async{
    final compressVideo = await VideoCompress.compressVideo(videoPath,quality: VideoQuality.MediumQuality);
    return compressVideo!.file;
  }
}