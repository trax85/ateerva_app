import 'package:flutter/material.dart';

import 'ForgotPassPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  final String _usrName = "test@test.com";
  final String _psw = "test123";

  bool validateUserName(String value){
    if(value == _usrName) {
      return true;
    }
    return false;
  }
  bool validatePassWord(String value){
    if(value == _psw) {
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,

      body:Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://wallpaperaccess.com/full/2727570.jpg"),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 110,),
              const Text("Welcome", style: TextStyle(
                  fontSize: 30, color: Colors.white,
                ),
              ),
             const Text("Please Login Here",
                style: TextStyle(
                  fontSize: 25, color: Colors.white,
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(height: 10,),
              Form(
                key: _formKey,
                child: Column(
                    children: [
                      SizedBox(width: 270,
                        child: TextFormField(
                          key: const Key('username'),
                          decoration: const InputDecoration(
                            labelText: "Email or Phone Number",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                          ),
                          validator: (value){
                            if(value!.isNotEmpty &&
                                validateUserName(value)){
                              return null;
                            }return "Incorrect Username";
                          },
                        ),
                      ),

                      SizedBox( width: 270,
                        child: TextFormField(
                          key: const Key('password'),
                          decoration: const InputDecoration(
                            labelText: "Password",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                          ),
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                          validator: (value){
                            if(value!.isNotEmpty &&
                                validatePassWord(value)){
                              return null;
                            }return "Incorrect Password";
                          },
                        ),
                      ),
                      const SizedBox(height: 35,),
                      SizedBox(width: 100, height: 40,
                        child:
                          ElevatedButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              print("came here");
                              const snackBar = SnackBar(
                                content: Text('Login successfull !'),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          },
                          key: const Key('signin'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white60,
                            foregroundColor: Colors.cyan
                          ),
                          child: Row(
                              children: const [
                                Text("LOGIN", style: TextStyle(fontSize: 15, color: Colors.cyan),),
                                Icon(Icons.arrow_forward_rounded),
                              ]
                          ),
                        ),
                      ),
                      const SizedBox(height: 18,),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotPassPage()),
                          );
                        },
                        child: const Text('Forgot password?', style: TextStyle(
                          fontSize: 18, color: Colors.white60,
                        ),),
                      )
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}