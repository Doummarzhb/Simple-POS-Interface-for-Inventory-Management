import 'package:flutter/material.dart';
import 'package:management/screens/home_screen.dart';


class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
 //email , password static 
   final String staticEmail = "example@example.com";
  final String staticPassword = "password123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple POS Interface for Inventory Management | Clothing Store" ,     style: TextStyle(color: Colors.white),),
        
        centerTitle: true,
      backgroundColor: Colors.black, 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Image.asset(
                  "images/avatar.png",
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: 30),

               
                TextFormField(
                  initialValue: staticEmail,  
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  enabled: false,    
                ),
                SizedBox(height: 20),

                //     password
                TextFormField(
                  initialValue: staticPassword,       
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  enabled: false,           
                ),
                SizedBox(height: 20),
 //forget pass
                 Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                     },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xFF295F98),
                      ),
                    ),
                  ),
                ),

                //  login button   
                ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          email: staticEmail,
                          password: staticPassword,           
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xFF295F98),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
