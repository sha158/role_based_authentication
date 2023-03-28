import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/login.dart';
bool globalStatus = false;


bool validateEmail(String email) {
  // Define a regex pattern for email validation
  final RegExp regex = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );

  // Check if the email matches the pattern
  if (!regex.hasMatch(email)) {
    return false;
  }

  return true;
}


bool validatePassword(String password) {
  // Define a regex pattern for password validation
  final RegExp regex = RegExp(
    r'^(?=.*[A-Z])(?=.*\W)(?=.{8,}).*$',
  );

  // Check if the password matches the pattern
  if (!regex.hasMatch(password)) {
    return false;
  }

  return true;
}




 changePassword(String currentPassword, String newPassword) async {
final user = await FirebaseAuth.instance.currentUser;
final cred = EmailAuthProvider.credential(
    email: user!.email??"", password: currentPassword);

user.reauthenticateWithCredential(cred).then((value) {
  user.updatePassword(newPassword).then((_) {
    Get.snackbar("Success!!!", "Password updated Successfully",backgroundColor: Colors.white,colorText: Color(0xff990d35,));
    globalStatus=true;
    Get.to(LoginPage());

    
    

    //Success, do something
  }).catchError((error) {
    Get.snackbar("Failed", "check your password",backgroundColor: Color(0xff990d35,),colorText: Colors.white);
    
    
    //Error, show something
  });
}).catchError((err) {
  Get.snackbar("Failed", "check your password",backgroundColor: Color(0xff990d35,),colorText: Colors.white);
  
 
});

}









final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> addUser({required String email,required String role,required String password,required String username}) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: "$email",
      password: "$password",
    );
    // Add the user to Firestore
    await firestore.collection('users').doc(userCredential.user!.uid).set({
      'email': email,
      "username":username,
      'role': role,
    });


    Get.snackbar("Sucess!!", "User added successfully");



  } catch (e) {
    print('Error creating user: $e');
  }
}



