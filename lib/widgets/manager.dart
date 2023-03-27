import 'package:fin_infocom/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagerScreen extends StatelessWidget {
  const ManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("You are a project Manager",style: GoogleFonts.lato(fontSize: 25,fontWeight: FontWeight.bold),),
        SizedBox(height: 30,),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.3,
          
          child: Center(child: Text("Add project!!!",style: TextStyle(color: Colors.white),)),
          decoration: BoxDecoration(color: Colors.green.shade800,borderRadius: BorderRadius.circular(12)),
        ),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.15,
          
          child: Center(child: Text("View project!!!",style: TextStyle(color: Colors.white),)),
          decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(12)),
        ),
        SizedBox(width: 10,),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.15,
          
          child: Center(child: Text("delete project!!",style: TextStyle(color: Colors.white),)),
          decoration: BoxDecoration(color: Color(0xff990d35,),borderRadius: BorderRadius.circular(12)),
        ),

          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
        GestureDetector(
          onTap: () {
            Get.to(LoginPage());
          },
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.15,
            
            child: Center(child: Text("Log out",style: TextStyle(color: Colors.white),)),
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(12)),
          ),
        ),

      ],
    );
  }
}