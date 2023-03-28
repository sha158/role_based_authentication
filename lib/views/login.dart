import 'package:fin_infocom/globals.dart';
import 'package:fin_infocom/utils/utils.dart';
import 'package:fin_infocom/views/homepage.dart';
import 'package:fin_infocom/views/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
   LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  bool isVisible = false;

  late TextEditingController emailController;

  late TextEditingController  passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController=TextEditingController();
    passwordController=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff990d35),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 400.0,
          ),
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log in',
                  style: GoogleFonts.lato(fontSize: 25,color: Colors.white),
                ),
                SizedBox(height: 25,),
                Container(
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                  child: TextFormField(
                    validator: (value) {
                     var res =  validateEmail(value??"");
                     if(!res){
                       Get.snackbar("Email", "check your email",backgroundColor: Colors.white,colorText: Color(0xff990d35),duration: Duration(milliseconds: 900));
                       return "enter proper email";
                    
                     }
                     setState(() {
                       
                     });
                      
                    },
                  
                  
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
                  child: TextFormField(
                    obscureText: isVisible,
                    validator: (value) {
                    var res =   validatePassword(value??"");
                    print(res);
                     if(res==false){

                      Get.snackbar("Password", "must contain at least 1 capital ,1 symbol, minimum 8 characters",duration: Duration(milliseconds: 900),colorText: Color(0xff990d35),backgroundColor: Colors.white);
                      return "enter correct format password";
                    }
                    },
                  
                    controller: passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          isVisible = !isVisible;
                          setState(() {
                            
                          });
                          
                        },
                         icon: Icon(isVisible?Icons.visibility:Icons.visibility_off)
                         ),
                      
                       
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      labelText: 'password',
                      labelStyle: GoogleFonts.lato(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
                    onPressed: ()async {
                      if (_formkey.currentState!.validate())  {

                        try {
                          var user = await     FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                          
                          Get.snackbar("Logged In", "login successfull",backgroundColor: Color(0xff990d35,),colorText: Colors.white,duration: Duration(milliseconds: 900));
                          
                          Get.to(HomePage());
                          
                        } catch (e) {
                          Get.snackbar("Error", "Something went wrong",colorText: Colors.white,duration: Duration(milliseconds: 900),backgroundColor: Color(0xff990d35));
                          
                        }
                   
                        
                      }
                      
                    },
                    child: Text('Login',style: GoogleFonts.lato(color: Color(0xff990d35,),fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont have an account?",style: GoogleFonts.lato(color: Colors.white),),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignUpPage());
                        
                      },
          
                      child: Text("Sign in",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white),),)
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
