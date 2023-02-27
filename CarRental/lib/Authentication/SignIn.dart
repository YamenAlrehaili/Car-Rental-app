import 'package:carrental/Authentication/Authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:carrental/LoadingWidget/Loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();

}

class _SignInState extends State<SignIn> {
  final Auth _authService = Auth();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  // TestFieldState
  String Email = '';
  String Password = '';
  String Error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        elevation: 0.0,
        title: Text('Sign In to Car Rental App'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 80.h),
              Text("Sign In",style: TextStyle(fontSize: 150.sp , fontWeight: FontWeight.bold,color: Colors.black),),
              SizedBox(height: 15.h),
              Container(
                height: 600.h,
                width: 600.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "lib/Images/Logo2.png",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter an Email" : null,
                onChanged: (val) {
                  setState(() {
                    Email=val;
                  });
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Enter your email",
                    labelText: "Email"
                ),
              ),
              SizedBox(height: 50.h),
              TextFormField(
                validator: (val) => val!.length<8 ? "Enter +8 Password length" : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    Password=val;
                  });
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: "Enter your password",
                  labelText: "Password"
                ),
              ),
              SizedBox(height: 100.h),
              MaterialButton(onPressed: () async {
                if(_formKey.currentState!.validate()){
                  setState(() {
                    loading=true;
                  });
                  dynamic SignInResult = await _authService.SignInWithEmailPassword(Email, Password);
                  if(SignInResult==null){
                    setState(() {
                      Error = "Failed to sign in worng inputs";
                      loading=false;
                    });
                  }
                }
              }, child:  Text("Sign In",style: TextStyle(fontSize: 75.sp , fontWeight: FontWeight.w500,color: Colors.white),),
                color: Colors.deepPurpleAccent,
              ),
              SizedBox(height: 20.h),
              Text(Error ,style: TextStyle(color: Colors.red[900] , fontSize: 50.sp ,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
