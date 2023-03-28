import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fin_infocom/listtileshimmer.dart';
import 'package:fin_infocom/shimmer.dart';
import 'package:fin_infocom/widgets/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
 bool isAdmin = false;

bool myval = true;
class HomePage extends StatefulWidget {
  HomePage({super.key, this.user});
  final User? user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  getUsers() async {
    print("hiiiiiiiiiiiiiiii");
    
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').get();
    for (var i = 0; i < snapshot.docs.length; i++) {
      if (FirebaseAuth.instance.currentUser!.email==snapshot.docs[i]["email"]) {
        if (snapshot.docs[i]["role"]=="admin") {
          isAdmin=true;
          
        }
        
        
      }
    
      if (snapshot.docs[i]["role"] != "admin") {
       await Future.delayed(Duration(seconds: 1));
       print("current email is ${FirebaseAuth.instance.currentUser!.email}");
       
       

        userDetails.add({
          "username": snapshot.docs[i]["username"],
          "role": snapshot.docs[i]["role"],
          "email": snapshot.docs[i]["email"]
        });
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    

    getUsers();
  }

  List userDetails = [];

  @override
  Widget build(BuildContext context) {
    
    

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff990d35),
          ),
          drawer: MyDrawer(),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
          itemCount: userDetails.length==0?7:userDetails.length,
          itemBuilder: (context, index) {
              return  Card(
                elevation: 4,
                child:userDetails.isEmpty ?ListTileShimmer(): ListTile(
                  title: Text("Name : ${userDetails[index]["username"]}"),
                  subtitle: Text("Role : ${userDetails[index]["role"]}"),
                ),
              );
          },
        ),
            )),
      ),
    );
  }
}
