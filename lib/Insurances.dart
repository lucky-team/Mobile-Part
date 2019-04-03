import 'dart:convert';

import 'package:Shrine/Claim.dart';
import 'package:flutter/material.dart';
import 'apiRequest.dart';
import 'login.dart';

// String insurances =  _GETinsurances().toString();
// String token22 = token0;
// Map maps =  jsonDecode(insurances);

// main(List<String> args) {
//   print(insurances);
// }
// jsonDecode(String re);

class InsurancePage extends StatefulWidget {
  @override
  _InsurancePageState createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  
  
  
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            semanticLabel: 'back0',
          ),
          onPressed: (){
            print('Back');
           // Navigator.pop(context);

          },
        ),
        title: Text('Purchased Insurances'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.help_outline,
                color: Colors.white,
                semanticLabel: 'help0',
              ),
              onPressed: () async{
                String insurances =  await apiRequestGET("http://59.110.243.55/insurances?", token0);
                //print(insurances);
                print(jsonDecode(insurances));
              },
            ),
          ],

      ),
//*********************************************************************************************************** */

      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          ),
          Row(
            children: <Widget>[
              Text('465484AAsD Type 3 Level 2   ',style: TextStyle(fontSize: 23.0),),
              RaisedButton(
                child: new Text("Claim",style: TextStyle(color: Colors.white),),
                onPressed: (){ Navigator.push(context,MaterialPageRoute(
                      builder: (context) => ClaimPage()
                    ));},
              )
          ],)
        ],
      )
    );
  }
  }
 
 Future<String> _GETinsurances() async{
   return await apiRequestGET("http://59.110.243.55/insurances?", token0);
 }