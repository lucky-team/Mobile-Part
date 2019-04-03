// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:Shrine/Claim.dart';
import 'package:Shrine/Insurances.dart';
import 'package:flutter/material.dart';
import 'apiRequest.dart';
import 'dart:io';
import 'dart:convert';


String token0;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

String uname=null,pswd=null;

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/HS.png'),
                SizedBox(height: 16.0),
                Text('Hibernia-Sino'),
              ],
            ),
            SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
              onChanged: (value){
                uname = value;
              },
            ),
            SizedBox(height: 12.0,),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true, 
              onChanged: (value){
                pswd = value;
              },
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: Text('CANCLE',style: TextStyle(color: Colors.white)),color: Colors.grey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  onPressed: (){
                    _usernameController.clear();uname=null;
                    _passwordController.clear();pswd=null;
                  },
                ),
                RaisedButton(
                  child: Text('Log In',style: TextStyle(color: Colors.white)),
                  elevation: 5.0,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  onPressed: () async {
                    String re = await apiRequest('http://59.110.243.55/users/login',{'username': '$uname','password': '$pswd'},'');
                    Map map0 = jsonDecode(re);
                    //map0.forEach(f)
                    //assert(map0['success']);
                    if(map0['success']==true){
                      token0 = map0['token'];
                      Navigator.push(context,MaterialPageRoute(
                        builder: (context) => InsurancePage()
                      ));
                    }
                    else{
                      Map mapm = map0['err'];
                      print(mapm['message']);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                        // return object of type Dialog
                          return AlertDialog(
                            title: new Text("Failed to Login."),
                            content: new Text(""+mapm['message']),
                            actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
             SizedBox(height: 50.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
              Text('Have no account ?   '),
              RaisedButton(
                color: Colors.lightBlue,
                  child: Text('Sign Up Now',style: TextStyle(color: Colors.white)),
                  elevation: 5.0,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context) => Signup()
                    ));
                    //_signin();
                  },
                ),
            ],)
            
          ],
        ),
      ),
    );
  }
}


//****************************************************************************************************************************************************** */
//****************************************************************************************************************************************************** */
//****************************************************************************************************************************************************** */
//****************************************************************************************************************************************************** */
//****************************************************************************************************************************************************** */
//****************************************************************************************************************************************************** */

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

String suname,spswd,spswd2;

class _SignupState extends State<Signup> {
  final _susernameController = TextEditingController();
  final _spasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/HS.png'),
                SizedBox(height: 16.0),
                Text('Hibernia-Sino'),
              ],
            ),
            SizedBox(height: 120.0),
            TextField(
              controller: _susernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
              onChanged: (value){
                suname = value;
              },
            ),
            SizedBox(height: 12.0,),
            TextField(
              controller: _spasswordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true, 
              onChanged: (value){
                spswd = value;
              },
            ),
            // SizedBox(height: 12.0,),
            // TextField(
            //   controller: _spasswordController,
            //   decoration: InputDecoration(
            //     labelText: 'Repeat Password',
            //   ),
            //   obscureText: true, 
            //   onChanged: (value){
            //     spswd2 = value;
            //     if(spswd2!=spswd){

            //     }
            //   },
            // ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: Text('CLEAR',style: TextStyle(color: Colors.white)),color: Colors.grey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  onPressed: (){
                    _susernameController.clear();suname=null;
                    _spasswordController.clear();spswd=null;
                    // spswd2=null;
                  },
                ),
                RaisedButton(
                  color: Colors.lightGreen,
                  child: Text('Sign Up',style: TextStyle(color: Colors.white)),
                  elevation: 5.0,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  onPressed: () async {
                    if(suname!=null && spswd!=null) {
                    String re2 = await apiRequest('http://59.110.243.55/users/signup',{'username': '$suname','password': '$spswd'},'');
                    Map map2 = jsonDecode(re2);
                    //map0.forEach(f)
                    //assert(map0['success']);
                    if(map2['success']==true){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                        // return object of type Dialog
                          return AlertDialog(
                            title: new Text("Signup Success !"),
                            content: new Text("Now you can use your new account to start your Hibernia-Sino service."),
                            actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.push(context,MaterialPageRoute(
                                    builder: (context) => LoginPage()
                                  ));
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                    else{
                      Map mapm2 = map2['err'];
                      print(mapm2['message']);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                        // return object of type Dialog
                          return AlertDialog(
                            title: new Text("Failed to Signup."),
                            content: new Text(""+mapm2['message']),
                            actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                    }else{
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                        // return object of type Dialog
                          return AlertDialog(
                            // title: new Text("Failed to Signup."),
                            content: new Text('Username and Password cannot be empty.'),
                            actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                    
                  },
                ),
                
              ],
            ),
            SizedBox(height: 12.0),
                new RaisedButton(
                  color: Colors.blueGrey,
                  child: Text("BACK TO THE LOGIN PAGE",style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
          ],
        ),
      ),
    );
  }
}