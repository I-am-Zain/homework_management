import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homework/pdf/Modal.dart';
import 'package:homework/pdf/secondPage.dart';
import 'package:homework/reFactor/HeadingData.dart';
import 'package:homework/reFactor/backGroundimage.dart';
import 'package:homework/reFactor/backgroundcolor.dart';
import 'package:homework/reFactor/logout_.dart';

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import '../constants.dart';
class Modal{
  String link,name;
  Modal(this.link,this.name);
}
// ignore: camel_case_types
class studentPanel extends StatefulWidget {
  studentPanel({
    Key key,
  }) : super(key: key);

  @override
  _studentPanelState createState() => _studentPanelState();
}

class _studentPanelState extends State<studentPanel> {


  PDFDocument doc;
  List<Modal> itemList=List();
  final mainReference = FirebaseDatabase.instance.reference().child('teacherUploaded');
  final studentReference = FirebaseDatabase.instance.reference().child('student_submission');
  @override
  Widget build(BuildContext context) {
    String data=ModalRoute.of(context).settings.arguments;

    ViewNow() async {
      doc = await PDFDocument.fromURL(
          data);
      setState(() {

      });
    }

    Widget Loading(){
      ViewNow();
      if(doc==null){
        return Text("..............Loading");
      }
    }

    return Scaffold(

      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          background_image(),
          background_color_gradient(),
          headWidget(),
          headText(),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(10.0, 180.0, 355.0, 540.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child: Container(
              child:itemList.length==0?Text("LOADING. . . . . "):ListView.builder(
                itemCount:itemList.length,
                itemBuilder: (context,index){
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: GestureDetector(
                        onTap: (){
                          String passData=itemList[index].link;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)=>ViewPdf(),
                                  settings: RouteSettings(
                                    arguments: passData,
                                  )
                              )
                          );

                        },

                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/ASSIGNMENT.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 70,
                                
                                  child: Card(
                                    margin: EdgeInsets.all(18),
                                    elevation: 7.0,
                                    child: Center(
                                      child: Text(itemList[index].name+" "+(index+1).toString()),
                                    ),
                                  ),

                              ),
                            ),
                          ],
                        ),
                      )
                  );
                },
              ),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: const Color(0xdee3e5e9),
                border: Border.all(width: 1.0, color: const Color(0xdef6f6f6)),
              ),
            ),
          ),
          logoutShape(),//logout shape
          logout_Icon(),//logout icon
          logout_text(),//logout text
          pageTitleText(
            text: Text("Student Profile", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          getPdfAndUpload();
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('File Uploaded')));
        },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.red,
      ),
    );
  }



  //////////////


  Future getPdfAndUpload()async{
    var rng = new Random();
    String randomName="";
    for (var i = 0; i < 20; i++) {
      print(rng.nextInt(100));
      randomName += rng.nextInt(100).toString();
    }
    File file = await FilePicker.getFile(type: FileType.custom);
    String fileName = '$randomName.pdf';
    savePdf(file.readAsBytesSync(), fileName);

    //function call
  }

  savePdf(List<int> asset, String name) async {
    StorageReference reference = FirebaseStorage.instance.ref().child(name);
    StorageUploadTask uploadTask = reference.putData(asset);
    String url = await (await uploadTask.onComplete).ref.getDownloadURL();
    documentFileUpload(url);
    //function call
  }

  // ignore: non_constant_identifier_names
  String CreateCryptoRandomString([int length = 32]) {
    final Random _random = Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
  }

  void documentFileUpload(String str) {
    var data = {
      "pdf": str,
      "FileName": "Assignment",
    };
    studentReference.child(CreateCryptoRandomString()).set(data).then((v) {
      print("Store Successfully");
    });
    setState(() {
      Fluttertoast.showToast(
          msg: "Solution Uploaded successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );

    });
  }

  //////////
  @override
  void initState() {
    mainReference.once().then((DataSnapshot snap){
      print(snap);
      var data=snap.value;
      print(data);
      // ignore: unnecessary_statements
      itemList.clear;
      data.forEach((key,value){
        Modal m=new Modal(value['pdf'], value['FileName']);
        itemList.add(m);

      });
      setState(() {
        // print ("Value is");
        // print (itemList.length);
      });
    });
  }


}




