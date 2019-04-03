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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'Claim_class.dart';
import 'apiRequest.dart';
import 'dart:io';

void main() => runApp(ClaimPage());




double amt0;
var lof0 = List();
//List lof0 = <File>[];
//var lof0 = new List<File>();


  Claim clm0 = new Claim('5454', '54654', DateTime(2019), 456.0, List(5), DateTime(2019), DateTime(2019));

  //Claim clm = new Claim(policyid, aloca, _dateTime, double.parse(amt), lof0, DateTime(2019), DateTime(2019));

  String policyid, aloca, adate, amt, file,fp;
  DateTime _dateTime = new DateTime(2019);
  var formatter = new DateFormat('yyyy-MM-dd');

class ClaimPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ClaimPageState();
}

class ClaimPageState extends State<ClaimPage> {


  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType;
  TextEditingController _controller = new TextEditingController();

  String _filePath;
  //List<File> lof;

  @override
  Widget build(BuildContext context) {
    //var context2 = context;
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
            Navigator.pop(context);

          },
        ),
        title: Text('Insurance Claim'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.help_outline,
                color: Colors.white,
                semanticLabel: 'help0',
              ),
              onPressed: (){
                print('Help');
              },
            ),
          ],

      ),
//*********************************************************************************************************** */

      body: new ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.code),
              labelText: 'Policy Id:',
              helperText: '',
            ),
            onChanged: (value){
              policyid = value;
            },
            autofocus: false,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.place),
              labelText: 'Location of the Accident:',
              //helperText: '',
            ),
            onChanged: (value){
              aloca = value;
            },
            autofocus: false,
          ),
      

          Row(children: <Widget>[
            // var DateTime
            Icon(Icons.access_time,color: Colors.grey),
              Text('     Date of the Accident:',
              style: TextStyle(fontSize: 17.0, ),),
              Text('       '+formatter.format(_dateTime), style: TextStyle(fontSize: 17.0 ,fontWeight: FontWeight.w500),),


            Padding(
              padding:EdgeInsets.fromLTRB(10.0, 18.0, 0.0, 18.0),
              child: 
              IconButton(
              icon: Icon(
                Icons.date_range,
                semanticLabel: 'datepick',
              ),
              onPressed: _showDatePicker,
              ),
            ),
          ],),

      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          icon: Icon(Icons.monetization_on),
          labelText: 'Amount of claim:',
          helperText: '',
        ),
        onChanged: (value){
          amt = value;
        },
        autofocus: false,
      ),



          Row(children: <Widget>[
            // var DateTime
            Icon(Icons.attach_file,color: Colors.grey),
            Text('     Please upload your relavant files:',
              style: TextStyle(fontSize: 17.0, ),),
            Text('      ',style: TextStyle(fontSize: 17.0, )),


            Padding(
              padding:EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 50.0),
              //child:
              //Text('Your Insurance Claim needs the files about XXXX...'),
            ),
          ],),

      
//       Center(
//         child: _filePath == null
//             ? new Text('No file selected.',style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w500))
//             : new Text('Path:   ' + _filePath,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500)),
//
//       ),
//       FloatingActionButton(
//         onPressed: getFilePath,
//         tooltip: 'Select file',
//         child: new Icon(Icons.sd_storage),
//         backgroundColor: Colors.grey,
//       ),


         new Center(
            child: new Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: new SingleChildScrollView(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: new DropdownButton(
                      hint: new Text('LOAD PATH FROM'),
                      value: _pickingType,
                      items: <DropdownMenuItem>[
                        new DropdownMenuItem(
                          child: new Text('FROM AUDIO'),
                          value: FileType.AUDIO,
                        ),
                        new DropdownMenuItem(
                          child: new Text('FROM IMAGE'),
                          value: FileType.IMAGE,
                        ),
                        new DropdownMenuItem(
                          child: new Text('FROM VIDEO'),
                          value: FileType.VIDEO,
                        ),
                        new DropdownMenuItem(
                          child: new Text('FROM ANY'),
                          value: FileType.ANY,
                        ),
                        new DropdownMenuItem(
                          child: new Text('CUSTOM FORMAT'),
                          value: FileType.CUSTOM,
                        ),
                      ],
                      onChanged: (value) => setState(() {
                        _pickingType = value;
                        if (_pickingType != FileType.CUSTOM) {
                          _controller.text = _extension = '';
                        }
                      })
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 100.0),
                    child: _pickingType == FileType.CUSTOM
                      ? new TextFormField(
                        maxLength: 10,
                        autovalidate: true,
                        controller: _controller,
                        decoration: InputDecoration(labelText: 'File extension'),
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          RegExp reg = new RegExp(r'[^a-zA-Z0-9]');
                          if (reg.hasMatch(value)) {
                            _hasValidMime = false;
                            return 'Invalid format';
                          }
                          _hasValidMime = true;
                        },
                      )
                      : new Container(),
                  ),
                  new ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 250.0),
                    child: new SwitchListTile.adaptive(

                      title: new Text('Pick Multiple Files', textAlign: TextAlign.right),
                      onChanged: (bool value) => setState(() => _multiPick = value),
                      value: _multiPick,
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: new RaisedButton(
                      onPressed: () => _openFileExplorer(),
                      child: new Text("Open File Picker",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  new Builder(
                    builder: (BuildContext context) => new Container(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: new Scrollbar(
                        child: _path != null || _paths != null
                        ? new ListView.separated(
                          itemCount: _paths != null && _paths.isNotEmpty ? _paths.length : 1,
                          itemBuilder: (BuildContext context, int index) {
                            final bool isMultiPath = _paths != null && _paths.isNotEmpty;
                            final String name = 'File $index: ' + (isMultiPath ? _paths.keys.toList()[index] : _fileName ?? '...');
                            final path = isMultiPath ? _paths.values.toList()[index].toString() : _path;

                            return new ListTile(
                              title: new Text(
                                name),
                              subtitle: new Text(path),
                            );
                      },
                          separatorBuilder: (BuildContext context, int index) => new Divider(),
                        )
                        : new Container(),
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            )),











//**************************************************************************************************************
      
      Padding(
        padding: EdgeInsets.fromLTRB(250.0, 50.0, 5.0, 0.0),
        child: Text(
          'User Agreements.',
          style: TextStyle(color: Colors.lightBlue, decoration: TextDecoration.underline, decorationStyle: TextDecorationStyle.solid,),
      ),),
      Padding(
        padding: EdgeInsets.fromLTRB(270.0, 20.0, 20.0, 0.0),
        child: 
          RaisedButton(
            child: Text('NEXT', style: TextStyle(color: Colors.white)),
                  elevation: 5.0,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  onPressed: (){

                    Navigator.push(context,MaterialPageRoute(
                      builder: (context) => ConfirmPage()
                    ));
                    _setListofFile();
                    },
          ),
      )

        ],
      )
    );
  }
//Methods**********************************************************************************************************************************************
//Methods**********************************************************************************************************************************************
//Methods**********************************************************************************************************************************************


          void _showDatePicker(){
            _selectDate(context);
            // this.setState((){
            //   _dateTime = new DateTime.now();
            // });
          }
        
          
          Future<Null> _selectDate(BuildContext context) async{
            final DateTime _picked = await showDatePicker(
              context: context,
              initialDate: _dateTime,
              firstDate: new DateTime(2019),
              lastDate: new DateTime(2030)
            );

            if(_picked != null){
              print(_picked);
              setState(() {
                _dateTime =_picked;
              });
            }
          }
          

//           void getFilePath() async {
//             try {
//               String filePath = await FilePicker.getFilePath(type: FileType.ANY);
//               if (filePath == '') {
//                 return;
//               }
//               print("File path: " + filePath);
//               setState((){this._filePath = filePath;});
//             } on PlatformException catch (e) {
//               print("Error while picking the file: " + e.toString());
//             }
//             fp = _filePath;
//           }

          void initState() {
           super.initState();
            _controller.addListener(() => _extension = _controller.text);
          }

          void _openFileExplorer() async {
            if (_pickingType != FileType.CUSTOM || _hasValidMime) {
              try {
                if (_multiPick) {
                  _path = null;
                  _paths = await FilePicker.getMultiFilePath(type: _pickingType, fileExtension: _extension);
//                  _paths.forEach((k,v) => lof.add(File('$v')));
                } else {
                  _paths = null;
                  _path = await FilePicker.getFilePath(type: _pickingType, fileExtension: _extension);
//                  lof.add(new File(_path));
                }
              } on PlatformException catch (e) {
                print("Unsupported operation" + e.toString());
              }
              if (!mounted) return;

//              if(_path != null){
//                lof.add(new File(_path));
//              }else{
//                _paths.forEach((k,v) => lof.add(File('$v')));
//              }

              setState(() {
                _fileName = _path != null ? _path.split('/').last : _paths != null ? _paths.keys.toString() : '...';
//                if (_path != null)
              //_setListofFile();
              });
            }
            fp = _fileName;
          }

          void _setListofFile(){
              if(_path != null){
                File f0  = new File(_path);
                lof0.add(f0);
              }
              else{
                _paths.forEach((k,v) => lof0.add(File('$v')));
              }
          }



}

//****************************************************************************************************************************************************** */
//****************************************************************************************************************************************************** */
//****************************************************************************************************************************************************** */
//****************************************************************************************************************************************************** */
//****************************************************************************************************************************************************** */
//****************************************************************************************************************************************************** */



class ConfirmPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ConfirmPageState();
}

class ConfirmPageState extends State<ConfirmPage> {

//class ConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            semanticLabel: 'back1',
          ),
          onPressed: (){
            print('Back');
            Navigator.pop(context);

          },
        ),
        title: Text('Confirm Page'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.help_outline,
                color: Colors.white,
                semanticLabel: 'help1',
              ),
              onPressed: (){
                print('Help');
              },
            ),
          ],

      ),
      body: ListView(
        children: <Widget>[
          Row( children: <Widget>[
            Icon(Icons.code,color: Colors.blue,size: 35.0,),
            Text('Your Claiming Policy id :',style: TextStyle(fontSize: 20.0,color: Colors.blue,fontWeight: FontWeight.w700),),
          ],),
          Text('$policyid',style: TextStyle(fontSize: 25.0),textAlign: TextAlign.center,),

          Row( children: <Widget>[
            Icon(Icons.place,color: Colors.blue,size: 35.0,),
            Text('Location of the Accident :',style: TextStyle(fontSize: 20.0,color: Colors.blue,fontWeight: FontWeight.w700),),
          ],),
          Text('$aloca',style: TextStyle(fontSize: 25.0),textAlign: TextAlign.center,),

          Row( children: <Widget>[
            Icon(Icons.date_range,color: Colors.blue,size: 35.0,),
            Text('Date of the Accident :',style: TextStyle(fontSize: 20.0,color: Colors.blue,fontWeight: FontWeight.w700),),
          ],),
          Text(''+formatter.format(_dateTime),style: TextStyle(fontSize: 25.0),textAlign: TextAlign.center,),

          Row( children: <Widget>[
            Icon(Icons.monetization_on,color: Colors.blue,size: 35.0,),
            Text('Amount of Claim :',style: TextStyle(fontSize: 20.0,color: Colors.blue,fontWeight: FontWeight.w700),),
          ],),
          Text('$amt',style: TextStyle(fontSize: 25.0),textAlign: TextAlign.center,),

          Row( children: <Widget>[
            Icon(Icons.attach_file,color: Colors.blue,size: 35.0,),
            Text('Relavant Files :',style: TextStyle(fontSize: 20.0,color: Colors.blue,fontWeight: FontWeight.w700),),
          ],),
          Text('$fp',style: TextStyle(fontSize: 25.0),textAlign: TextAlign.center,),


          Row( children: <Widget>[
            Padding(
              padding:EdgeInsets.fromLTRB(70.0, 120.0, 20.0, 0.0),
              child:
            RaisedButton(child: Text('CANCEL', style: TextStyle(color: Colors.white)),
                  //elevation: 5.0,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  onPressed: (){  
                    Navigator.pop(context);
                  },),
            ),
            Padding(
              padding:EdgeInsets.fromLTRB(70.0, 120.0, 20.0, 0.0),
              child:
            RaisedButton(child: Text('SUBMIT', style: TextStyle(color: Colors.white)),
                  //elevation: 5.0,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  onPressed: (){  
                    _submitClaim();
                  },)
            ),
          ],),
          // Text('  Policy id : \n     $policyid',style: TextStyle(fontSize: 20.0),),
          // Text('  Location of the Accident : \n     $aloca',style: TextStyle(fontSize: 20.0),),
          // Text('  Amount of Claim : \n     $amt',style: TextStyle(fontSize: 20.0),),
        ],
      )
    );


  }

  void _submitClaim() {
      //print(apiRequest('http', new Claim(policyid, aloca, _dateTime, double.parse(amt), lof0, DateTime(2019), DateTime(2019)).toJson()));
        // flutter defined function
      showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Success !"),
              content: new Text("We will process your claim as soon as possible :)"),
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

}
