import 'package:fin_infocom/utils/utils.dart';
import 'package:fin_infocom/views/homepage.dart';
import 'package:fin_infocom/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _passwordKey = GlobalKey<FormState>();
  final adminKey = GlobalKey<FormState>();
  final _firstController = TextEditingController();
  final _secondController = TextEditingController();

    final _usernamecontroller = TextEditingController();
    final userRoleController = TextEditingController();
  final _useremailcontroller = TextEditingController();
    final _userpasswordcontroller = TextEditingController();


    final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> updatePassword({required String newPassword}) async {
  try {
    await _auth.currentUser?.updatePassword(newPassword);
    Get.snackbar("Password", "Password updated successfully");
    
   
  } catch (e) {
    print('Failed to update password: $e');
    Get.snackbar("Failed", "your current password doesn't match with actual password",backgroundColor: Color(0xff990d35,),colorText: Colors.white);
  }
}
 

  alert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
              child: AlertDialog(
            title: Container(child: Text("")),
            content: Form(
              key: _passwordKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    validator: (value) {
                    var res =   validatePassword(value??"");
                    if(res==false){
                    Get.snackbar("Password", "must contain at least 1 capital ,1 symbol, minimum 8 characters",duration: Duration(milliseconds: 900),colorText: Color(0xff990d35),backgroundColor: Colors.white);
                    return "enter correct format password";
                    }
                    },
                    controller: _firstController,
                    decoration: InputDecoration(
                      hintText: 'Current Password',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                    var res =   validatePassword(value??"");
                    if(res==false){
                    Get.snackbar("Password", "must contain at least 1 capital ,1 symbol, minimum 8 characters",duration: Duration(milliseconds: 900),colorText: Color(0xff990d35),backgroundColor: Colors.white);
                    return "enter correct format password";
                    }
                    },
                    controller: _secondController,
                    decoration: InputDecoration(
                      hintText: 'New Password',
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff990d35),
                      ),
                      onPressed: () {
                        if (_passwordKey.currentState!.validate()) {
                        changePassword(_firstController.text, _secondController.text);
                        Navigator.of(context).pop();
                          
                        }
                        
                        
                        
                      },
                      child: Text("Update"))
                ],
              ),
            ),
          ));
        });
  }
  alert2() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
              child: AlertDialog(
            title: Container(child: Text("")),
            content: Form(
              key: adminKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _useremailcontroller,
                    decoration: InputDecoration(
                      hintText: 'enter your email',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      var res =   validatePassword(value??"");
                      print(res);
                       if(res==false){
            
                        Get.snackbar("Password", "must contain at least 1 capital ,1 symbol, minimum 8 characters",duration: Duration(milliseconds: 900),colorText: Color(0xff990d35),backgroundColor: Colors.white);
                        return "enter correct format password";
                      }
                      
                    },
                    controller: _userpasswordcontroller,
                    decoration: const InputDecoration(
                      hintText: 'enter your password',
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _usernamecontroller,
                    decoration: InputDecoration(
                      hintText: 'enter your userName',
                    ),
                  ),
                  SizedBox(height: 12,),
                  TextFormField(
                    controller: userRoleController,
                    decoration: InputDecoration(
                      hintText: 'enter the role',
                    ),
                  ),
                  SizedBox(height: 12,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff990d35),
                      ),
                      onPressed: () {
                        if (adminKey.currentState!.validate()) {
                        addUser(email: _useremailcontroller.text, role: userRoleController.text, password: _userpasswordcontroller.text, username: _usernamecontroller.text);
                        Navigator.of(context).pop();
            
                          
                        }
            
            
                        
                      },
                      child: Text("Update"))
                ],
              ),
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    print(isAdmin);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff990d35)),
                onPressed: () {
                  final firstFieldData = _firstController.text;
                  final secondFieldData = _secondController.text;
                  print('First Field: $firstFieldData');
                  print('Second Field: $secondFieldData');
                  alert();
                  setState(() {});
                },
                child: Text("Change Password")),
            SizedBox(
              height: 12,
            ),
           isAdmin? ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff990d35)),
                onPressed: () {
                  final firstFieldData = _firstController.text;
                  final secondFieldData = _secondController.text;
                  print('First Field: $firstFieldData');
                  print('Second Field: $secondFieldData');
                  alert2();
                  setState(() {});
                },
                child: Text("Add User")):Container(),
          ],
        ),
      ),
    );
  }
}




// alert

// import 'package:flutter/material.dart';

// class MyAlertDialog extends StatefulWidget {
//   const MyAlertDialog({Key? key}) : super(key: key);

//   @override
//   _MyAlertDialogState createState() => _MyAlertDialogState();
// }

// class _MyAlertDialogState extends State<MyAlertDialog> {


//   @override
//   void dispose() {
//     _firstController.dispose();
//     _secondController.dispose();
//     super.dispose();
//   }

//   AlertDialog(
//       title: Text('Enter Data'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             controller: _firstController,
//             decoration: InputDecoration(
//               hintText: 'First Field',
//             ),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             controller: _secondController,
//             decoration: InputDecoration(
//               hintText: 'Second Field',
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         ElevatedButton(
//           onPressed: () {
//             // Do something with the data entered by the user
//             final firstFieldData = _firstController.text;
//             final secondFieldData = _secondController.text;
//             print('First Field: $firstFieldData');
//             print('Second Field: $secondFieldData');
//             Navigator.pop(context);
//           },
//           child: Text('Save'),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Cancel'),
//         ),
//       ],
//     );
//   }


