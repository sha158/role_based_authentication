import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fin_infocom/globals.dart';
import 'package:fin_infocom/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController repasswordController;
  late TextEditingController nameController;
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController=TextEditingController();
    passwordController=TextEditingController();
    repasswordController=TextEditingController();
    nameController=TextEditingController();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff990d35),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 600.0,
            minWidth: 300.0,
          ),
          padding: EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: GoogleFonts.lato(fontSize: 30,color: Colors.white),
                ),
                SizedBox(height: 32.0),
                Container(
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                  child: TextField(
                  
                    controller: nameController,
                    decoration: InputDecoration(
                       
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      labelText: 'username',
                      labelStyle: GoogleFonts.lato(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                  child: TextField(
                  
                    controller: emailController,
                    decoration: InputDecoration(
                       
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      labelText: 'Email',
                      labelStyle: GoogleFonts.lato(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
               Container(
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                  child: TextField(
                  
                    controller: passwordController,
                    decoration: InputDecoration(
                       
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      labelText: 'password',
                      labelStyle: GoogleFonts.lato(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                  child: TextField(
                  
                    controller: repasswordController,
                    decoration: InputDecoration(
                       
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      labelText: 'Re-password',
                      labelStyle: GoogleFonts.lato(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 32.0),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), ),backgroundColor: Colors.white),
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        try {
                          final newuser = await   auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                          print(newuser);
                          

                        await FirebaseFirestore.instance.collection("users").doc(newuser.user!.uid).set({
                            "email":emailController.text,
                            "username":nameController.text,
                            "uid":newuser.user!.uid,
                            "role":"user"
                          });
                          print("ok");
                           Get.snackbar("Account created", "Acoount successfully created",colorText: Color(0xff990d35,),backgroundColor: Colors.white);
                           Get.to(LoginPage());
                          
                          
                        } catch (e) {
                          print(e.toString());
                          
                        }
                     

                        
                      }

                    },
                    child: Text('Sign Up',style: GoogleFonts.lato(color: Color(0xff990d35),fontWeight: FontWeight.bold),),
                  ),
                 
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",style: GoogleFonts.lato(color: Colors.white),),
                    GestureDetector(
                      onTap: () {
                        Get.to(LoginPage());
                        
                      },
          
                      child: Text("Log in",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white),),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
