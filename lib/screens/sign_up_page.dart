import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String phoneNumber = '';
  String username = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
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
              Text("SIGN UP", style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (String val) {
                    setState(() {
                      username = val;
                    });
                  },
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white60),
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
                  onChanged: (String val) {
                    setState(() {
                      phoneNumber = val;
                    });
                  },
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white60),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.white70,
                    ),
                    border: InputBorder.none,
                    hintText: 'Enter Phone number',
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
                  if (phoneNumber.length < 10) {
                    setState(() {
                      error = 'Enter valid credentials';
                    });
                  }else{
                    setState(() {
                      error = '';
                    });
                  }
                  print(phoneNumber);
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
                    'Already a member?  ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w400),
                  ),
                  FlatButton(
                      child: Text(
                        'Log-in',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).buttonColor,
                            fontWeight: FontWeight.w400),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
