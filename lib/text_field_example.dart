import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  // take input to user
  TextEditingController emailController  = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  //or
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.teal,
        title: Text("Text Field Example",
        style:TextStyle(
          color: Colors.white,
        ) ,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                hintText: "Enter your Email Address",
                prefixIcon: Icon(Icons.email)
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(17.0),
            child: TextField(
              //text hide
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Password",
                hintText: "Enter your password",
                prefixIcon: Icon(Icons.lock)
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                )

              ),
                onPressed: (){
                String email = emailController.text;
                String password = passwordController.text;
                if(!email.contains("@") || !email.contains("."))
                  {
                    Fluttertoast.showToast(msg: "Email Invild");
                  }
                else if(password.length<4)
                  {
                    Fluttertoast.showToast(msg: "Password Invild");
                  }
                else{
                  Fluttertoast.showToast(msg: "Email: "+email+"\n"+"Password: "+password);
                }


            },
                child: Text("Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w300,
                ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
