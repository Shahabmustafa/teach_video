import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel{
  String userName;
  String uid;
  String id;
  List likes;
  int commentsCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePic;

  VideoModel({
    required this.uid,
    required this.id,
    required this.userName,
    required this.caption,
    required this.commentsCount,
    required this.likes,
    required this.profilePic,
    required this.shareCount,
    required this.songName,
    required this.videoUrl,
    required this.thumbnail,
  });

  Map<String,dynamic> toJson() => {
    "uid" : uid,
    "id" : id,
    "userName" : userName,
    "caption" : caption,
    "commentsCount" : commentsCount,
    "likes" : likes,
    "profilePic" : profilePic,
    "shareCount" : shareCount,
    "songName" : songName,
    "videoUrl" : videoUrl,
    "thumbnail" : thumbnail,
  };

  static VideoModel fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;
    return VideoModel(
      uid: snapshot["uid"],
      id: snapshot["id"],
      userName: snapshot["userName"],
      caption: snapshot["caption"],
      commentsCount: snapshot["commentsCount"],
      likes: snapshot["likes"],
      profilePic: snapshot["profilePic"],
      shareCount: snapshot["shareCount"],
      songName: snapshot["songName"],
      videoUrl: snapshot["videoUrl"],
      thumbnail: snapshot["thumbnail"]
    );
  }
}