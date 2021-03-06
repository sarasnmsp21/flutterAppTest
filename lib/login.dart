import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  String emailValidatorFunc(String email){
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (email.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(email)){
      return "Invalid Email";
    }else {
      return null;
    }
  }

  //  String nameValidatorFunc(String name){
  //    String patttern = r'(^[a-zA-Z ]*$)';
  //   RegExp regExp = new RegExp(patttern);
  //   if (name.length == 0) {
  //     return "Name is Required";
  //   } else if (!regExp.hasMatch(name)) {
  //     return "Name must be a-z and A-Z";
  //   }
  //   return null;
  // }

  //   String mobileValidatorFunc(String mobile){
  //   String patttern = r'(^[0-9]*$)';
  //   RegExp regExp = new RegExp(patttern);
  //   if (mobile.length == 0) {
  //     return "Mobile is Required";
  //   } else if(mobile.length != 10){
  //     return "Mobile number must 10 digits";
  //   }else if (!regExp.hasMatch(mobile)) {
  //     return "Mobile Number must be digits";
  //   }
  //   return null;
  // }

    String passwordValidatorFunc(String password){
     if(password.isEmpty){
      return 'Password is Required';
    }
    else if(password.length < 4){
      return 'Password is too short';

    }
    else {
      return null;
    }
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool _autoValidate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
  child: Center(
        child: Container(
        child: Container(
          child: Form(
            key: _formKey,
            autovalidate: true,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ 
                  SizedBox(
                      height: 120.0,
                      width: 200.0,
                      child: Image.asset(
                        "assets/image3.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                SizedBox(height: 30.0,
                ),
              
              //  TextFormField(
              //    autovalidate: _autoValidate,
              //        validator: nameValidatorFunc,
              //       decoration: InputDecoration(
              //       contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              //       hintText: "Name",
              //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              //     ),
              //   ),
                //  SizedBox(
                //   height: 25.0,
                // ),
                //   TextFormField(
                //      autovalidate: _autoValidate,
                //      validator: mobileValidatorFunc,
                //     decoration: InputDecoration(
                //     contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                //     hintText: "Mobile",
                //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                //   ),
                // ),
                //  SizedBox(
                //   height: 25.0,
                // ),
                  TextFormField(
                     autovalidate: _autoValidate,
                    validator: emailValidatorFunc,
                    decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  initialValue: '',
                ),
                SizedBox(
                  height: 25.0,
                ),
                 TextFormField(
                    autovalidate: _autoValidate,
                   obscureText: true,
                     validator: passwordValidatorFunc,
                    decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  initialValue: '',
                  keyboardType: TextInputType.emailAddress,
                ),
                
                SizedBox(
                  height: 25.0,
                ),
                RaisedButton(
                  child:Container(
                    // width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    child: Text('Login',
                    textAlign: TextAlign.center,
                    style: style.copyWith( 
                    color: Colors.white, fontWeight: FontWeight.bold), 
                    ), 
                  ), onPressed: () {
                    if(_formKey.currentState.validate()){
                      Navigator.pushNamed(context, '/Homepage');
                      _formKey.currentState.save();
                    }
                    else{
                        setState(() {
                       _autoValidate = true;
                      });
                    }
                  },
                  color: Colors.green,
                ),
                 SizedBox(
                  height: 10.0,
                ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Don/t Have an account yet ? '),
                    InkWell(
                  child: Text(
              "SignUp Now",
              softWrap: true,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/signUp');
            },
          )
                  
                 ],
                 )
                

              ],
            ),
          ),
          ),
        ),
      ),
  ),
        )
    );
  }
}

