import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fin_infocom/widgets/lead.dart';
import 'package:fin_infocom/widgets/manager.dart';
import 'package:fin_infocom/widgets/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key,required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () async{
        return false;
        
      },
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").doc(user!.uid).snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator(color: Colors.green,),);
                
              case ConnectionState.active:
                    return snapshot.data!["role"]=="lead"?LeadScreen():snapshot.data!["role"]=="manager"?ManagerScreen(): UserScreen(title: snapshot.data!["username"]);
              default:
              
            }
            return Text("Loading...");
            
          },
        ),
      ),
    );
  }
}