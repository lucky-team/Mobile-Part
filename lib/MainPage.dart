import 'package:Shrine/Claim.dart';
import 'package:Shrine/ClaimList.dart';
import 'package:Shrine/Insurances.dart';
import 'package:Shrine/Profile.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'apiRequest.dart';
import 'dart:convert';

String proGET;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
      return  Scaffold(
         appBar: AppBar(
        

        

           title: Text('Welcome to Hibernia-Sino',textAlign: TextAlign.center,),
           actions: <Widget>[
             IconButton(
               icon: Icon(
                 Icons.account_box,
                 color: Colors.white,
                 semanticLabel: 'profile',
               ),
               onPressed: () async{
                 proGET = await apiRequestGET('http://59.110.243.55:3000/profiles',token0);
                 Navigator.push(context,MaterialPageRoute(
                      builder: (context) => ProfilePage()
                    )
                  );
               },
             )
           ],
         ),
         drawer: Drawer(
           
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/HS.png'),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
            ),
            SizedBox(height: 5.0,),
            Container(
              height: 2.0,
              color: Colors.lightBlue[200],
            ),
            SizedBox(height: 5.0,),
            ListTile(
              leading: Icon(Icons.account_circle,color: Colors.blue[300],size: 40,),
              title: Text('My Profile',style: TextStyle(fontSize: 20.0),),
              onTap: () async{
                 proGET = await apiRequestGET('http://59.110.243.55:3000/profiles',token0);
                 Navigator.push(context,MaterialPageRoute(
                      builder: (context) => ProfilePage()
                    )
                  );
              },
            ),
            SizedBox(height: 5.0,),
            Container(
              height: 2.0,
              color: Colors.lightBlue[200],
            ),
            SizedBox(height: 5.0,),
            ListTile(
              leading: Icon(Icons.filter_none,color: Colors.blue[300],size: 40,),
              title: Text('My Insurances',style: TextStyle(fontSize: 20.0),),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(
                      builder: (context) => InsurancePage()
                    )
                  );
              },
            ),
            SizedBox(height: 5.0,),
            Container(
              height: 2.0,
              color: Colors.lightBlue[200],
            ),
            SizedBox(height: 5.0,),
            ListTile(
              leading: Icon(Icons.tab_unselected,color: Colors.blue[300],size: 40,),
              title: Text('My Claims',style: TextStyle(fontSize: 20.0),),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(
                      builder: (context) => ClaimListPage()
                    )
                  );
              },
            ),
            SizedBox(height: 10.0,),
             Container(
              height: 8.0,
              color: Colors.lightBlue[200],
            ),
            SizedBox(height: 5.0,),
            Container(
              height: 6.0,
              color: Colors.lightBlue[200],
            ),
            SizedBox(height: 5.0,),
            Container(
              height: 4.0,
              color: Colors.lightBlue[200],
            ),
            SizedBox(height: 5.0,),
            Container(
              height: 2.0,
              color: Colors.lightBlue[200],
            ),
            SizedBox(height: 5.0,),
            Container(
              height: 1.0,
              color: Colors.lightBlue[200],
            ),
            SizedBox(height: 200.0,),
            Container(
              height: 2.0,
              color: Colors.lightBlue[200],
            ),
            ListTile(
              leading: Icon(Icons.golf_course, color: Colors.blue[300],size: 40,),
              title: Text('About Us',style: TextStyle(fontSize: 20.0),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Container(
              height: 2.0,
              color: Colors.lightBlue[200],
            ),
            SizedBox(height: 5.0,),
            IconButton(
              alignment: Alignment.bottomRight,
              icon: Icon(Icons.keyboard_arrow_left,size: 40,color: Colors.blue,),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),

       body:  ListView(
                children: <Widget>[
                  SizedBox(
                    height: 70.0
                  ),
                  Container(
                    height: 300.0,
        
                    child:
                      ListView(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                          children: <Widget>[
                              new Container(
                                width: 394.0,
                                color: Colors.lightBlue,
                              ),
                              new Container(
                                width: 394.0,
                                color: Colors.orangeAccent,
                              ),
                              new Container(
                                width: 394.0,
                                color: Colors.redAccent,
                              ),
                              new Container(
                                width: 394.0,
                            color: Colors.deepPurple,
                    ),
                  ],
                ),
                  ),
                  SizedBox(height:30.0),
                  Padding(
                    
        padding: EdgeInsets.fromLTRB(70.0, 10.0, 70.0, 170.0),
        child: 
          RaisedButton(
                    color: Colors.black26,
                    child: Text('PURCHASE NOW !', style: TextStyle(color: Colors.white,fontSize: 20.0)),
                    //elevation: 5.0,
                    shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context) => InsurancePage()
                    ));
                    },
                  )
              ),
                  
                ],
              ),
      
          );
        
  }
}

