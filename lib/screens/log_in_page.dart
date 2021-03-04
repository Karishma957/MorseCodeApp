import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './sign_up_page.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String phoneNumber='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.75,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 7,spreadRadius: 9,offset: Offset(3,3),),],
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOG IN",
                style: Theme.of(context).textTheme.headline6
              ),
              SizedBox(height:50,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (String val){
                    setState(() {
                      phoneNumber=val;
                    });
                  },
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600,color: Colors.white60),
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
              Container(height:50,child: Center(child: Text(error,style: TextStyle(color: Colors.red,fontSize: 14),))),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                color: Theme.of(context).buttonColor,
                onPressed: () {
                  if(phoneNumber.length<10){
                    setState(() {
                      error='Enter valid Phone Number';
                    });
                  }
                  else{
                    setState(() {
                      error='';
                    });
                  }
                  print(phoneNumber);
                },
                child: Text(
                  "Submit",
                  style: Theme.of(context).textTheme.bodyText1,),
              ),
              SizedBox(height: 10),
              FlatButton(
                  child: Text(
                    'Register',
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
        ),
      ),
    );
  }
}
