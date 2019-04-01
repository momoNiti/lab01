import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email"
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if (value.isEmpty) return "Email is required";
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password"
                ),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) return "Password is required";
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text("Sign in"),
                      onPressed: () {
                        auth.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        ).then((FirebaseUser user){
                          if(user.isEmailVerified){
                            print("Go home screen !");
                          }
                          else{
                            print("Please check your email to verified account");
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              FlatButton(
                child: Text("Register new user"),
                onPressed: () {
                  Navigator.pushNamed(context, "/register");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
