import 'package:flutter/material.dart';
import './log_in_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = '';
  String username = '';
  String password = '';
  String error = '';
  bool hidePassword = true;
  TextEditingController emailController;
  TextEditingController usernameController;
  TextEditingController passwordController;
  int group = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.075,),
              Container(
                height: MediaQuery.of(context).size.height * 0.85,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 7,
                      spreadRadius: 9,
                      offset: Offset(3, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Register", style: Theme.of(context).textTheme.headline6),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: usernameController,
                        onChanged: (String val) {
                          setState(() {
                            username = val;
                          });
                        },
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white70,
                          ),
                          border: InputBorder.none,
                          hintText: 'Enter Username',
                          hintStyle: Theme.of(context).textTheme.caption,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: emailController,
                        onChanged: (String val) {
                          setState(() {
                            email = val;
                          });
                        },
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.white70,
                          ),
                          border: InputBorder.none,
                          hintText: 'Enter Email',
                          hintStyle: Theme.of(context).textTheme.caption,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: hidePassword,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                        autocorrect: true,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white70,
                          ),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                            ),
                            onTap: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                          border: InputBorder.none,
                          hintText: 'Enter Password',
                          hintStyle: Theme.of(context).textTheme.caption,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:24.0),
                      child: Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: group,
                              onChanged: (T) {
                                setState(() {
                                  group = T;
                                });
                              }),
                          Text('Special',style: Theme.of(context).textTheme.caption,),
                          Spacer(),
                          Radio(
                              value: 2,
                              groupValue: group,
                              onChanged: (T) {
                                setState(() {
                                  group = T;
                                });
                              }),
                          Text('Normal',style: Theme.of(context).textTheme.caption,),
                        ],
                      ),
                    ),
                    Container(
                        height: 50,
                        child: Center(
                            child: Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ))),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      color: Theme.of(context).buttonColor,
                      onPressed: () {
                        if (email.length == 0 ||
                            password.length == 0 ||
                            username.length == 0) {
                          setState(() {
                            error = 'Enter valid credentials';
                          });
                        } else {
                          setState(() {
                            error = '';
                          });
                        }
                        print(email + username + password+group.toString());
                      },
                      child: Text(
                        "Submit",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a member?',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              fontWeight: FontWeight.w400),
                        ),
                        FlatButton(
                            child: Text(
                              'Log-in',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.lightBlueAccent,
                                  fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LogInPage()),
                              );
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ],

        ),
      ),
    );
  }
}
