import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/model/user_model.dart';
import 'package:tiktok_clone/view/screen/auth/login_screen.dart';
import 'package:tiktok_clone/view/screen/home_screen.dart';

class AuthController extends GetxController{

  static AuthController instance = Get.find();
  File? proImage;
  late Rx<User?> _user;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user,_setInitialView);
  }

  _setInitialView(User? user){
    if(user == null){
      Get.offAll(() => const LoginScreen());
    }else{
      Get.offAll(() => const HomeScreen());
    }
  }

  void SignUp(
      String userName,
      String email,
      String password,
      File? image
      )async{
    try{
      if(
      userName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null
      ){
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        String downloadURl = await _uploadImage(image);

        UserModel userModel = UserModel(
            name: userName,
            email: email,
            id: userCredential.user!.uid,
            profilePhoto: downloadURl,
        );

        await FirebaseFirestore.instance.collection("user").doc(userCredential.user!.uid).set(userModel.toJson());
      }else{
        Get.snackbar("Create Account", "Please Fill All Field");
      }
    }catch(e){
      Get.snackbar("Sign Up Error", e.toString());
    }
  }

  Future<String> _uploadImage(File image)async{
    Reference ref = FirebaseStorage.instance.ref().child("profilePicture").child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDwnUrl = await snapshot.ref.getDownloadURL();
    return imageDwnUrl;
  }

  pickImage()async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    // if(image == null) return;

    final img = File(image!.path);
    this.proImage = img;
  }

  void Login(
      String email,
      String password,
      )async{
    try{
      if(email.isNotEmpty && password.isNotEmpty){
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      }else{
        Get.snackbar("Login Error", "Please Fill Your Field");
      }
    }catch(e){
      Get.snackbar("Login Error", e.toString());
    }
  }



}